import 'package:carrot_market_app/screens/auth/regist.dart';
import 'package:carrot_market_app/screens/intro.dart';
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
        '/': (context) => const IntroPage(),
        '/regist': (context) => const RegistPage(),
      },
      initialRoute: '/',
      onGenerateRoute: (route) {
        if (route.name!.startsWith('/feed/')) {
          final id = route.name!.split('/')[1];
        }

        // return MaterialPageRoute(builder: (context) => UnknownPage());
      },
    );
  }
}
