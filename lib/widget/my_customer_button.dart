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

class CustomElevatedRouter extends StatelessWidget {
  final String text;
  // final VoidCallback onPressed;
  final Color color;
  final Widget cbWidget;

  const CustomElevatedRouter({
    super.key,
    required context,
    required this.text,
    // required this.onPressed,
    required this.cbWidget,
    this.color = Colors.blue,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => cbWidget),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }
}
