import 'package:flutter/material.dart';

import 'welcome_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'home_page.dart';

void main() {
  runApp(const EVigilanceApp());
}

class EVigilanceApp extends StatelessWidget {
  const EVigilanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E‑Vigilance',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
