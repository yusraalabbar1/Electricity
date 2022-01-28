import 'package:electricity/translation/app_languge_controller.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

AppLanguage langControl = Get.find();

dialogLang(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Choose The Language".tr),
              Center(
                child: Row(
                  children: [
                    MaterialButton(
                      child: Text("العربية"),
                      onPressed: () {
                        langControl.changeLanguage('ar');
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      child: Text("English"),
                      onPressed: () {
                        langControl.changeLanguage('en');
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      });
}
