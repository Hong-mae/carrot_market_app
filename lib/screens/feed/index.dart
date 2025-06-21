import 'dart:math';

import 'package:carrot_market_app/widgets/buttons/category_btn.dart';
import 'package:carrot_market_app/widgets/listitems/feed_list_item.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<Map<String, dynamic>> feeds = [
    {'id': 1, 'title': '텀블러', 'content': '텀블러 팔아요', 'price': 500},
    {'id': 2, 'title': '머그잔', 'content': '머그잔으로 텀블러 교환 원해요', 'price': 300},
  ];

  void addItem() {
    final random = Random();
    final newItem = {
      'id': feeds.length + 1,
      'title': '제목 ${random.nextInt(100)}',
      'content': '내용 ${random.nextInt(100)}',
      'price': 500 + random.nextInt(49500),
    };

    setState(() {
      feeds.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('내 동네'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryBtn(icon: Icons.menu),
                SizedBox(width: 12),
                CategoryBtn(icon: Icons.search, title: '알바'),
                SizedBox(width: 12),
                CategoryBtn(icon: Icons.maps_home_work, title: '부동산'),
                SizedBox(width: 12),
                CategoryBtn(icon: Icons.car_crash, title: '중고차'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: feeds.length,
              itemBuilder: (context, index) {
                final item = feeds[index];
                return FeedListItem(item);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
