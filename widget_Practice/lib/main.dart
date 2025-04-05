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
      home: Scaffold(
        backgroundColor: Color(0xFFECEFF1),
        appBar: AppBar(
          title: Text(
            "Research",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue[900],
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          elevation: 00,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.all(25),
            child: Icon(
              Icons.star,
              size: 75,
              color: Colors.amber[700],
            ),
          ),
        ),
      ),
    );
  }
}
