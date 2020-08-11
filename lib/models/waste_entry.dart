import 'dart:io';

class WasteEntry {
  final DateTime date;
  final int quantity;
  final String imageUrl;
  final double latitude;
  final double longitude;

  WasteEntry({this.date, this.quantity, this.imageUrl, this.latitude, this.longitude});
}