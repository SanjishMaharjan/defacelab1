import 'package:defacelab1/pages/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:defacelab1/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(), // Set LoginPage as the initial route
        '/home': (context) => HomePage(), // Define a named route for HomePage
      },
    );
  }
}
