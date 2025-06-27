import 'package:flutter/material.dart';
import 'package:flutter_my_common/feature/event_control.dart';
import 'package:flutter_my_common/main.dart';

import '../my_utils.dart';

int eventTestId = 42;

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Event Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              utils.log("Start waiting for event");

              if (_isChecked) {
                utils.log("Showing progress indicator");
                showDialog(
                  context: navigatorKey.currentContext!,
                  barrierDismissible: false,
                  builder:
                      (context) => Center(child: CircularProgressIndicator()),
                );
              }

              try {
                final future = await waitForEvent(
                  duration: Duration(seconds: 5),
                  filter: (event) => event.id == eventTestId,
                  onTimeout: () => MyEvent(-1),
                );

                if (future.id == -1) {
                  utils.log("Timeout occurred, no event received.");
                } else {
                  utils.log("received event with id : ${future.id}");
                }
              } catch (e) {
                utils.log("Timeout or error: $e");
              } finally {
                if (_isChecked) {
                  Navigator.of(
                    navigatorKey.currentContext!,
                  ).pop(); // Remove the loading dialog
                }
              }

              // final event = await future;
            },
            child: const Text('Event Wait'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              utils.log("Event set done");
              controller.add(MyEvent(eventTestId)); // <-- This "sets" the event
            },
            child: const Text('Event Set'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
              const Text("Show Progress Indicator"),
            ],
          ),
        ],
      ),
    );
  }
}
