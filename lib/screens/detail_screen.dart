import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  Widget build(BuildContext context) {
    FoodWastePost post = ModalRoute.of(context).settings.arguments;
    var formattedDate = DateFormat.yMMMd().add_jm().format(post.date);
    return Scaffold(
        appBar: AppBar(
          title: Text('Post Details'),
        ),
        body: Column(
          children: [
            Text(formattedDate.toString()),
            Placeholder(),
            Text(post.quantity.toString()),
          ],
        ));
  }
}
