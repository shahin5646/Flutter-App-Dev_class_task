import 'package:flutter/material.dart';
import 'CustomPage.dart';  // Assuming CustomPage is another widget you created.
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customized Component App',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(
        isDarkMode: isDarkMode,
        onToggleDarkMode: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onToggleDarkMode;

  const HomePage({
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _noteController = TextEditingController();
  List<String> notes = [];
  double sliderValue = 2.5;
  String? selectedCategory;
  bool agreeTerms = false;
  DateTime? selectedDate;

  final List<String> categories = ['Work', 'Study', 'Personal', 'Other'];

  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        notes.add(_noteController.text);
        _noteController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note added!')),
      );
    }
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customized Components App"),
        actions: [
          Switch(
            value: widget.isDarkMode,
            onChanged: widget.onToggleDarkMode,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Enter a Note',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              hint: Text('Select Category'),
              items: categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => selectedCategory = val),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text("Agree to terms and conditions"),
              value: agreeTerms,
              onChanged: (value) {
                setState(() => agreeTerms = value ?? false);
              },
            ),
            ElevatedButton(
              onPressed: agreeTerms ? _addNote : null,
              child: Text("Add Note"),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickDate,
              icon: Icon(Icons.calendar_today),
              label: Text("Pick a Date"),
            ),
            if (selectedDate != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Selected Date: ${selectedDate!.toLocal().toString().split(' ')[0]}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rating: ${sliderValue.toStringAsFixed(1)}"),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 5,
                    value: sliderValue,
                    divisions: 10,
                    onChanged: (val) => setState(() => sliderValue = val),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            Text(
              'Your Notes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...notes.map((note) => Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.note, color: Colors.teal),
                title: Text(note),
                subtitle: selectedCategory != null
                    ? Text("Category: $selectedCategory")
                    : null,
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() => notes.remove(note));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Note removed!')),
                    );
                  },
                ),
              ),
            )),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://images.pexels.com/photos/177809/pexels-photo-177809.jpeg?auto=compress&cs=tinysrgb&w=600',
                height: 150,
              ),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.dashboard),
              label: Text("Open Dashboard"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomPage()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
