import 'package:flutter/material.dart';
import 'package:flutter_my_common/my_utils.dart';
import 'package:flutter_my_common/widget/my_customer_button.dart';
import 'package:flutter_my_common/widget/my_widget.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          // Container(color: Colors.black, child: WIDTH(20)),
          WIDTH(20),

          // ElevatedButton
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  utils.log("ElevatedButton clicked!!!");
                },
                child: const Text("Elevated Button"),
              ),
              HEIGHT(10),
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
              HEIGHT(10),
              const CustomElevatedButton(
                width: 80,
                height: 30,
                name: "Test",
                cb: Text("Clicked!!!"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
