import 'package:flutter/material.dart';
import 'package:flutter_my_common/my_utils.dart';
import 'package:flutter_my_common/widget/my_widget.dart';
import 'package:url_launcher/url_launcher.dart';

const List<Widget> fruits = <Widget>[
  Text('Apple'),
  Text('Banana'),
  Text('Orange'),
];

const List<Widget> vegetables = <Widget>[
  Text('Tomatoes'),
  Text('Potatoes'),
  Text('Carrots'),
];

const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

final Uri _url = Uri.parse(
  'https://medium.getwidget.dev/top-10-flutter-button-widgets-with-example-codes-fff7d473ecf0',
);

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  final List<bool> _selectedFruits = <bool>[true, false, false];

  final List<bool> _selectedVegetables = <bool>[false, true, false];

  final List<bool> _selectedWeather = <bool>[false, false, true];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Text(
            "Button Screen",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          myHEIGHT(20),

          /// Elevated Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  utils.log("ElevatedButton clicked!!!");
                },
                child: const Text("Elevated Button"),
              ),
              myWIDTH(10),
              ElevatedButton(
                onPressed: () {
                  utils.log("ElevatedButton Rectangle clicked!!!");
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  elevation: 1.0, // louiey. Shadow
                  backgroundColor: Colors.amber,
                ),
                child: const Text("Elevated Rectangle"),
              ),
              myHEIGHT(10),
            ],
          ),
          myHEIGHT(10),

          /// Text Buttons
          Row(
            children: [
              TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.focused)) {
                      return Colors.red;
                    }
                    return null; // Defer to the widget's default.
                  }),
                ),
                onPressed: () {
                  utils.log("TextButton Pressed");
                },
                child: Text('TextButton'),
              ),
            ],
          ),
          myHEIGHT(10),

          /// Outlined Buttons
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  utils.log("OutlinedButton Pressed");
                },
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
                child: const Text('Outlined Button'),
              ),
            ],
          ),
          myHEIGHT(10),

          /// Toggle Buttons
          Row(
            children: [
              Text('Toggle Button '),
              Text('Single-select', style: TextStyle(color: Colors.red)),
              myWIDTH(10),
              ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedFruits.length; i++) {
                      _selectedFruits[i] = i == index;
                    }
                  });
                  utils.log("Selected ${fruits[index].toString()}");
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
                isSelected: _selectedFruits,
                children: fruits,
              ),
            ],
          ),
          myHEIGHT(10),
          Row(
            children: [
              Text('Toggle Button '),
              Text('Multi-select ', style: TextStyle(color: Colors.red)),
              myWIDTH(10),
              ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  // All buttons are selectable.
                  setState(() {
                    _selectedVegetables[index] = !_selectedVegetables[index];
                  });
                  for (int i = 0; i < _selectedVegetables.length; i++) {
                    if (_selectedVegetables[i] == true) {
                      utils.log("Selected ${vegetables[i].toString()}");
                    }
                  }
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.green[700],
                selectedColor: Colors.white,
                fillColor: Colors.green[200],
                color: Colors.green[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedVegetables,
                children: vegetables,
              ),
            ],
          ),
          myHEIGHT(10),
          Row(
            children: [
              Text('Toggle Button '),
              Text('Icon-only     ', style: TextStyle(color: Colors.red)),
              myWIDTH(10),
              ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedWeather.length; i++) {
                      _selectedWeather[i] = i == index;
                    }
                    utils.log("Selected icon ${icons[index]}");
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.blue[700],
                selectedColor: Colors.white,
                fillColor: Colors.blue[200],
                color: Colors.blue[400],
                isSelected: _selectedWeather,
                children: icons,
              ),
            ],
          ),
          myHEIGHT(10),
          Row(
            children: [
              Text("Icon Button"),
              myWIDTH(10),
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.android),
                  color: Colors.white,
                  onPressed: () {
                    utils.log("Decorated IconButton Pressed");
                  },
                ),
              ),
              myWIDTH(10),
              IconButton.outlined(
                // isSelected: outlinedSelected,
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                onPressed: () {
                  utils.log("IconButton.outlined Pressed");
                },
              ),
              myWIDTH(10),
              IconButton(
                icon: const Icon(Icons.filter_drama),
                onPressed: () {
                  utils.log("IconButton Pressed");
                },
              ),
            ],
          ),
          myHEIGHT(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: _launchUrl,
                icon: Icon(Icons.launch),
                label: Text("Show more customizable buttons in pub.dev"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    try {
      if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
        utils.err('Could not launch $_url');
      }
    } catch (e) {
      utils.log("Error launching URL: $e");
      return;
    }
  }
}
