import 'package:carrot_market_app/widgets/buttons/category_btn.dart';
import 'package:carrot_market_app/widgets/listitems/feed_list_item.dart';
import 'package:flutter/material.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
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
            child: ListView(
              children: [
                FeedListItem(),
                FeedListItem(),
                FeedListItem(),
                FeedListItem(),
                FeedListItem(),
                FeedListItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
