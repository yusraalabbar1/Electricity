import 'package:electricity/view/mainPage/startSreen/routes.dart';
//import 'package:electricity/view/mainPage/consumptionMain/value_monitor.dart';
//import 'package:electricity/view/mainPage/startSreen/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'model/pref.dart';

var select = 1;
bool login = false;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  print("Handling a background message: ${message.notification!.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  var user = FirebaseAuth.instance.currentUser;
  print("****************************");
  await getpref();
  await getprefIdAcount();
  await getprefBill();
  await getprefOnNotificatin();
  await getprefOnNotificatinSMS();
  print("****************************");
  if (islogin == "true") {
    login = true;
  } else {
    login = false;
  }
  runApp(MyApp());
}
