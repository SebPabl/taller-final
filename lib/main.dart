import 'package:flutter/material.dart';
import 'package:taller_final/screen/home.screen.dart';
import 'package:taller_final/screen/register.screen.dart';
import 'package:taller_final/screen/login.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3535768473.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4191996318.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: LoginPage(),
      routes: {
        '/login':  (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const CategoryListPage()
      },
    );
  }
}