import 'package:carrot_market_app/screens/auth/regist.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '이 책은 플러터로\nSNS 중고 거래 앱을 만듭니다.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistPage()),
                );
              },
              child: const Text('사용하러 가기'),
            ),
          ],
        ),
      ),
    );
  }
}
