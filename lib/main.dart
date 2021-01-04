import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Newapp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Newapp extends StatefulWidget {
  Newapp({Key key}) : super(key: key);

  @override
  _NewappState createState() => _NewappState();
}

class _NewappState extends State<Newapp> {
  File mypic;

  void openmycamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      mypic = File(image.path);
    });
  }

  void openmygallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      mypic = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Image Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: width * 0.1,
            ),
            Container(
              width: width * 0.8,
              height: width * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black),
              ),
              child: mypic == null ? Text("Loading Pic") : Image.file(mypic),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                openmycamera();
              },
              child: Text("Open Camera"),
              textColor: Colors.white,
              color: Colors.pink,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                openmygallery();
              },
              child: Text("Open Gallery"),
              textColor: Colors.white,
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
