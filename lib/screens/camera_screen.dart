import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  static const route = '/image';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File image;
  int quantity;
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    image = ModalRoute.of(context).settings.arguments;
    if (image == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Wasteagram'),
        ),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.file(
                  image,
                  height: 300.0,
                  width: 300.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: new InputDecoration(
                      labelText: 'Enter quantity',
                    ),
                    keyboardType: TextInputType.number,
                    controller: myController,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print('uploading to cloud firestore');
                },
                child: Icon(Icons.cloud_upload),
              )
            ],
          ),
        ),
      );
    }
  }
}
