import 'package:cloud_firestore/cloud_firestore.dart';

class GeoPointData {
  final String id; // Unique identifier for the geo-point
  final String name; // Name of the geo-point
  final GeoPoint location; // Firebase GeoPoint (latitude & longitude)
  final DateTime dateAssigned; // Date when the geo-point was assigned

  // Constructor
  GeoPointData({
    required this.id,
    required this.name,
    required this.location,
    required this.dateAssigned,
  });

  // Convert GeoPointData to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': {
        'latitude': location.latitude,
        'longitude': location.longitude,
      },
      'dateAssigned': dateAssigned.toIso8601String(),
    };
  }

  // Create a GeoPointData object from a Map (for retrieving data from Firestore)
  factory GeoPointData.fromMap(Map<String, dynamic> map) {
    return GeoPointData(
      id: map['id'],
      name: map['name'],
      location:
          GeoPoint(map['location']['latitude'], map['location']['longitude']),
      dateAssigned: DateTime.parse(map['dateAssigned']),
    );
  }
}
