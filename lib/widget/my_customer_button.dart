import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final String name;
  final dynamic cb;

  const CustomElevatedButton({
    super.key,
    required this.width,
    required this.height,
    required this.name,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          cb;
        },
        child: Text(name),
      ),
    );
  }
}
