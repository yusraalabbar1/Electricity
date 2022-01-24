import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

dialogeNotificationSms(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    borderSide: BorderSide(color: Colors.green, width: 2),
    width: 350,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.BOTTOMSLIDE,
    title: 'Notificatio',
    desc: 'Do you to get notificatio SMS???',
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      print("okkkkk");
    },
  )..show();
}
