import 'package:flutter/material.dart';
import '../styles.dart';
import '../models/waste_entry.dart';
import '../mock/mock_waste_entries.dart';
import '../helpers.dart';
import 'photo_detail.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'camera_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _wasteEntries == null ? 0 : _wasteEntries.length,
        itemBuilder: (context, i) {
          final entry = _wasteEntries[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(Helpers.dateToString(entry.date),
                  style: Styles.headingSubBold),
              trailing: Text(
                entry.quantity.toString(),
                style: Styles.textLargeBold,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  PhotoDetail.route,
                  arguments: entry,
                );
              },
            ),
          );
        },
      ),
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
