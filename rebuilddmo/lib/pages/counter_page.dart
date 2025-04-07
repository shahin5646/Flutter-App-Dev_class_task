import 'package:flutter/material.dart';

//Ui
class counter_page extends StatefulWidget {
  const counter_page({super.key});

  @override
  State<counter_page> createState() => _counter_pageState();
}

class _counter_pageState extends State<counter_page> {
//variable
  int _counter = 0;

//method
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
                child: Text(
              'Menu',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('H O M E'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homepage');
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15),
            ),
            //counter
            Text(
              _counter.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: _incrementCounter, child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
