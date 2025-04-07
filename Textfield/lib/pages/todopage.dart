import 'package:flutter/material.dart';

class todopage extends StatefulWidget {
  const todopage({super.key});

  @override
  State<todopage> createState() => _todopageState();
}

class _todopageState extends State<todopage> {
  // controller
  TextEditingController myController = TextEditingController();

  String greetingMessage = " ";
  //greetUser method
  void greetUser() {
    setState(() {
      String userName = myController.text;
      greetingMessage = "Asslamualikum, " + userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Homepage',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(greetingMessage),
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Type your name'),
                ),
                //button
                ElevatedButton(onPressed: greetUser, child: Text('Enter'))
              ],
            ),
          ),
        ),
        //button
      ),
    );
  }
}
