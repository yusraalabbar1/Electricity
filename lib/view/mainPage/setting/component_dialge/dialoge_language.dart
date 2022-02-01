import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:electricity/translation/app_languge_controller.dart';
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
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 55,
                        width: 70,
                        child: MaterialButton(
                          color: Color(0xff21C49D),
                          textColor: Colors.white,
                          child: Text("العربية"),
                          onPressed: () {
                            langControl.changeLanguage('ar');
                            Navigator.of(context).pop();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
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
                          child: Text("English"),
                          onPressed: () {
                            langControl.changeLanguage('en');
                            Navigator.of(context).pop();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      });
}
