// import 'package:electricity/mainPage/setting/alert_dialog.dart';
import 'package:electricity/main.dart';
import 'package:electricity/view/mainPage/startSreen/theme.dart';
import 'package:flutter/material.dart';

import '../Home_page.dart';
import '../consumptionMain/Electric_consum_monitor.dart';
import 'logIn.dart';
import '../statistic/types/annual.dart';
import '../statistic/types/daily.dart';
import '../statistic/types/monthly.dart';
import '../statistic/types/weekly.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: islogin == false ? screenLogIn() : HomePage(),
        theme: CustomTheme.lightTheme,
        routes: {
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
