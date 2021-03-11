import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewPost extends StatefulWidget {
  static const routeName = 'new_post';

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File image;
  final picker = ImagePicker();
  void getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    setState(() {});
  }

  Widget build(BuildContext context) {
    if (image == null) {
      return Scaffold(
          appBar: AppBar(
            title: Text('New Post'),
          ),
          body: ElevatedButton(
            child: Text('Select Photo'),
            onPressed: () {
              getImage();
            },
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('New Post'),
          ),
          body: Column(
            children: [
              Image.file(image),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                child: Text('Post!'),
                onPressed: () {},
              )
            ],
          ));
    }
  }
}
