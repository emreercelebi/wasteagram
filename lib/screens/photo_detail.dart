import 'package:flutter/material.dart';
import 'package:wasteagram/styles.dart';
import '../models/waste_entry.dart';
import '../helpers.dart';

class PhotoDetail extends StatelessWidget {
  static const String route = '/detail';

  @override
  Widget build(BuildContext context) {
    final WasteEntry entry = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Wasteagram')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              entry.imageUrl,
            ),
          ),
          Text(
            Helpers.dateToString(entry.date),
            style: Styles.headingSub,
          ),
          SizedBox(height: 16.0),
          Text(
            'Quantity: ' + entry.quantity.toString(),
            style: Styles.textLarge,
          ),
          SizedBox(height: 16.0),
          Text(
            'Latitude: ' + entry.latitude.toString(),
            style: Styles.textSubBold,
          ),
          Text(
            'Longitude: ' + entry.longitude.toString(),
            style: Styles.textSubBold,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
