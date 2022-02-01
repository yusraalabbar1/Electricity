import 'package:electricity/controller/control.dart';
import 'package:electricity/model/pref.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

homecontroller controller = Get.find();
dialogeNotificationSms(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Do you want to get notificatio SMS???".tr),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      width: 70,
                      child: MaterialButton(
                        color: Color(0xff21C49D),
                        textColor: Colors.white,
                        child: Text("Yes".tr),
                        onPressed: () async {
                          notificationSMS = "ON";
                          controller.OnSmsNotification();
                          await getprefOnNotificatinSMS();
                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      width: 55,
                      child: MaterialButton(
                        color: Color(0xff21C49D),
                        textColor: Colors.white,
                        child: Text("No".tr),
                        onPressed: () async {
                          notificationSMS = "OFF";
                          controller.OnSmsNotification();
                          await getprefOnNotificatinSMS();

                          Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
