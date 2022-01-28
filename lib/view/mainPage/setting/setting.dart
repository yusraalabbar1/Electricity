import 'package:flutter/material.dart';
import 'component_dialge/dialge_clear.dart';
import 'component_dialge/dialog_bill.dart';
import 'component_dialge/dialog_notifcation.dart';
import 'component_dialge/dialogeSms.dart';
import 'component_dialge/dialoge_language.dart';
import 'package:get/get.dart';

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
          "Settings".tr,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Card(
              child: ListTile(
            title: Text("Bill Limit".tr),
            subtitle: Text("$bill"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.settings),
            onTap: () async {
              showLoading(context);
            },
          )),
          Card(
              child: ListTile(
            title: Text("Notification".tr),
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
            title: Text("SMS notificatin".tr),
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
            title: Text("Language".tr),
            subtitle: Text("English & Arabic".tr),
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
            title: Text("Clear Data".tr),
            subtitle: Text("samsung A20"),
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
