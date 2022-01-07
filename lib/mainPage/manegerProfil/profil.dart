import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/startSreen/logIn.dart';
import 'package:flutter/material.dart';

import 'profilManeger.dart';

class profil extends StatefulWidget {
  profil({Key? key}) : super(key: key);

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  CollectionReference notesReference =
      FirebaseFirestore.instance.collection('informationUsers');

  @override
  void initState() {
    super.initState();
    print(numberAcount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: notesReference.snapshots(),
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
                  child: ListNote(
                      notes: snapshot.data.docs[int.parse(numberAcount) - 1]
                          .data()));
              //Text("${snapshot.data.docs[index].data()['firstName']}");
            },
          );
        },
      ),
    );
  }
}