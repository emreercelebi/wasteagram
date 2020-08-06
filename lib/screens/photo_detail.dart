import 'package:flutter/material.dart';
import '../models/waste_entry.dart';
import '../helpers.dart';

class PhotoDetail extends StatelessWidget {

  static const String route = '/detail';

  @override
  Widget build(BuildContext context) {
    final WasteEntry entry = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram')
      ),
      body: Column(
        children: [
          Text(Helpers.dateToString(entry.date)),
          Text(entry.quantity.toString()),
          Text(entry.latitude.toString()),
          Text(entry.longitude.toString()),
        ]
      ),
    );
  }
}