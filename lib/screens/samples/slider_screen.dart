import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _currentValue = 0.0;
  double _currentWoValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_continuousSlider(), _discreteSlider()],
        ),
      ),
    );
  }

  _discreteSlider() {
    return Column(
      children: [
        Container(
          color: Colors.green[100],
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Slider without division\nThis is discrete slider which cannot display label when division is disabled',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Slider(
                value: _currentWoValue,
                min: 0,
                max: 100,
                label: _currentWoValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentWoValue = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  _continuousSlider() {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Slider with division\nThis is continuous slider which can display label when division is enabled',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Slider(
                value: _currentValue,
                min: 0,
                max: 100,
                divisions: 10,
                label: _currentValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
