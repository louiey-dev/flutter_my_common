import 'package:flutter/material.dart';
import 'package:flutter_my_common/my_utils.dart';
import 'package:flutter_my_common/widget/my_widget.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        myWIDTH(20),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                utils.log("ElevatedButton clicked!!!");
              },
              child: const Text("Elevated Button"),
            ),
            myHEIGHT(10),
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
      ],
    );
  }
}
