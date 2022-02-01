import 'package:electricity/translation/app_languge_controller.dart';
import 'package:electricity/view/mainPage/contact/contact.dart';
import 'package:electricity/view/mainPage/manegerProfil/profil.dart';
import 'package:electricity/view/mainPage/setting/setting.dart';
import 'package:electricity/view/mainPage/statistic/mainScreenStatistic/statistics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'consumptionMain/Electric_consum_monitor.dart';
import 'consumptionMain/monitor.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  AppLanguage appLanguage = Get.put(AppLanguage());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  void initState() {
    super.initState();
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
