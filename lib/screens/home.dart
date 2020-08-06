import 'package:flutter/material.dart';
import '../styles.dart';
import '../models/waste_entry.dart';
import '../mock/mock_waste_entries.dart';
import '../helpers.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WasteEntry> _wasteEntries;

  @override
  void initState() {
    super.initState();

    //TODO: update with real data
    _wasteEntries = generateTestWasteEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _wasteEntries == null ? 0 : _wasteEntries.length,
        itemBuilder: (context, i) {
          final entry = _wasteEntries[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                Helpers.dateToString(entry.date),
                style: Styles.headingSubBold
              ),
              trailing: Text(
                entry.quantity.toString(),
                style: Styles.textLargeBold,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Camera',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}