import 'package:electricity/view/mainPage/setting/component_dialge/dialog_bill.dart';
import 'package:get/get.dart';

class homecontroller extends GetxController {
  var limitBill;
  changeBill() {
    limitBill = int.parse(bill);
    update();
  }

  int counter = 0;
  void incremental() {
    counter++;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("init home controller");
    super.onInit();
    changeBill();
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
