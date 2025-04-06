import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",style: TextStyle(color: Colors.orange[700],fontWeight: FontWeight.bold),),
      ),
    );
  }
}