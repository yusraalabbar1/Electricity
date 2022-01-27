import 'package:electricity/controller/control.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "setting",
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
                  title: Text("Bill Limit"),
                  subtitle: Text("${controller.limitBill}"),
                  trailing: Image.asset("images/setting.PNG"),
                  leading: Icon(Icons.settings),
                  onTap: () async {
                    showLoading(context);
                    controller.changeBill();
                  },
                )));
              }),
          Card(
              child: ListTile(
            title: Text("Notification"),
            subtitle: Text("ON"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.notification_add),
            onTap: () {
              setState(() {
                dialogeNotification(context);
              });
            },
          )),
          Card(
              child: ListTile(
            title: Text("SMS notificatin"),
            subtitle: Text("OFF"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.send_to_mobile),
            onTap: () {
              setState(() {
                dialogeNotificationSms(context);
              });
            },
          )),
          Card(
              child: ListTile(
            title: Text("Language"),
            subtitle: Text("English"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.language),
            onTap: () {
              setState(() {
                dialogLang(context);
              });
            },
          )),
          Card(
              child: ListTile(
            title: Text("Data Clear"),
            subtitle: Text("clear.."),
            trailing: Image.asset("images/setting.PNG"),
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
