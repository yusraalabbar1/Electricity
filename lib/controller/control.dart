import 'package:electricity/model/pref.dart';
import 'package:electricity/view/mainPage/setting/component_dialge/dialog_bill.dart';
import 'package:get/get.dart';

class homecontroller extends GetxController {
  var limitBill;
  var notific;
  var notificSms;

  changeBill() {
    limitBill = bill;
    update();
  }

  OnNotification() {
    notific = notification;
    update();
  }

  OnSmsNotification() {
    notificSms = notificationSMS;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("init home controller");
    super.onInit();
    changeBill();
    OnNotification();
    OnSmsNotification();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("ready home controller");
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("close home controller");
    super.onClose();
  }
}
