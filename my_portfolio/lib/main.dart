import 'package:flutter/material.dart';
import 'pages/home_page.dart';

// ======== ORIGINAL MAIN + MyApp ========
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Calls the home page
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'pages/Homepage.dart';

// ======== ORIGINAL MAIN + MyApp ========
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Calls the home page
    );
  }
}
*/
