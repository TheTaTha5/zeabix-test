import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_viewer_zeabix/view/pages/login_page.dart';
import 'package:task_viewer_zeabix/view/pages/task_scaffold.dart';
import 'package:task_viewer_zeabix/view/widgets/toggle_button.dart';

class userPage extends StatefulWidget {
  @override
  _userPageState createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(user.uid).get();
      setState(() {
        name = userDoc['username'];
        email = userDoc['email'];
      });
    }
  }

  Future<void> logout() async {
    await auth.signOut();

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return TaskScaffold(
      currentIndex: 3,
      appBar: "User Page",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Email: $email', style: TextStyle(fontSize: 20)),
            Spacer(),
            ThemeToggleButton(),
            ElevatedButton(
              onPressed: logout,
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
