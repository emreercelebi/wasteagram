import 'dart:io';

class WasteEntry {
  final DateTime date;
  final int quantity;
  final File image;
  final double latitude;
  final double longitude;

  WasteEntry({this.date, this.quantity, this.image, this.latitude, this.longitude});
}