import 'package:cloud_firestore/cloud_firestore.dart';

List total = [];
CollectionReference t = FirebaseFirestore.instance
    .collection('informationUsers')
    .doc("3s2luIgG6maTDWcRJhnp")
    .collection("totalConsumption");
