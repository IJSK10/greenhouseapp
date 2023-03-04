import 'package:flutter/material.dart';

import './homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenhouse Monitoring',
      theme:ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Green house monitoring'),
    );
  }
}
