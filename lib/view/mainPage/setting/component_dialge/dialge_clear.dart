import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

dialogeClear(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    borderSide: BorderSide(color: Colors.green, width: 2),
    width: 350,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.BOTTOMSLIDE,
    title: 'Clear Data'.tr,
    desc: 'Do you want to clear all information???'.tr,
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      print("okkkkk");
    },
  )..show();
}
