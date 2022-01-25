import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:electricity/model/pref.dart';
//import 'package:electricity/view/mainPage/startSreen/logIn.dart';

List a = [];

class valueChart {
  nastedupdateCollection() {
    users.doc("Puc52AW5ydU0cWG1Qq0w").get().then((value) {
      if (value.exists) {
        print('Document data: ${value.data()}');
        a.add(value.data());
        print(int.parse(numberAcount) - 1);
        print(a[int.parse(numberAcount) - 1]['Friday']);
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  CollectionReference users = FirebaseFirestore.instance
      .collection('informationUsers')
      .doc("3s2luIgG6maTDWcRJhnp")
      .collection("week");
}
