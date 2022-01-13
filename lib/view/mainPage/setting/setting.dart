import 'package:flutter/material.dart';

class sitting extends StatefulWidget {
  sitting({Key? key}) : super(key: key);

  @override
  _sittingState createState() => _sittingState();
}

class _sittingState extends State<sitting> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var bill = "4000";
  Future<void> _showMyDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
                    key: formstate,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "How much do you want to pay?",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(hintText: "$bill"),
                                onSaved: (string) {
                                  bill = string!;
                                },
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "sy",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              child: Text("ok"),
                              onPressed: () {
                                var formdata = formstate.currentState;
                                if (formdata!.validate()) {
                                  formdata.save();
                                  print(bill);
                                  print("valid");
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RaisedButton(
                              child: Text("cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          );
        });
  }

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
          Card(
              child: ListTile(
            title: Text("Bill Limit"),
            subtitle: Text("2000"),
            trailing: Image.asset("images/setting.PNG"),
            leading: Icon(Icons.settings),
            onTap: () {
              // Navigator.of(context).pushNamed("dialog");
              _showMyDialog();
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
