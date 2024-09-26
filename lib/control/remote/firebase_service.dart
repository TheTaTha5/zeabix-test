import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_viewer_zeabix/model/geopoint_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add data to Firestore
  Future<void> addUserData(String userId, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(userId).set(data);
  }

  Future<List<GeoPointData>> fetchGeoPointData() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('geopoints').get();
    return querySnapshot.docs
        .map((doc) => GeoPointData.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
