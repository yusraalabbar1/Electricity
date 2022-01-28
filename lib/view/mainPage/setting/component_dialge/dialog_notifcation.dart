import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

dialogeNotification(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    borderSide: BorderSide(color: Colors.green, width: 2),
    width: 350,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.BOTTOMSLIDE,
    title: 'Notificatio'.tr,
    desc: 'Do you want to get notificatio???'.tr,
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      print("okkkkk");
    },
  )..show();
}
