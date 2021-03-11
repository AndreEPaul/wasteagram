import 'package:flutter/material.dart';
import 'package:wasteagram/screens/my_home_page.dart';
import 'package:wasteagram/screens/new_post.dart';
import 'package:wasteagram/screens/detail_screen.dart';


class MyApp extends StatelessWidget {
  static final routes = {
    '/': (context) => MyHomePage(),
    'new_post': (context) => NewPost(),
    'detail_screen': (context) => DetailScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: routes,
      home: MyHomePage(),
    );
  }
}
