import 'package:flutter/material.dart';
import 'package:news_fresh/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "Fresh",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}
