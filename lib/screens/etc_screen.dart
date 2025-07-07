import 'package:flutter/material.dart';
import 'package:flutter_my_common/my_utils.dart';
import 'package:flutter_my_common/screens/samples/card_screen.dart';
import 'package:flutter_my_common/screens/samples/dialog_screen.dart';
import 'package:flutter_my_common/screens/samples/gesture_detector.dart';
import 'package:flutter_my_common/screens/samples/grid_view_screen.dart';
import 'package:flutter_my_common/screens/samples/inkwell_screen.dart';
import 'package:flutter_my_common/screens/samples/listtile_screen.dart';
import 'package:flutter_my_common/screens/samples/listview_screen.dart';
import 'package:flutter_my_common/screens/samples/progress_indicator.dart';
import 'package:flutter_my_common/screens/samples/radio_screen.dart';
import 'package:flutter_my_common/screens/samples/slider_screen.dart';
import 'package:flutter_my_common/screens/samples/snackbar_screen.dart';
import 'package:flutter_my_common/widget/my_customer_button.dart';

enum Char { A, B, C, D }

class EtcScreen extends StatefulWidget {
  const EtcScreen({super.key});

  @override
  State<EtcScreen> createState() => _EtcScreenState();
}

class _EtcScreenState extends State<EtcScreen> {
  bool _cbChecked = false;
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: const Text(
            'Etc Widget Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        // CheckBox
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Checkbox(
                value: _cbChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _cbChecked = value!;
                    utils.log("cb clicked $_cbChecked");
                    utils.showSnackbarMs(
                      context,
                      500,
                      "cb clicked $_cbChecked",
                    );
                  });
                },
                activeColor: Colors.blue,
              ),
              const SizedBox(width: 10),
              const Text('Checkbox'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10.0,
          runSpacing: 20.0,
          children: [
            CustomElevatedRouter(
              context: context,
              text: "Radio Button1",
              cbWidget: RadioButtonScreen(),
              color: Colors.amberAccent,
            ),
            ElevatedButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "Slider clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SliderScreen()),
                );
              },
              child: const Text("Slider"),
            ),
            OutlinedButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "Card clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardScreen()),
                );
              },
              child: const Text("Card"),
            ),
            TextButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "ListTile clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListTileScreen()),
                );
              },
              child: const Text("ListTile"),
            ),
            ElevatedButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "SnackBar clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SnackBarScreen()),
                );
              },
              child: Text("SnackBar"),
            ),
            TextButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "Dialog clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DialogScreen()),
                );
              },
              child: Text("Dialog"),
            ),
            OutlinedButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "ProgressIndicator clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgressIndicatorScreen(),
                  ),
                );
              },
              child: Text("ProgressIndicator"),
            ),
            ElevatedButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "GestureDetector clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GestureDetectorScreen(),
                  ),
                );
              },
              child: Text("GestureDetector"),
            ),
            TextButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "Inkwell clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InkWellScreen()),
                );
              },
              child: Text("Inkwell"),
            ),
            ElevatedButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "ListView clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewScreen()),
                );
              },
              child: const Text("ListView"),
            ),
            OutlinedButton(
              onPressed: () {
                utils.showSnackbarMs(context, 500, "GridView clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewScreen()),
                );
              },
              child: const Text("GridView"),
            ),
          ],
        ),
      ],
    );
  }
}
