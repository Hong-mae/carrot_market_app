import 'package:carrot_market_app/widgets/modal/confirm_modal.dart';
import 'package:flutter/material.dart';

class MoreBottomModal extends StatelessWidget {
  final VoidCallback onCancle;
  final VoidCallback onHide;

  const MoreBottomModal({
    super.key,
    required this.onCancle,
    required this.onHide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.visibility_off_outlined),
                  title: Text('이 글 숨기기'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ConfirmModal(
                          title: '글 숨기기',
                          msg: '이 글을 숨기시겠습니까? 숨긴 글을 다시 볼 수 없습니다.',
                          confirmText: '숨기기',
                          onCancel: () {
                            Navigator.pop(context);
                          },
                          onConfirmAction: () {
                            Navigator.pop(context); // close AlertDialog
                            Navigator.pop(context); // close More Bottom Modal
                          },
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text('게시글 노출 기준'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.red,
                  ),
                  title: Text('신고하기', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text('닫기', textAlign: TextAlign.center),
              onTap: onCancle,
            ),
          ),
        ],
      ),
    );
  }
}
