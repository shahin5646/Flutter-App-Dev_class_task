import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.red[50],
        child: Column(
          children: [
            DrawerHeader(
                child: Text(
              'Menu',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            //Home page
            ListTile(
              leading: Icon(Icons.home),
              title: Text('H O M E'),
              onTap: () {
                // close the drawer when Back
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            //Settings
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settingspage');
              },
            )
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/secondpage');
            },
            child: Text("Go to Second Page")),
      ),
    );
  }
}
