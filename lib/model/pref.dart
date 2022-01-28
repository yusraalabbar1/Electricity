import 'package:electricity/view/mainPage/setting/component_dialge/dialog_bill.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

var islogin = "false";
var bill;
savepref() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  pres.setString('isLogin', 'true');
}

saveprefsignUp() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  pres.setString('isLogin', 'false');
}

saveprefNumberAcount() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  pres.setString('numberAcount', "$numberAcount");
}

saveprefIdAcount() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  pres.setString('idAcount', '$idAcount');
}

saveprefBill() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  pres.setString('bill', '$bill');
}

getprefBill() async {
  SharedPreferences pres = await SharedPreferences.getInstance();

  bill = pres.getString('bill');
  if (bill == null || bill == "") {
    bill = "0";
    print("bill in pref not init");
  }
  print("billt in pref: " + bill);
}

getprefIdAcount() async {
  SharedPreferences pres = await SharedPreferences.getInstance();

  idAcount = pres.getString('idAcount');
  if (idAcount == null) {
    idAcount = "";
    print("id account in pref not init");
  }
  print("id account in pref: " + idAcount);
}

getprefNumberAcount() async {
  SharedPreferences pres = await SharedPreferences.getInstance();
  numberAcount = pres.getString('numberAcount');
  print("number account in pref: " + numberAcount);
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
