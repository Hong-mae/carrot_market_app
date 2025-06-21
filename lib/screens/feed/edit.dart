import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final Map item;

  const EditPage(this.item, {super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController? titleCtrl;
  TextEditingController? priceCtrl;

  void _submit() {
    setState(() {
      widget.item['title'] = titleCtrl!.text;
      widget.item['price'] =
          int.tryParse(priceCtrl!.text) ?? widget.item['price'];
    });

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.item['title']);
    priceCtrl = TextEditingController(text: widget.item['price'].toString());
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
