import 'dart:async';

import 'package:carrot_market_app/src/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authProvider = Get.put(AuthProvider());
  final RxBool isButtonEnabled = false.obs;
  final RxBool showVerifyForm = false.obs;
  final RxString buttonText = '인증 문자 받기'.obs;
  String? phoneNumber;
  Timer? timer;

  Future<void> requestVerificationCode(String phone) async {
    Map body = await authProvider.requestPhoneCode(phone);
    if (body['result'] == 'ok') {
      phoneNumber = phone;
      DateTime expiryTime = DateTime.parse(body['expired']);
      _startTimer(expiryTime);
    }
  }

  Future<bool> verifyPhoneNumber(String code) async {
    Map body = await authProvider.verifyPhoneNumber(code);
    if (body['result'] == 'ok') {
      return true;
    }

    Get.snackbar(
      '인증 번호 에러',
      body['message'],
      snackPosition: SnackPosition.BOTTOM,
    );

    return false;
  }

  void _startTimer(DateTime expiryTime) {
    isButtonEnabled.value = false;
    showVerifyForm.value = true;
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      Duration timeDiff = expiryTime.difference(DateTime.now());

      if (timeDiff.isNegative) {
        buttonText.value = '인증 문자 다시 받기';
        isButtonEnabled.value = true;
        t.cancel();
      } else {
        String minutes = timeDiff.inMinutes.toString().padLeft(2, '0');
        String seconds = (timeDiff.inSeconds % 60).toString().padLeft(2, '0');

        buttonText.value = '인증 문자 다시 받기 $minutes:$seconds';
      }
    });
  }

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

    isButtonEnabled.value = text.length == 1;
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
    Map body = await authProvider.regist(phoneNumber!, password, name, profile);
    if (body['result'] == 'ok') {
      return true;
    }

    Get.snackbar(
      '회원 가입 에러',
      body['message'],
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }
}
