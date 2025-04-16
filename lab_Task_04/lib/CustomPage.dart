import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'thirdpage.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  bool isDark = false;
  String favoriteColor = 'Blue';
  double flutterSkill = 0.8;
  double uiSkill = 0.6;
  double logicSkill = 0.9;
  double rating = 3.5;
  final TextEditingController _feedbackController = TextEditingController();

  void _submitFeedback() {
    if (_feedbackController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thanks for your feedback!')),
      );
      _feedbackController.clear();
    }
  }

  void _confirmExit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Exit App?"),
        content: Text("Are you sure you want to leave?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Exit", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _confirmExit,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://scontent.fdac138-1.fna.fbcdn.net/v/t39.30808-6/492005282_1451788276261540_2453640628138109297_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=100&ccb=1-7&_nc_sid=aa7b47&_nc_eui2=AeHUoZT4V6FGQUthrKU_nC4TbmApWK0PHBtuYClYrQ8cG0Tw9rBhfnzSu8-hCMrYifrp0H8GaNVpisdbcHoB05VK&_nc_ohc=SpQyNvA8bb8Q7kNvwEqa4S8&_nc_oc=AdmD3d93jlsZFBvU1vB_naY2oQg6L26yZivFwzjeMunQaVY99_OhJAO5D59whDqfL3o&_nc_zt=23&_nc_ht=scontent.fdac138-1.fna&_nc_gid=DVFTGNWorSxCDrSdXRX-eg&oh=00_AfFCRg2WFE3uASc6ZYLo80oknR4mVTXOcA_OdHgH2tumug&oe=68059DA7',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Shahin',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Flutter Developer | ML Enthusiast'),
              ],
            ),
          ),
          // SizedBox(height: 20),
          // SwitchListTile(
          //   title: Text("Dark Mode"),
          //   value: isDark,
          //   onChanged: (val) {
          //     setState(() {
          //       isDark = val;
          //     });
          //   },
          // ),
          Divider(),
          Text("Choose Your Favorite Color:"),
          RadioListTile(
            title: Text("Blue"),
            value: "Blue",
            groupValue: favoriteColor,
            onChanged: (val) => setState(() => favoriteColor = val!),
          ),
          RadioListTile(
            title: Text("Green"),
            value: "Green",
            groupValue: favoriteColor,
            onChanged: (val) => setState(() => favoriteColor = val!),
          ),
          RadioListTile(
            title: Text("Purple"),
            value: "Purple",
            groupValue: favoriteColor,
            onChanged: (val) => setState(() => favoriteColor = val!),
          ),
          Divider(),
          Text("My Skills", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Flutter Development"),
          LinearProgressIndicator(value: flutterSkill),
          SizedBox(height: 10),
          Text("UI/UX Design"),
          LinearProgressIndicator(value: uiSkill, color: Colors.teal),
          SizedBox(height: 10),
          Text("Logical Thinking"),
          LinearProgressIndicator(value: logicSkill, color: Colors.orange),
          Divider(),
          Text("Give us your Feedback:", style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: _feedbackController,
            decoration: InputDecoration(
              hintText: "Write your thoughts...",
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            icon: Icon(Icons.send),
            label: Text("Submit"),
            onPressed: _submitFeedback,
          ),
          Divider(),
          Card(
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("App Version"),
              subtitle: Text("1.0.0 • Created by Noman"),
            ),
          ),
          Divider(),
          ElevatedButton.icon(
            icon: Icon(Icons.explore),
            label: Text("Explore Interactive Showcase"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirdPage()),
              );
            },
          ),
          SizedBox(height: 20),

          Card(
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.amber),
              title: Text("Rate the App"),
              subtitle: Slider(
                value: rating,
                min: 0,
                max: 5,
                divisions: 10,
                label: rating.toString(),
                onChanged: (val) => setState(() => rating = val),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
