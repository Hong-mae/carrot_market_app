import 'package:carrot_market_app/src/models/feed/feed_model.dart';
import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {
  final FeedModel item;
  const ShowPage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${item.title!} 팔기')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text(item.content!), Text('가격: ${item.price!}원')],
        ),
      ),
    );
  }
}
