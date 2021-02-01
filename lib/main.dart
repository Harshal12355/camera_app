import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LandingScreen(),
    );
  }
}

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;

  _openGallery () async{
      imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      this.setState(() {
      });
  }

  _openCamera () async {
      imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
      this.setState(() {
      });
  }

  Future<void> _showChoiceDialogue(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Choose Option"),
        content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Open Gallery"),
                  onTap: () {
                    _openGallery();
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Open Camera"),
                  onTap: () {
                    _openCamera();
                  },
                ),
              ],
            )
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("No Image Selected"),
            RaisedButton(
                onPressed: () {
                  _showChoiceDialogue(context);
                },
                child: Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}
