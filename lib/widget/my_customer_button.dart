import 'package:flutter/material.dart';

class CustomElevatedButton {
  final String name;
  final double width;
  final double height;

  Future<void> Function()? cb;

  CustomElevatedButton({
    required this.width,
    required this.height,
    required this.name,
    required this.cb,
  });

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(onPressed: cb ?? () {}, child: Text(name)),
    );
  }
}
