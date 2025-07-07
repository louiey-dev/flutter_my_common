import 'package:flutter/material.dart';
import 'package:flutter_my_common/my_utils.dart';

class ListTileScreen extends StatefulWidget {
  const ListTileScreen({super.key});

  @override
  State<ListTileScreen> createState() => _ListTileScreenState();
}

class _ListTileScreenState extends State<ListTileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Widget Example')),
      body: Center(
        child: Column(children: [_expansionTileScreen(), _listTileScreen()]),
      ),
    );
  }

  _listTileScreen() {
    return Container(
      height: 500.0,
      alignment: Alignment.center,
      color: Colors.green[100],
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            subtitle: const Text('View and edit your profile'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Action when tapped
              utils.log("Profile tapped!");
              utils.showSnackbarMs(context, 300, "Profile tapped");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            subtitle: const Text('Adjust your preferences'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Action when tapped
              utils.log("Settings tapped!");
              utils.showSnackbarMs(context, 300, "Settings tapped");
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            subtitle: const Text('Get assistance and support'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Action when tapped
              utils.log("Help tapped!");
              utils.showSnackbarMs(context, 300, "Help tapped");
            },
          ),
        ],
      ),
    );
  }

  _expansionTileScreen() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        color: Colors.grey,
        child: ExpansionTile(
          title: const Text("Expansion tile 더 보기"),
          leading: Icon(Icons.info),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text("확장된 내용이 여기에 표시됩니다"),
            ),
          ],
        ),
      ),
    );
  }
}
