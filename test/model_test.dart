import 'package:test/test.dart' as t;
import 'package:wasteagram/models/waste_entry.dart';

void main() {
  t.test('Test Waste Entry named constructor', () {
    final date = DateTime.parse('2020-01-01');
    const image = 'TEST_URL';
    const quantity = 7;
    const latitude = 5.0;
    const longitude = 10.0;

    final waste_entry = WasteEntry.fromMap(
      map: {
        'date': date,
        'image': image,
        'quantity': quantity,
        'latitude': latitude,
        'longitude': longitude
      },
    );
    
    t.expect(waste_entry.date, date);
    t.expect(waste_entry.imageUrl, image);
    t.expect(waste_entry.quantity, quantity);
    t.expect(waste_entry.latitude, latitude);
    t.expect(waste_entry.longitude, longitude);
  });
}
