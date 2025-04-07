import 'package:flutter/material.dart';
import 'package:rebuilddmo/pages/homepage.dart';

import 'pages/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: counter_page(),
      routes: {
        '/homepage': (context) => Homepage(),
        '/counterpage': (context) => counter_page(),
      },
    );
  }
}
