import 'dart:io';

class WasteEntry {
  DateTime date;
  int quantity;
  String imageUrl;
  double latitude;
  double longitude;
  Map<String, dynamic> map;

  WasteEntry({this.date, this.quantity, this.imageUrl, this.latitude, this.longitude});

  WasteEntry.fromMap({this.map}) {
    date = DateTime.fromMillisecondsSinceEpoch(map['date'].millisecondsSinceEpoch);
    quantity = map['quantity'];
    imageUrl = map['image'];
    latitude = map['latitude'];
    longitude = map['longitude'];
  }
}