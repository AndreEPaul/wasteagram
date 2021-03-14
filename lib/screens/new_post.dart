import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewPost extends StatefulWidget {
  static const routeName = 'new_post';

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final formKey = GlobalKey<FormState>();
  int quantity;
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
              Expanded(
                  child: Form(
                      key: formKey,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Quantity'),
                        onSaved: (value) {
                          quantity = int.parse(value);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter quantity.';
                          }
                          return null;
                        },
                      ))),
              ElevatedButton(
                child: Text('Post!'),
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    FirebaseStorage storage = FirebaseStorage.instance;
                    Reference ref = storage
                        .ref()
                        .child("image" + DateTime.now().toString());
                    UploadTask uploadTask = ref.putFile(image);
                    String url =
                        'https://firebasestorage.googleapis.com/v0/b/wasteagram-b9f6c.appspot.com/o/image2021-03-11%2017%3A04%3A53.512676?alt=media&token=e2ba0734-e12a-4544-8557-08f4889205e5';
                    uploadTask.then((res) {
                      res.ref.getDownloadURL();
                    });
                    // url = (await ref.getDownloadURL()).toString();
                    FirebaseFirestore.instance.collection('posts').add({
                      'date': Timestamp.fromDate(DateTime.now()),
                      'imageURL': url,
                      'latitude': 45.1,
                      'longitude': -122.1,
                      'quantity': 12
                    });
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ));
    }
  }
}
