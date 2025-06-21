import 'package:carrot_market_app/screens/auth/regist.dart';
import 'package:carrot_market_app/screens/feed/show.dart';
import 'package:carrot_market_app/screens/home.dart';
import 'package:carrot_market_app/screens/intro.dart';
import 'package:carrot_market_app/screens/unknown.dart';
import 'package:carrot_market_app/shared/data.dart';
import 'package:carrot_market_app/utils/logger.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carrot Market',
      routes: {
        '/': (context) => const HomePage(),
        '/intro': (context) => const IntroPage(),
        '/regist': (context) => const RegistPage(),
      },
      initialRoute: '/',
    );
  }
}
