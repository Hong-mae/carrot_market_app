import 'package:flutter/material.dart';

class ConfirmModal extends StatelessWidget {
  final String title;
  final String msg;
  final String confirmText;
  final VoidCallback onCancel;
  final VoidCallback onConfirmAction;

  const ConfirmModal({
    super.key,
    required this.title,
    required this.msg,
    required this.confirmText,
    required this.onCancel,
    required this.onConfirmAction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        TextButton(onPressed: onCancel, child: const Text('취소')),
        TextButton(onPressed: onConfirmAction, child: Text(confirmText)),
      ],
    );
  }
}
