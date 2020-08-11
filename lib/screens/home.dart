import 'package:flutter/material.dart';
import '../styles.dart';
import '../models/waste_entry.dart';
import '../mock/mock_waste_entries.dart';
import '../helpers.dart';
import 'photo_detail.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'camera_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WasteEntry> _wasteEntries;
  File image;

  @override
  void initState() {
    super.initState();

    //TODO: update with real data
    _wasteEntries = generateTestWasteEntries();
  }

  void getImage(BuildContext context) async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    await Navigator.of(context).pushNamed(CameraScreen.route, arguments: image);
  }

  Widget getData() {
    return StreamBuilder(
      stream: Firestore.instance.collection('waste_posts').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              var post = snapshot.data.documents[index];
              return ListTile(
                title: Text(
                  Helpers.dateToString(new DateTime.fromMillisecondsSinceEpoch(post['date'].millisecondsSinceEpoch)),
                  style: Styles.headingSubBold,
                ),
                trailing: Text(
                  post['quantity'].toString(),
                  style: Styles.textLargeBold,
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
        centerTitle: true,
      ),
      body: getData(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage(context);
        },
        tooltip: 'Camera',
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
