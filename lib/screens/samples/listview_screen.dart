import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Screen')),
      body: Column(
        children: [
          const Text(
            "Simple ListView Examples",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // 기본 ListView
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  ListTile(title: Text('항목 1')),
                  ListTile(title: Text('항목 2')),
                  ListTile(title: Text('항목 3')),
                ],
              ),
            ),
          ),

          const Text(
            "ListView Builder Examples",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // 빌더 패턴 (효율적인 렌더링)
          Expanded(
            child: Container(
              color: Colors.green[100],
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(title: Text('항목 $index'));
                },
              ),
            ),
          ),

          const Text(
            "Simple ListView Separated Examples",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // 구분선이 있는 ListView
          Expanded(
            child: Container(
              color: Colors.blue[100],
              child: ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(title: Text('항목 $index'));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
