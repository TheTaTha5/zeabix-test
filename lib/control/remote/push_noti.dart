import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendPushNotification(String title, String body) async {
  const String serverToken = 'YOUR_SERVER_KEY';
  const String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

  Map<String, dynamic> data = {
    "to": "/topics/all", // or use a specific device token
    "notification": {
      "title": title,
      "body": body,
    },
  };

  final response = await http.post(
    Uri.parse(fcmUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverToken',
    },
    body: json.encode(data),
  );

  if (response.statusCode != 200) {
    print('Error sending notification: ${response.body}');
  }
}
