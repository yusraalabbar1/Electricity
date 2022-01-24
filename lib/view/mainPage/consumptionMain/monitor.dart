import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/model/pref.dart';
import 'package:electricity/view/mainPage/consumptionMain/value_monitor.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:flutter/material.dart';

import 'Electric_consum_monitor.dart';

class monitor extends StatefulWidget {
  monitor({Key? key}) : super(key: key);

  @override
  State<monitor> createState() => _monitorState();
}

class _monitorState extends State<monitor> {
  List total = [];
  List curr = [];
  CollectionReference c = FirebaseFirestore.instance
      .collection('informationUsers')
      .doc("3s2luIgG6maTDWcRJhnp")
      .collection("currentConsumption");

  CollectionReference t = FirebaseFirestore.instance
      .collection('informationUsers')
      .doc("3s2luIgG6maTDWcRJhnp")
      .collection("totalConsumption");

  nastedupdateCollectionTotal() async {
    await t.doc("eUMklEfcmI4yGMdlRaF9").get().then((value) {
      if (value.exists) {
        print('Document data: ${value.data}');

        total.add(value.data());
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  nastedupdateCollectionCurrent() async {
    await c.doc("YFfXsyQxq4LqabaJDmBQ").get().then((value) {
      if (value.exists) {
        print('Document data: ${value.data}');

        curr.add(value.data());
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getprefNumberAcount();
    nastedupdateCollectionTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          " Electric Consumption Monitor",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: StreamBuilder(
        stream: c.snapshots(),
        // initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key("$index"),
                  child: ElectricConsumMonitor(
                      notes: snapshot.data.docs[int.parse(numberAcount) - 1]
                          .data()));
            },
          );
        },
      ),
    );
  }
}
