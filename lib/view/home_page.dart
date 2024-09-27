import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../control/remote/create_random_task.dart';
import '../control/remote/push_noti.dart';
import 'pages/google_map_page.dart';
import 'pages/task_scaffold.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime now = DateTime.now();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int visit = 0;
  double height = 30;
  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const Color(0XFF1752FE);

  Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission();
    final fcmToken = await messaging.getToken();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }
    log("fcmToken $fcmToken");
  }

  Future<List<Map<String, dynamic>>> _fetchTasks() async {
    QuerySnapshot snapshot = await _firestore.collection('geopoints').get();

    List<Map<String, dynamic>> tasks = [];
    for (var doc in snapshot.docs) {
      tasks.add({
        'name': doc['name'],
        'assignedDate': doc['assignedDate'],
        'location': doc['location'],
        'id': doc['id'],
      });
    }
    return tasks;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return TaskScaffold(
      appBar: "Home Page",
      currentIndex: 0,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tasks available'));
          }

          List<Map<String, dynamic>> tasks = snapshot.data!;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return InkWell(
                child: Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task['name'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('assignedDate: ${task['assignedDate']}'),
                        const SizedBox(height: 8),
                        Text(
                            'Location: ${task['location'].latitude}, ${task['location'].longitude}'),
                        const SizedBox(height: 8),
                        Text('id: ${task['id']}'),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  final GeoPoint locate = task['location'];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPage(taskLocations: [
                          LatLng(locate.latitude, locate.longitude)
                        ]),
                      ));
                },
              );
            },
          );
        },
      ),
      floatingActionButtons: ElevatedButton(
          onPressed: () async {
            await addRandomGeoPoint();
            await sendPushNotification(
                'New Task Added', 'A new task has been added successfully!');
            setState(() {});
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Text('ของานเพิ่ม'),
            ],
          )),
    );
  }
}
