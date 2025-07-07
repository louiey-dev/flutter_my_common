import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_common/my_utils.dart';
import 'package:flutter_my_common/widget/my_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackBarScreen extends StatefulWidget {
  SnackBarScreen({super.key});

  @override
  State<SnackBarScreen> createState() => _SnackBarScreenState();
}

class _SnackBarScreenState extends State<SnackBarScreen> {
  final List<Widget> _returnStatus = <Widget>[
    Text('fail'),
    Text('success'),
    Text('help'),
    Text('warning'),
  ];

  final List<String> _returnString = ['fail', 'success', 'help', 'warning'];
  final List<bool> _selectedReturn = <bool>[true, false, false, false];

  late AnimationController localAnimationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar Widget Example')),
      body: Center(
        child: Column(
          children: [
            _awesomeSnackbarScreen(context),
            myHEIGHT(20),
            _topSnackbarFlutterScreen(context),
            myHEIGHT(20),
          ],
        ),
      ),
    );
  }

  _awesomeSnackbarScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Awesome Snackbar", style: TextStyle(fontSize: 20)),
        myHEIGHT(20),
        Row(
          children: [
            myWIDTH(20),
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                List<ContentType> errType = [
                  ContentType.failure,
                  ContentType.success,
                  ContentType.help,
                  ContentType.warning,
                ];
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedReturn.length; i++) {
                    _selectedReturn[i] = i == index;
                  }
                  var snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'On Snap! ${_returnString[index]}',
                      message:
                          'This is an example ${_returnString[index]} message that will be shown in the body of snackbar!',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: errType[index],
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                });
                utils.log("Selected ${_returnStatus[index].toString()}");
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.red[700],
              selectedColor: Colors.white,
              fillColor: Colors.red[200],
              color: Colors.red[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedReturn,
              children: _returnStatus,
            ),
          ],
        ),
      ],
    );
  }

  final List<Widget> _returnTopStatus = <Widget>[
    Text('Success'),
    Text('Info'),
    Text('Error'),
    Text('Persistent'),
  ];
  final List<bool> _selectedTopReturn = <bool>[true, false, false, false];

  _topSnackbarFlutterScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Top Snackbar Flutter", style: TextStyle(fontSize: 20)),
        myHEIGHT(20),
        Row(
          children: [
            myWIDTH(20),
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedTopReturn.length; i++) {
                    _selectedTopReturn[i] = i == index;
                  }

                  switch (index) {
                    case 0:
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message:
                              "Good job, your release is successful. Have a nice day",
                        ),
                      );
                      break;
                    case 1:
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.info(
                          message:
                              "There is some information. You need to do something with that",
                        ),
                      );
                      break;
                    case 2:
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          message:
                              "Something went wrong. Please check your credentials and try again",
                        ),
                      );
                      break;
                    case 3:
                      break;
                    default:
                  }
                });
                utils.log("Selected ${_returnTopStatus[index].toString()}");
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.red[700],
              selectedColor: Colors.white,
              fillColor: Colors.red[200],
              color: Colors.red[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedTopReturn,
              children: _returnTopStatus,
            ),
          ],
        ),
      ],
    );
  }
}
