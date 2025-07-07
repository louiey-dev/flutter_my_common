import 'package:flutter/material.dart';

class ProgressIndicatorScreen extends StatefulWidget {
  const ProgressIndicatorScreen({super.key});

  @override
  State<ProgressIndicatorScreen> createState() =>
      _ProgressIndicatorScreenState();
}

class _ProgressIndicatorScreenState extends State<ProgressIndicatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProgressIndicator Widget Example')),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("CircularProgressIndicator"),
            const SizedBox(height: 20), // 간격 추가
            // 원형 진행 표시기
            CircularProgressIndicator(
              // value: 0.5, // null이면 불확정 진행 표시기
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 20), // 간격 추가
            const Text("LinearProgressIndicator"),
            const SizedBox(height: 20),
            // 선형 진행 표시기
            LinearProgressIndicator(
              // value: 0.7,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
