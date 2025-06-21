import 'dart:math';

import 'package:carrot_market_app/src/models/feed/feed_model.dart';
import 'package:carrot_market_app/src/providers/feed_provider.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final feedProvider = Get.put(FeedProvider());
  RxList<FeedModel> feeds = <FeedModel>[].obs;

  void feedIndex(int page) async {
    Map json = await feedProvider.getList(page: page);
    List<FeedModel> tmp = json['data']
        .map((e) => FeedModel.fromJson(e))
        .toList();

    (page == 1) ? feeds.assignAll(tmp) : feeds.add(tmp as FeedModel);
  }

  void addItem() {
    final random = Random();
    final newItem = FeedModel(
      id: feeds.length + 1,
      title: '제목 ${random.nextInt(100)}',
      content: '내용 ${random.nextInt(100)}',
      price: 500 + random.nextInt(49500),
    );

    feeds.add(newItem);
  }

  void updateData(FeedModel updatedItem) {
    final index = feeds.indexWhere((item) => item.id == updatedItem.id);

    if (index != -1) {
      feeds[index] = updatedItem;
    }
  }
}
