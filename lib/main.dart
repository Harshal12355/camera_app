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

  _openGallery (BuildContext context) async{
      // ignore: deprecated_member_use
      imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      this.setState(() {
      });
      Navigator.of(context).pop();
  }

  _openCamera (BuildContext context ) async {
      // ignore: deprecated_member_use
      imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
      this.setState(() {
      });
      Navigator.of(context).pop();
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
                    _openGallery(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Open Camera"),
                  onTap: () {
                    _openCamera(context);
                  },
                ),
              ],
            )
        ),
      );
    });
  }

  Widget _selector() {
    if (imageFile == null){
      return Text("No Image Selected");
    } else {
      return Image.file(imageFile, width: 400, height: 400);
    }
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
            _selector(),
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
