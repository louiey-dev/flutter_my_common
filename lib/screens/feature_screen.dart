import 'package:flutter/material.dart';
import 'package:flutter_my_common/screens/log_screen.dart';

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
        ],
      ),
    );
  }
}
