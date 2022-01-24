import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

var islogin = "false";
savepref() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  pres.setString('isLogin', 'true');
}

saveprefNumberAcount() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  pres.setString('numberAcount', "$numberAcount");
}

getprefNumberAcount() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  print("************************");
  print(pres.getString('numberAcount'));
  print("************************");
  numberAcount = pres.getString('numberAcount');
}

getpref() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  print("************************");
  print(pres.getString('isLogin'));
  print("************************");

  if (pres.getString('isLogin') == null) {
    islogin = "false";
  } else {
    islogin = pres.getString('isLogin')!;
  }
}

deletepref() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  pres.remove("name");
}
