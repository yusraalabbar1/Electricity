import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

dialogeClear(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    borderSide: BorderSide(color: Colors.green, width: 2),
    width: 350,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.BOTTOMSLIDE,
    title: 'Clear informaion',
    desc: 'Do you to clear all information???',
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      print("okkkkk");
    },
  )..show();
}
