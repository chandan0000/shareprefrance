import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = new TextEditingController();
  void saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("text", text);
  }

  void readText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late String savedValue = (prefs.get("Text") as String);
    if (savedValue != null) {
      controller.text = savedValue;
    }
  }

  @override
  void initState() {
    super.initState();
    readText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: TextField(
            controller: controller,
            onChanged: (val) {
              saveText(val);
            },
          ),
        ),
      ),
    );
  }
}
