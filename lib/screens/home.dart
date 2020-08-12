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
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    image = File(pickedFile.path);
    await Navigator.of(context).pushNamed(CameraScreen.route, arguments: image);
  }

  Widget getData() {
    _wasteEntries = List<WasteEntry>();
    return StreamBuilder(
      stream: Firestore.instance.collection('waste_posts').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              var post = snapshot.data.documents[index];
              var wasteEntry = WasteEntry.fromMap(map: post.data);
              _wasteEntries.add(wasteEntry);
              return ListTile(
                title: Text(
                  Helpers.dateToString(new DateTime.fromMillisecondsSinceEpoch(
                      post['date'].millisecondsSinceEpoch)),
                  style: Styles.headingSubBold,
                ),
                trailing: Text(
                  post['quantity'].toString(),
                  style: Styles.textLargeBold,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    PhotoDetail.route,
                    arguments: wasteEntry,
                  );
                },
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
      floatingActionButton: Semantics(
        child: FloatingActionButton(
          onPressed: () {
            getImage(context);
          },
          tooltip: 'Camera',
          child: Icon(Icons.camera_alt),
        ),
        button: true,
        enabled: true,
        onTapHint: 'Open camera to take a picture',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
