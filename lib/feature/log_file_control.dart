import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

class LogFileControl {
  File? _logFile;
  IOSink? _logSink;
  Timer? _flushLogTimer; // Periodic flush timer
  final StringBuffer _logBuffer =
      StringBuffer(); // To store terminal output. // louiey

  late String _logLocalPath;
  late String _logFileName;

  late Duration _logFlushInterval;
  int maxLogBufferSize = 1024; // Flush when buffer reaches 1KB

  bool _isLogging = false; // Flag to indicate if logging is active

  /// localPath : The local path where the log file will be stored.
  /// logFileName : The name of the log file includes extension (ex: .log).
  /// logFlushInterval : The interval in milliseconds to flush the log buffer to disk.
  LogFileControl(String localPath, String logFileName, int logFlushInterval) {
    _logLocalPath = localPath;
    _logFileName = logFileName;
    _logFlushInterval = Duration(milliseconds: logFlushInterval);

    _logFile = null;
    _logSink = null;
    return;
  }

  String get logFilePath => _logLocalPath;
  String get logFileName => _logFileName;
  String get logFileFullPath => '$_logLocalPath\\$_logFileName';
  int get flushLogInterval => _logFlushInterval.inMilliseconds;
  bool get isLogging => _isLogging;

  // Open the log file
  Future<bool> open() async {
    try {
      if (_isLogging == false) {
        String fPath = '$_logLocalPath\\$_logFileName';
        _logFile = File(fPath);

        if (_logFile != null) {
          _logSink = _logFile!.openWrite(mode: FileMode.append);
          _startLogFlushTimer();
          log("Log file opened: $_logFile");
        } else {
          err("Log file is null");
          return true;
        }
        _isLogging = true;
        log("Log file open started: $_logFileName at $_logLocalPath");
        return true;
      } else {
        _isLogging = false;
        err("Log file is already open, please close it first.");
        return false;
      }
    } catch (e) {
      _isLogging = false;
      err("Log file open error!!!");
      err(e.toString());
      return false;
    }
  }

  Future<bool> close() async {
    try {
      if (_isLogging) {
        _stopLogFlushTimer();

        await _logSink!.flush();
        await _logSink!.close();

        _logSink = null;
        _logFile = null;
        _isLogging = false;
        log("Log file closed : $_logFileName at $_logLocalPath");
        return true;
      } else {
        err("Log file is not open, nothing to close.");
        return false;
      }
    } catch (e) {
      err("Log file close error!!!");
      err(e.toString());
      return false;
    }
  }

  Future<bool> update(String logBuffer) async {
    try {
      if (_logSink == null) {
        err("Log file sink is null, please open the log file first.");
        return false;
      }

      _logBuffer.write(logBuffer.toString());

      // Check if buffer exceeds size limit and flush if necessary
      if (_logBuffer.length >= maxLogBufferSize) {
        await _flushLogBuffer();
      }

      return true;
    } catch (e) {
      err("Log file update error!!!");
      err(e.toString());
      return false;
    }
  }

  // Start a timer to periodically flush the buffer
  void _startLogFlushTimer() {
    try {
      log("Log flushLogTimer started : $_logFlushInterval");
      _flushLogTimer = Timer.periodic(_logFlushInterval, (timer) {
        _flushLogBuffer();
      });
    } catch (e) {
      err("Log flushLogTimer start error!!!");
      err(e.toString());
    }
  }

  // Stop the timer when no longer needed
  void _stopLogFlushTimer() {
    try {
      if (_flushLogTimer != null && _flushLogTimer!.isActive) {
        _flushLogTimer!.cancel(); // Stop the timer
        _flushLogTimer = null; // release reference.
        log("Log flushLogTimer stopped : $_logFlushInterval");
      } else {
        err('Log flushLogTimer is not active!');
      }
      _logBuffer.clear();
    } catch (e) {
      err("Log flushLogTimer stop error!!!");
      err(e.toString());
    }
  }

  // Flush the buffer to disk asynchronously
  Future<void> _flushLogBuffer() async {
    if (_logBuffer.isNotEmpty) {
      _logSink?.write(_logBuffer.toString());
      _logBuffer.clear(); // Clear the buffer after writing
      // log("log saved");
    }
  }

  // Check if buffer exceeds size limit and flush if necessary
  // void checkBufferAndFlush() {
  //   if (_logBuffer.length >= maxLogBufferSize) {
  //     flushLogBuffer();
  //   }
  // }

  // print
  log(String str) {
    if (kDebugMode) {
      debugPrint(str);
    }
  }

  err(String str) {
    if (kDebugMode) {
      debugPrint("[LOG ERROR] : $str");
    }
  }
}
