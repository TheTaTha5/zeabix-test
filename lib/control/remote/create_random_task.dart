import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

Future<void> addRandomGeoPoint() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int randomDays = Random().nextInt(10) + 1;
  DateTime currentDateTime = DateTime.now();
  DateTime futureDateTime = currentDateTime.add(Duration(days: randomDays));
  Random random = Random();
  double randomLat =
      -90 + random.nextDouble() * 180; // Random latitude between -90 and 90
  double randomLng =
      -180 + random.nextDouble() * 360; // Random longitude between -180 and 180

  GeoPoint geoPoint = GeoPoint(randomLat, randomLng);

  // Generate a random ID for the geopoint (you can customize this as needed)
  String id =
      DateTime.now().millisecondsSinceEpoch.toString(); // Using timestamp as ID
  final List taskName = ["ซ่อมสายไฟ", "ตัดหญ้า", "เก็บขยะ"];
  String randomTaskName = taskName[random.nextInt(taskName.length)];
  // Create a document data map

  Map<String, dynamic> geoPointData = {
    'location': geoPoint,
    'name': randomTaskName,
    'id': id,
    'assignedDate':
        futureDateTime.toIso8601String(), // Current date as ISO string
  };

  // Push the document to Firestore
  await _firestore.collection('geopoints').doc(id).set(geoPointData);

  print('Random GeoPoint added to Firestore: $geoPointData');
}
