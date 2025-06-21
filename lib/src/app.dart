import 'package:carrot_market_app/src/screens/auth/regist.dart';
import 'package:carrot_market_app/src/screens/home.dart';
import 'package:carrot_market_app/src/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
