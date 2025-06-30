import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_common/screens/button_screen.dart';
import 'package:flutter_my_common/widget/my_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

import '../my_utils.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool _lights = false;

  bool _switch = false;
  bool _cupertinoChecked = false;
  // This object sets amber as the track color when the switch is selected.
  // Otherwise, it resolves to null and defers to values from the theme data.
  WidgetStateProperty<Color?> trackColor = WidgetStateProperty<Color?>.fromMap(
    <WidgetStatesConstraint, Color>{WidgetState.selected: Colors.amber},
  );
  // This object sets the track color based on two WidgetState attributes.
  // If neither state applies, it resolves to null.
  final WidgetStateProperty<Color?> overlayColor =
      WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
        WidgetState.selected: Colors.amber.shade200,
        WidgetState.disabled: Colors.grey.shade400,
      });

  List<String> _label = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Switch Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        myHEIGHT(20),
        SwitchListTile(
          title: const Text('SwitchListTile'),
          value: _lights,
          onChanged: (bool value) {
            setState(() {
              _lights = value;
            });
            utils.log("Lights switched to : $value");
            utils.showSnackbarMs(context, 500, "Lights switched to: $value");
          },
          secondary: const Icon(Icons.lightbulb_outline),
        ),
        Row(
          children: [
            myWIDTH(10),
            Switch(
              // This bool value toggles the switch.
              value: _switch,
              overlayColor: overlayColor,
              trackColor: trackColor,
              thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  _switch = value;
                });
                utils.log("Switched to : $value");
                utils.showSnackbarMs(context, 500, "Switched to: $value");
              },
            ),
            myWIDTH(10),
            Text("Material Switch"),
            myWIDTH(80),
            CupertinoSwitch(
              value: _cupertinoChecked,
              onChanged: (value) {
                setState(() {
                  _cupertinoChecked = value;
                });
              },
            ),
            myWIDTH(10),
            Text("Cupertino Switch"),
          ],
        ),
        myHEIGHT(10),
        Row(
          children: [
            myWIDTH(10),
            Text("Toggle Switch"),
            myWIDTH(10),
            ToggleSwitch(
              initialLabelIndex: 0,
              totalSwitches: 3,
              labels: ['America', 'Canada', 'Mexico'],
              onToggle: (index) {
                utils.showSnackbarMs(
                  context,
                  100,
                  "Toggle switched to: $index",
                );
                utils.log("Toggle switched to: $index");
              },
            ),
            myWIDTH(20),
            ToggleSwitch(
              minWidth: 90.0,
              initialLabelIndex: 1,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              // labels: ['Male', 'Female'],
              labels: _label,
              icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
              activeBgColors: [
                [Colors.blue],
                [Colors.pink],
              ],
              onToggle: (index) {
                utils.showSnackbarMs(
                  context,
                  300,
                  "Toggle switched to: ${_label[index!]}",
                );
                utils.log("Toggle switched to: ${_label[index]}");
              },
            ),
          ],
        ),
        myHEIGHT(10),
        Row(
          children: [
            myWIDTH(10),
            Text("Toggle Switch"),
            myWIDTH(10),
            ToggleSwitch(
              minWidth: 90.0,
              minHeight: 70.0,
              initialLabelIndex: 0,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 3,
              icons: [
                FontAwesomeIcons.facebook,
                FontAwesomeIcons.twitter,
                FontAwesomeIcons.instagram,
              ],
              iconSize: 30.0,
              borderColor: [
                Color(0xff3b5998),
                Color(0xff8b9dc3),
                Color(0xff00aeff),
                Color(0xff0077f2),
                Color(0xff962fbf),
                Color(0xff4f5bd5),
              ],
              dividerColor: Colors.blueGrey,
              activeBgColors: [
                [Color(0xff3b5998), Color(0xff8b9dc3)],
                [Color(0xff00aeff), Color(0xff0077f2)],
                [
                  Color(0xfffeda75),
                  Color(0xfffa7e1e),
                  Color(0xffd62976),
                  Color(0xff962fbf),
                  Color(0xff4f5bd5),
                ],
              ],
              onToggle: (index) {
                utils.showSnackbarMs(
                  context,
                  300,
                  "Toggle switched to : $index",
                );
                utils.log("Toggle switched to : $index");
              },
            ),
          ],
        ),
        myHEIGHT(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            myWIDTH(10),
            ElevatedButton.icon(
              onPressed: () {
                _launchUrl(_url_toggle);
              },
              icon: Icon(Icons.launch),
              label: Text("toggle_switch widgets in pub.dev"),
            ),
          ],
        ),
        myHEIGHT(20),
        Row(
          children: [
            myWIDTH(10),
            Text("GetWidget iOS toggle"),
            myWIDTH(10),
            GFToggle(
              onChanged: (val) {
                utils.showSnackbarMs(
                  context,
                  300,
                  "iOS Toggle switched to : $val",
                );
                utils.log("iOS Toggle switched to : $val");
              },
              value: true,
              type: GFToggleType.ios,
            ),
            myWIDTH(10),
            Text("square toggle"),
            myWIDTH(10),
            GFToggle(
              onChanged: (val) {
                utils.showSnackbarMs(
                  context,
                  300,
                  "iOS Toggle switched to : $val",
                );
                utils.log("iOS Toggle switched to : $val");
              },
              value: true,
              type: GFToggleType.square,
            ),
            myWIDTH(10),
            Text("Custom toggle"),
            myWIDTH(10),
            GFToggle(
              onChanged: (val) {
                utils.showSnackbarMs(
                  context,
                  300,
                  "Custom Toggle switched to : $val",
                );
                utils.log("Custom Toggle switched to : $val");
              },
              value: true,
              type: GFToggleType.custom,
            ),
          ],
        ),
        myHEIGHT(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            myWIDTH(10),
            ElevatedButton.icon(
              onPressed: () {
                _launchUrl(_url_getwidget);
              },
              icon: Icon(Icons.launch),
              label: Text("getwidget has more widgets in pub.dev"),
            ),
          ],
        ),
      ],
    );
  }

  final Uri _url_getwidget = Uri.parse('https://pub.dev/packages/getwidget');
  final Uri _url_toggle = Uri.parse('https://pub.dev/packages/toggle_switch');
  Future<void> _launchUrl(Uri _uri) async {
    try {
      if (!await launchUrl(_uri, mode: LaunchMode.externalApplication)) {
        utils.err('Could not launch $_uri');
      }
    } catch (e) {
      utils.log("Error launching URL: $e");
      return;
    }
  }
}
