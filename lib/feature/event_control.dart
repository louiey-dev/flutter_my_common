import 'dart:async';

class MyEvent {
  final int id;
  MyEvent(this.id);
}

final controller = StreamController<MyEvent>.broadcast();

Function on<E>(void Function(E) callback, {bool Function(E)? filter}) {
  final subscription = controller.stream
      .where((event) {
        if (event is! E) return false;
        if (filter != null) return filter(event as E);
        return true;
      })
      .listen((event) => callback(event as E));
  return () => subscription.cancel();
}

Future<E> waitForEvent<E>({
  required Duration duration,
  bool Function(E)? filter,
  FutureOr<E> Function()? onTimeout,
}) async {
  final completer = Completer<E>();
  final cancelFunc = on<E>((event) {
    if (!completer.isCompleted) {
      completer.complete(event);
    }
  }, filter: filter);
  try {
    return await completer.future.timeout(
      duration,
      onTimeout: onTimeout ?? () => throw TimeoutException("timeout"),
    );
  } finally {
    await cancelFunc.call();
  }
}

/// Waits for an event indefinitely until it is received.
Future<E> waitForEventForever<E>({bool Function(E)? filter}) async {
  final completer = Completer<E>();
  final cancelFunc = on<E>((event) {
    if (!completer.isCompleted) {
      completer.complete(event);
    }
  }, filter: filter);
  try {
    return await completer.future;
  } finally {
    await cancelFunc.call();
  }
}
