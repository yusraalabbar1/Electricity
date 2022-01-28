import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';

CollectionReference t = FirebaseFirestore.instance
    .collection('informationUsers')
    .doc("$idAcount")
    .collection("totalConsumption");
