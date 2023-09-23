import 'package:epic_events/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epic Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage()
    );
  }
}