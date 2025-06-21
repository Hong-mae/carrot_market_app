import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  void updateButtonState(TextEditingController phoneController) {
    String rawText = phoneController.text;
    String text = rawText.replaceAll('-', '');

    if (text.length <= 3 && !rawText.startsWith('010')) {
      text = '010';
    } else if (text.length > 3 && !text.startsWith('010')) {
      text = '010$text';
    }

    if (text.length > 11) {
      text = text.substring(0, 11);
    }

    String formattedText = _formatPhoneNumber(text);

    int cursorPosition =
        phoneController.selection.baseOffset +
        (formattedText.length - rawText.length);

    phoneController.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: cursorPosition >= formattedText.length
            ? formattedText.length
            : cursorPosition,
      ),
    );
  }

  String _formatPhoneNumber(String text) {
    if (text.length > 3 && text.length <= 7) {
      return '${text.substring(0, 3)}-${text.substring(3)}';
    } else if (text.length > 7) {
      return '${text.substring(0, 3)}-${text.substring(3, 7)}-${text.substring(7)}';
    }

    return text;
  }

  Future<bool> login(String phone, String password) async {
    return true;
  }

  Future<bool> regist(String password, String name, int? profile) async {
    return true;
  }
}
