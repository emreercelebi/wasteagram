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
        body: Center(
          child: Column(
            children: [
              Image.file(image),
            ],
          ),
        ),
      );
    }
  }
}
