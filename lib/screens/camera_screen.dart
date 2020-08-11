import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class CameraScreen extends StatefulWidget {
  static const route = '/image';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File image;
  int quantity;
  final myController = TextEditingController();
  LocationData locationData;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState(() {});
  }

  Widget locationInfo() {
    return Column(
      children: [
        Text('latitude: ' + locationData.latitude.toString()),
        Text('longitude: ' + locationData.longitude.toString())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    image = ModalRoute.of(context).settings.arguments;
    if (image == null || locationData == null) {
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
              locationInfo(),
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
