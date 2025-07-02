import 'package:flutter/material.dart';
import 'package:flutter_my_common/feature/thermal_image.dart';
import 'package:flutter_my_common/screens/log_screen.dart';
import 'package:flutter_my_common/widget/my_widget.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogScreen()),
              );
            },
            icon: const Icon(Icons.save_alt),
            label: const Text("Log Screen"),
          ),
          myHEIGHT(10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThermalImage()),
              );
            },
            icon: const Icon(Icons.thermostat_auto_outlined),
            label: const Text("Thermal Image"),
          ),
        ],
      ),
    );
  }
}
