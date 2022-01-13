import 'package:flutter/material.dart';

abstract class CustomTheme {
  static get lightTheme {
    //1
    return ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Mukta',
        buttonColor: Color(0xff21C49D),
        /////////////////////////////////////
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 5.2,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xff21C49D),
            fontSize: 20,
          ),
        ),
        ///////////////////////////////////
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xff27A2BB))),
          fillColor: Colors.white,
          hoverColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff27A2BB), width: 1.5)),
        ),
        //////////////////////////////////////
        textTheme: TextTheme(
            headline6: TextStyle(color: Colors.grey[600]),
            headline3: TextStyle(color: Color(0xff21C49D)),
            headline4: TextStyle(color: Color(0xff1C846B))));
  }
}
