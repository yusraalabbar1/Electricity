import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:electricity/translation/app_languge_controller.dart';
import 'package:electricity/view/mainPage/contact/contact.dart';
import 'package:electricity/view/mainPage/manegerProfil/profil.dart';
import 'package:electricity/view/mainPage/setting/setting.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:electricity/view/mainPage/statistic/mainScreenStatistic/statistics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'consumptionMain/Electric_consum_monitor.dart';
import 'consumptionMain/monitor.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  AppLanguage appLanguage = Get.put(AppLanguage());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    DocumentReference users = FirebaseFirestore.instance
        .collection('informationUsers')
        .doc("$idAcount");
    users.update({'token': '$token'});
    print(token);
  }

  initalMessage() async {
    var massage = await FirebaseMessaging.instance.getInitialMessage();
    if (massage != null) {
      Navigator.of(context).pushNamed("sitting");
    }
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
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  void initState() {
    super.initState();

    requestPermission();
    initalMessage();
    getToken();
    FirebaseMessaging.onMessageOpenedApp.listen((Message) {
      Navigator.of(context).pushNamed("sitting");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.notification!.body}');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO_REVERSED,
        borderSide: BorderSide(color: Colors.green, width: 2),
        width: 280,
        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: 'INFO',
        desc: 'Message data: ${message.notification!.body}.',
        showCloseIcon: true,
        btnCancelOnPress: () {
          Navigator.of(context).pop();
        },
        btnOkOnPress: () {
          Navigator.of(context).pushNamed("sitting");
        },
      )..show();
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  int _selectedIndex = 2;
  List<Widget> _widgetOptions = <Widget>[
    ContactUs(),
    statistics(),
    monitor(),
    profil(),
    sitting(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          unselectedItemColor: Color(0xff1C846B),
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff21C49D),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone),
              label: 'Contact Us'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_sharp),
              label: 'statistics'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profil'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'sitting'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
