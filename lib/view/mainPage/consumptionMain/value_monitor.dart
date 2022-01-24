import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/model/pref.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';

List curr = [];
List total = [];

class valueMonitor {
  CollectionReference c = FirebaseFirestore.instance
      .collection('informationUsers')
      .doc("3s2luIgG6maTDWcRJhnp")
      .collection("currentConsumption");

  CollectionReference t = FirebaseFirestore.instance
      .collection('informationUsers')
      .doc("3s2luIgG6maTDWcRJhnp")
      .collection("totalConsumption");

  nastedupdateCollectionCurrent() {
    c.doc("YFfXsyQxq4LqabaJDmBQ").get().then((value) {
      if (value.exists) {
        print('Document data: ${value.data}');

        curr.add(value.data());
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  nastedupdateCollectionTotal() {
    t.doc("eUMklEfcmI4yGMdlRaF9").get().then((value) {
      if (value.exists) {
        print('Document data: ${value.data}');

        total.add(value.data());
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
