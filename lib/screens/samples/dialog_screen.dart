import 'package:flutter/material.dart';
import 'package:flutter_my_common/widget/my_widget.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Widget Example')),
      body: Column(
        children: [
          Text("Dialog", style: TextStyle(fontSize: 24)),
          myHEIGHT(20),
          // AlertDialog
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('확인'),
                    content: Text('정말 삭제하시겠습니까?'),
                    actions: [
                      TextButton(
                        child: Text('취소'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('삭제'),
                        onPressed: () {
                          // 삭제 작업 수행
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Show Two option buttons Alert Dialog'),
          ),
          myHEIGHT(20),
          ElevatedButton(
            onPressed: () {
              // SimpleDialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: Text('옵션 선택'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, '옵션 1');
                        },
                        child: Text('옵션 1'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, '옵션 2');
                        },
                        child: Text('옵션 2'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Simple option buttons Dialog"),
          ),
        ],
      ),
    );
  }
}
