import 'package:carrot_market_app/src/controllers/feed_controller.dart';
import 'package:carrot_market_app/src/models/feed/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPage extends StatefulWidget {
  final FeedModel item;

  const EditPage(this.item, {super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final FeedController feedCtrl = Get.find<FeedController>();
  TextEditingController? titleCtrl;
  TextEditingController? priceCtrl;

  void _submit() {
    final updatedItem = FeedModel.fromJson({
      'id': widget.item.id,
      'title': titleCtrl!.text,
      'content': widget.item.content,
      'price': int.tryParse(priceCtrl!.text) ?? widget.item.price,
    });

    feedCtrl.updateData(updatedItem);

    Get.back();
  }

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.item.title);
    priceCtrl = TextEditingController(text: widget.item.price.toString());
  }

  @override
  void dispose() {
    titleCtrl?.dispose();
    priceCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('물품 수정')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: priceCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: const Text('수정하기')),
          ],
        ),
      ),
    );
  }
}
