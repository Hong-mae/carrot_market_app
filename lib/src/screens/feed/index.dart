import 'package:carrot_market_app/src/controllers/feed_controller.dart';
import 'package:carrot_market_app/src/widgets/buttons/category_btn.dart';
import 'package:carrot_market_app/src/widgets/listitems/feed_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final int _currentPage = 1;
  final FeedController feedCtrl = Get.put(FeedController());

  @override
  void initState() {
    super.initState();
    feedCtrl.feedIndex(_currentPage);
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
            child: Obx(
              () => ListView.builder(
                itemCount: feedCtrl.feeds.length,
                itemBuilder: (context, index) {
                  final item = feedCtrl.feeds[index];

                  return FeedListItem(item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
