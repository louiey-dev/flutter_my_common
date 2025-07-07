import 'package:flutter/material.dart';
import 'package:flutter_my_common/screens/button_screen.dart';
import 'package:flutter_my_common/screens/chart_screen.dart';
import 'package:flutter_my_common/screens/etc_screen.dart';
import 'package:flutter_my_common/screens/event_screen.dart';
import 'package:flutter_my_common/screens/feature_screen.dart';
import 'package:flutter_my_common/screens/preference_chart.dart';
import 'package:flutter_my_common/screens/switch_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'My Common Items for Reference',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Common Items for Reference'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List myScreens = [
    ButtonScreen(),
    SwitchScreen(),
    EtcScreen(),
    ChartScreen(),
    PreferenceScreen(),
    FeatureScreen(),
    EventScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: myScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // louiey. Over 3 screen fix
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_on),
            label: "Button",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.toggle_on_outlined),
            label: "Switch",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "UI Etc",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_outlined),
            label: "Chart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications_outlined),
            label: "Preference",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            label: "Feature",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label: "Event",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
