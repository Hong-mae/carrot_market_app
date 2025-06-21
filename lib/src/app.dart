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
      theme: ThemeData(
        primaryColor: const Color(0xffff6f0f),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xffff6f0f)),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 18, fontFamily: 'Noto Sans'),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Noto Sans'),
          labelLarge: TextStyle(
            fontSize: 16,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffff7e36),
            padding: const EdgeInsets.symmetric(vertical: 22),
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xffff7e36),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelStyle: TextStyle(fontSize: 10),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
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
