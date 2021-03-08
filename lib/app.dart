import 'package:flutter/material.dart';
import 'package:wasteagram/screens/my_home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Wasteagram'),
    );
  }
}
