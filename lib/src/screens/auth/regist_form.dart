import 'package:carrot_market_app/src/controllers/auth_controller.dart';
import 'package:carrot_market_app/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistForm extends StatefulWidget {
  const RegistForm({super.key});

  @override
  State<RegistForm> createState() => _RegistFormState();
}

class _RegistFormState extends State<RegistForm> {
  final autnCtrl = Get.put(AuthController());
  final _passwordCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();

  void _submit() async {
    bool result = await autnCtrl.regist(
      _passwordCtrl.text,
      _nameCtrl.text,
      null,
    );

    if (result) {
      Get.off(() => const HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원 가입')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            // profile image
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.camera_alt, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 16),
            // password
            Text('비밀번호', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordCtrl,
              obscureText: true,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(hintText: '비밀번호를 입력해주세요.'),
            ),
            const SizedBox(height: 16),
            // confirm password
            Text('비밀번호 확인', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(hintText: '비밀번호를 한번 더 입력해주세요.'),
            ),
            const SizedBox(height: 16),
            // nickname
            Text('닉네임', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            TextField(
              controller: _nameCtrl,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(hintText: '닉네임을 입력해주세요.'),
            ),
            const SizedBox(height: 16),
            // button
            ElevatedButton(onPressed: _submit, child: const Text('회원 가입')),
          ],
        ),
      ),
    );
  }
}
