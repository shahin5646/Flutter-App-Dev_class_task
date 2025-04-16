import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with SingleTickerProviderStateMixin {
  bool isDark = false;
  String currentTime = '';
  List<String> quotes = [
    "Believe in yourself!",
    "You are stronger than you think.",
    "Dream big and dare to fail.",
    "The best is yet to come!",
    "Progress, not perfection."
  ];
  String randomQuote = "Tap to inspire yourself!";
  late AnimationController _controller;
  late Animation<double> _animation;

  // Added a slider value to manage the rating
  double rating = 4.0;

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(const Duration(seconds: 1), (timer) => _updateTime());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      currentTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    });
  }

  void _changeQuote() {
    setState(() {
      randomQuote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("🚀 Interactive Showcase"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);  // This will navigate back to the previous screen
            },
          ),
          actions: [
            Switch(
              value: isDark,
              onChanged: (val) => setState(() => isDark = val),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "⏰ Live Clock",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentTime,
                      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    ScaleTransition(
                      scale: _animation,
                      child: ElevatedButton.icon(
                        onPressed: _changeQuote,
                        icon: const Icon(Icons.bolt, color: Colors.yellow,),
                        label: const Text("Inspire Me!",style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      randomQuote,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 30),
                    // Updated Slider to make it functional
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: const Icon(Icons.star_rate, color: Colors.amber),
                        title: const Text("Interactive Rating"),
                        subtitle: Slider(
                          value: rating,
                          min: 0,
                          max: 5,
                          divisions: 10,
                          label: rating.toStringAsFixed(1),
                          onChanged: (newRating) {
                            setState(() {
                              rating = newRating;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: const Icon(Icons.color_lens, color: Colors.teal),
                        title: const Text("Theme Toggle"),
                        subtitle: Text(isDark ? "Dark Mode Enabled" : "Light Mode Enabled"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
