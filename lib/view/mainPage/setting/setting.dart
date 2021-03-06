import 'dart:convert';

import 'package:electricity/controller/control.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'component_dialge/dialge_clear.dart';
import 'component_dialge/dialog_bill.dart';
import 'component_dialge/dialog_notifcation.dart';
import 'component_dialge/dialogeSms.dart';
import 'component_dialge/dialoge_language.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class sitting extends StatefulWidget {
  sitting({Key? key}) : super(key: key);

  @override
  _sittingState createState() => _sittingState();
}

class _sittingState extends State<sitting> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  // sub() async {
  //   await FirebaseMessaging.instance.subscribeToTopic('ysra');
  // }

  // unsub() async {
  //   await FirebaseMessaging.instance.unsubscribeFromTopic('ysra');
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // sub();
    // unsub();
    // getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings".tr,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView(
        children: [
          GetBuilder<homecontroller>(
              init: homecontroller(),
              builder: (controller) {
                return (Card(
                    child: ListTile(
                  title: Text("Bill Limit".tr),
                  subtitle: Text("${controller.limitBill}"),
                  trailing: InkWell(
                    child: Image.asset("images/pay2.png"),
                    onTap: () {
                      // sendNotfiy("pay", "pay");
                    },
                  ),
                  leading: Icon(Icons.settings),
                  onTap: () async {
                    showLoading(context);
                    controller.changeBill();
                  },
                )));
              }),
          GetBuilder<homecontroller>(
              init: homecontroller(),
              builder: (controller) {
                return (Card(
                    child: ListTile(
                  title: Text("Notification".tr),
                  subtitle: Text("${controller.notific}".tr),
                  trailing: Image.asset("images/not2.jpg"),
                  leading: Icon(Icons.notification_add),
                  onTap: () async {
                    dialogeNotification(context);
                    controller.OnNotification();
                  },
                )));
              }),
          GetBuilder<homecontroller>(
              init: homecontroller(),
              builder: (controller) {
                return (Card(
                    child: ListTile(
                  title: Text("SMS notificatin".tr),
                  subtitle: Text("${controller.notificSms}".tr),
                  trailing: Image.asset("images/sms2.png"),
                  leading: Icon(Icons.send_to_mobile),
                  onTap: () async {
                    dialogeNotificationSms(context);
                    controller.OnSmsNotification();
                  },
                )));
              }),
          Card(
              child: ListTile(
            title: Text("Language".tr),
            subtitle: Text("English & Arabic".tr),
            trailing: Image.asset("images/l2.png"),
            leading: Icon(Icons.language),
            onTap: () {
              setState(() {
                dialogLang(context);
              });
            },
          )),
          Card(
              child: ListTile(
            title: Text("Clear Data".tr),
            subtitle: Text("Clear Data".tr),
            trailing: Image.asset("images/del2.png"),
            leading: Icon(Icons.delete),
            onTap: () {
              setState(() {
                setState(() {
                  dialogeClear(context);
                });
              });
            },
          )),
        ],
      ),
    );
  }
}
