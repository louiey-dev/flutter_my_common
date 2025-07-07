import 'package:flutter/material.dart';
import 'package:flutter_my_common/my_utils.dart';

class InkWellScreen extends StatefulWidget {
  const InkWellScreen({super.key});

  @override
  State<InkWellScreen> createState() => _InkWellScreenState();
}

class _InkWellScreenState extends State<InkWellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InkWell Screen')),
      body: Center(
        child: InkWell(
          onTap: () {
            utils.log('탭 감지됨');
          },
          splashColor: Colors.blue.withOpacity(0.5),
          highlightColor: Colors.blue.withOpacity(0.2),
          child: Container(
            width: 200,
            height: 100,
            alignment: Alignment.center,
            child: Text('터치해보세요'),
          ),
        ),
      ),
    );
  }
}
