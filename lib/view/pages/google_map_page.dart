import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  final List<LatLng> taskLocations;

  MapPage({Key? key, required this.taskLocations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Locations"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: taskLocations.isNotEmpty ? taskLocations[0] : LatLng(0, 0),
          zoom: 10,
        ),
        markers: taskLocations
            .map((location) => Marker(
                  markerId: MarkerId(location.toString()),
                  position: location,
                  infoWindow: const InfoWindow(title: 'Task Location'),
                ))
            .toSet(),
      ),
    );
  }
}
