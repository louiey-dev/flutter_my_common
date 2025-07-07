import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Widget Example')),
      body: Center(
        child: Card(
          elevation: 10.0,
          // margin: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'This is a Card Widget',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text('You can put any content inside a card.'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Action when button is pressed
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Button Pressed!')),
                    );
                  },
                  child: const Text('Press Me'),
                ),
                const SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.all(16.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                'https://example.com/avatar.jpg',
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '홍길동',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '프론트엔드 개발자',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          '모바일 앱과 웹 개발에 관심이 많은 개발자입니다. Flutter와 React를 주로 사용합니다.',
                        ),
                        SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: [
                            Chip(label: Text('Flutter')),
                            Chip(label: Text('Dart')),
                            Chip(label: Text('Firebase')),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '156',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('게시물'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '572',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('팔로워'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '128',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('팔로잉'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('팔로우'),
                              ),
                            ),
                            SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('메시지'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
