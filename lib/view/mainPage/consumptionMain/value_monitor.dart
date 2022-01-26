import 'package:cloud_firestore/cloud_firestore.dart';

List total = [];
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
