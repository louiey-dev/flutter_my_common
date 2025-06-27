import 'package:flutter/material.dart';
import 'package:flutter_my_common/feature/log_file_control.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../my_utils.dart';

LogFileControl? lfc;

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  // Get the local path for the application's documents directory
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Get current date and time
  DateTime now = DateTime.now();
  String formattedDate = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            utils.log("Back to previous screen");
          },
          icon: Icon(Icons.arrow_back),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            formattedDate = DateFormat('yyyyMMdd_HHmmss').format(now);
            String logFileName = "log_$formattedDate.log";
            localPath
                .then((path) {
                  if (lfc == null) {
                    lfc = LogFileControl(path, logFileName, 1000);
                    lfc?.open();
                    utils.log("Log file opened at: ${lfc!.logFileFullPath}");
                    utils.log("Log file control is null, initializing...");
                  } else {
                    utils.log("Log file control already initialized.");
                    return;
                  }
                })
                .catchError((error) {
                  utils.log("Error getting local path: $error");
                });

            utils.log("Log file opened, $logFileName");
          },
          child: const Text("Open Log File"),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (lfc != null) {
              lfc?.update("Log file updated at: ${DateTime.now()}\n");
              utils.log("Log file updated");
            } else {
              utils.err(
                "Log file control is not initialized. Please open the log file first.",
              );
            }
          },
          child: const Text("Log update"),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (lfc != null) {
              lfc?.close();
              utils.log("Log file closed");
            } else {
              utils.err(
                "Log file control is not initialized. Please open the log file first.",
              );
            }
          },
          child: const Text("Close Log File"),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
