import 'package:flutter/material.dart';
import 'package:flutter_my_common/feature/chart_bar.dart';
import 'package:flutter_my_common/feature/chart_line.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';
import 'package:getwidget/components/tabs/gf_tabs.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen>
    with SingleTickerProviderStateMixin {
  late TabController chartTabController;

  @override
  void initState() {
    super.initState();
    chartTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GFTabs(
      // indicatorPadding: const EdgeInsets.all(1),
      // tabBarHeight: 60,
      tabBarColor: Colors.redAccent,
      indicatorWeight: 4,
      controller: chartTabController,
      length: 3,
      tabs: <Widget>[
        Tab(icon: Icon(Icons.line_axis), child: Text("Line")),
        Tab(icon: Icon(Icons.bar_chart), child: Text("Bar")),
        Tab(icon: Icon(Icons.pie_chart), child: Text("Pie")),
      ],
      tabBarView: GFTabBarView(
        controller: chartTabController,
        children: <Widget>[
          Container(color: Colors.green[100], child: LineChartSample1()),
          Container(color: Colors.orange, child: BarChartSample1()),
          Container(color: Colors.blue, child: Icon(Icons.pie_chart)),
        ],
      ),
    );
  }
}
