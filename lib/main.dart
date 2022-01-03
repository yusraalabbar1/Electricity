import 'package:electricity/startSreen/logIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'mainPage/consumptionMain/ElectricConsumMonitor.dart';
import 'mainPage/HomePage.dart';
import 'mainPage/statistic/types/annual.dart';
import 'mainPage/statistic/types/daily.dart';
import 'mainPage/statistic/types/monthly.dart';
import 'mainPage/statistic/types/weekly.dart';

var select = 1;
bool islogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: islogin == false ? screenLogIn() : HomePage(),
        theme: ThemeData(
            fontFamily: 'Mukta',
            primaryColor: Color(0xff21C49D),
            buttonColor: Color(0xff21C49D),
            textTheme: TextTheme(
                headline6: TextStyle(
              fontSize: 15,
              color: Colors.blue,
            ))),
        routes: {
          // "signIn": ((context) => logIn()),
          // "signUp": ((context) => signUp()),
          "screenLogIn": ((context) => screenLogIn()),
          "HomePage": ((context) => HomePage()),
          "ElectricConsumMonitor": ((context) => ElectricConsumMonitor()),
          "daily": ((context) => daily()),
          "weekly": ((context) => weekly()),
          "monthly": ((context) => monthy()),
          "annual": ((context) => annual()),
        });
  }

  monthly() {}
}
