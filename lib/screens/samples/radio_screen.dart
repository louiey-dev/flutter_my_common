import 'package:flutter/material.dart';
import 'package:flutter_my_common/my_utils.dart';

enum Animal { DOG, CAT, PENGUIN, FISH }

enum Gender { MAN, WOMAN }

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key});

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  Animal _animal = Animal.DOG;
  Gender _gender = Gender.MAN;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Button Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          radioListTileScreen(),
          const SizedBox(height: 20),
          listTileWithRadio(),
        ],
      ),
    );
  }

  radioListTileScreen() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: const Text(
              "RadioListTile",
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: RadioListTile(
                  title: Text("Dog"),
                  value: Animal.DOG,
                  groupValue: _animal,
                  onChanged: (Animal? value) {
                    setState(() {
                      _animal = value!;
                      utils.log("Dog clicked");
                      utils.showSnackbarMs(context, 500, "Dog clicked");
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  title: Text("Cat"),
                  value: Animal.CAT,
                  groupValue: _animal,
                  onChanged: (Animal? value) {
                    setState(() {
                      _animal = value!;
                      utils.log("Cat clicked");
                      utils.showSnackbarMs(context, 500, "Cat clicked");
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  title: Text("Penguin"),
                  value: Animal.PENGUIN,
                  groupValue: _animal,
                  onChanged: (Animal? value) {
                    setState(() {
                      _animal = value!;
                      utils.log("Penguin clicked");
                      utils.showSnackbarMs(context, 500, "Penguin clicked");
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  title: Text("Fish"),
                  value: Animal.FISH,
                  groupValue: _animal,
                  onChanged: (Animal? value) {
                    setState(() {
                      _animal = value!;
                      utils.log("Fish clicked");
                      utils.showSnackbarMs(context, 500, "Fish clicked");
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  listTileWithRadio() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: const Text(
              "ListTile with Radio",
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: ListTile(
                  title: const Text("Man"),
                  leading: Radio(
                    value: Gender.MAN,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                        utils.log("Man clicked");
                        utils.showSnackbarMs(context, 500, "Man clicked");
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                child: ListTile(
                  title: const Text("Woman"),
                  leading: Radio(
                    value: Gender.WOMAN,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                        utils.log("Woman clicked");
                        utils.showSnackbarMs(context, 500, "Woman clicked");
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
