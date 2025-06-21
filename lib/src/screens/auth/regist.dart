import 'package:carrot_market_app/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final authCtrl = Get.put(AuthController());
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _codeCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneCtrl.addListener(() {
      authCtrl.updateButtonState(_phoneCtrl);
    });
  }

  @override
  void dispose() {
    _phoneCtrl.removeListener(() {
      authCtrl.updateButtonState(_phoneCtrl);
    });
    super.dispose();
  }

  void _submit() {
    authCtrl.requestVerificationCode(_phoneCtrl.text);
  }

  void _confirm() async {
    bool result = await authCtrl.verifyPhoneNumber(_codeCtrl.text);
    if (result) {
      Get.to(() => const RegistPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Text(
              '휴대폰 번호를 인증해주세요.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            const Text('밤톨마켓은 휴대폰 번호로 가입합니다.'),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(hintText: '휴대폰 번호를 입력해주세요.'),
            ),
            const SizedBox(height: 20),
            Obx(
              () => ElevatedButton(
                onPressed: authCtrl.isButtonEnabled.value ? _submit : null,
                child: const Text('인증 번호 받기'),
              ),
            ),
            Obx(
              () => Visibility(
                visible: authCtrl.showVerifyForm.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    TextField(
                      controller: _codeCtrl,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(hintText: '인증 번호를 입력해주세요.'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _confirm,
                      child: Text('인증 번호 확인'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
