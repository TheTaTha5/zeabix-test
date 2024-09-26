import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  final List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;

  final CalendarController controller = CalendarController();

  Future<void> fetchEventsFromGeoPoints() async {
    // Fetch GeoPoint data from Firestore (or your preferred database)
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('your_collection').get();

    // Assuming your document structure has 'date' and 'geopoint' fields
    for (var doc in snapshot.docs) {
      GeoPoint geoPoint = doc['geopoint'];
      DateTime date = doc['date'].toDate();

      // Create an Appointment object (you can customize this)
      _appointments.add(Appointment(
        startTime: date,
        endTime: date.add(Duration(hours: 1)), // Assuming 1 hour events
        subject: 'Event at ${geoPoint.latitude}, ${geoPoint.longitude}',
        color: Colors.blue, // Customize event color
      ));
    }

    notifyListeners();
  }
}
