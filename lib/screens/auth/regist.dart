import 'package:flutter/material.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('회원 가입')),
      body: Center(child: Text('회원 가입 하시겠습니까?')),
    );
  }
}
