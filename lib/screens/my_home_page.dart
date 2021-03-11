import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/screens/detail_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  static const routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numberOfPosts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wasteagram - $numberOfPosts"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            this.numberOfPosts = snapshot.data.docs.length;
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  FoodWastePost post = FoodWastePost(snapshot, index);
                  var formattedDate =
                      DateFormat.yMMMd().add_jm().format(post.date);
                  return ListTile(
                    leading: Text(post.quantity.toString()),
                    title: Text(formattedDate.toString()),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(DetailScreen.routeName, arguments: post);
                    },
                  );
                });
          }),
    );
  }
}
