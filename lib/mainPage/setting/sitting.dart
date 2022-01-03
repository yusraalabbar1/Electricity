import 'package:flutter/material.dart';

class sitting extends StatefulWidget {
  sitting({Key? key}) : super(key: key);

  @override
  _sittingState createState() => _sittingState();
}

class _sittingState extends State<sitting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting"),
      ),
      body: ListView(
        children: [
          Card(
              child: ListTile(
            title: Text("Bill Limit"),
            subtitle: Text("2000"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.settings),
            onTap: () {
              setState(() {});
            },
          )),
          Card(
              child: ListTile(
            title: Text("Notification"),
            subtitle: Text("ON"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.notification_add),
            onTap: () {
              setState(() {});
            },
          )),
          Card(
              child: ListTile(
            title: Text("SMS notificatin"),
            subtitle: Text("OFF"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.send_to_mobile),
            onTap: () {
              setState(() {});
            },
          )),
          Card(
              child: ListTile(
            title: Text("Language"),
            subtitle: Text("English"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.language),
            onTap: () {
              setState(() {});
            },
          )),
          Card(
              child: ListTile(
            title: Text("Data Clear"),
            subtitle: Text("samsung A20"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.delete),
            onTap: () {
              setState(() {});
            },
          )),
        ],
      ),
    );
  }
}
