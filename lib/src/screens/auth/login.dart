import 'package:carrot_market_app/src/controllers/auth_controller.dart';
import 'package:carrot_market_app/src/screens/home.dart';
import 'package:carrot_market_app/src/widgets/forms/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authCtrl = Get.put(AuthController());
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  void _submit() async {
    bool result = await authCtrl.login(_phoneCtrl.text, _passwordCtrl.text);

    if (result) {
      Get.offAll(() => const HomePage());
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            LabelTextField(
              label: '휴대폰 번호',
              hintText: '휴대폰 번호를 입력해주세요.',
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 8),
            LabelTextField(
              label: '비밀번호',
              hintText: '비밀번호를 입력해주세요.',
              controller: _passwordCtrl,
              isObscure: true,
            ),
            ElevatedButton(onPressed: _submit, child: const Text('로그인')),
          ],
        ),
      ),
    );
  }
}
