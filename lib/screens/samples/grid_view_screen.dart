import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid View Screen')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // 기본 그리드
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // 열 개수
                mainAxisSpacing: 4.0, // 세로 간격
                crossAxisSpacing: 4.0, // 가로 간격
                padding: EdgeInsets.all(4.0),
                children: List.generate(
                  30,
                  (index) => Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(child: Text('$index')),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 빌더 패턴
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blue[(index % 9 + 1) * 100],
                    child: Center(child: Text('항목 $index')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
