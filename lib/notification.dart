import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:http/http.dart' as http;

getToken() async {
  var token = await FirebaseMessaging.instance.getToken();
  DocumentReference users = FirebaseFirestore.instance
      .collection('informationUsers')
      .doc("$idAcount");
  users.update({'token': '$token'});
  print(token);
}

requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

var serverToken =
    "AAAAzE5CCe0:APA91bHV_KvwT8xwC5MZBxYk_W356V2Mam6mv1M3ZPylitlKHIxfvi-m4SKLKp24CQNj8f2pLjuS6xpAZdATNyH1w0pD10erS8h1z4nOI3TJ6xpvb96xfRdIAxTowpVhFkr-TSh9owzS";

sendNotfiy(String title, String body) async {
  await http.post(
    Uri.parse("https://fcm.googleapis.com/fcm/send"),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverToken',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{
          'body': body.toString(),
          'title': title.toString()
        },
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'idAccount': idAcount.toString()
        },
        // 'to': await FirebaseMessaging.instance.getToken() // token

        'to': "/topics/ysra" // topic
      },
    ),
  );
}

getMessage() {
  FirebaseMessaging.onMessage.listen((event) {
    print("====================================");
    print(event.notification!.title);
    print(event.notification!.body);
    print(event.data);
    print("====================================");
  });
}
