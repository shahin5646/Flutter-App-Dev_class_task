import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //variable
  int _counter = 100;

  //method
  void _incrementCounter() {
    setState(() {
      _counter--;
    });
  }

  //ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Homepage',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Click Here To count Reverse',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            //counter
            Text(
              _counter.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            //Button
            ElevatedButton(
                onPressed: _incrementCounter,
                child: Icon(
                  Icons.arrow_circle_down,
                  size: 30,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counterpage');
                },
                child: Text(
                  'Back Home',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ))
          ],
        ),
      ),
    );
  }
}
