import '../models/waste_entry.dart';

List<WasteEntry> generateTestWasteEntries() {
  final dates = [DateTime.now(), DateTime.now(), DateTime.now()];
  final quantities = [1, 2, 3];

  List<WasteEntry> entries = List<WasteEntry>();

  for (var i = 0; i < dates.length; i++) {
    entries.add(WasteEntry(
      date: dates[i],
      quantity: quantities[i],
    ));
  }

  return entries;
}
