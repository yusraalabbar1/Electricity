import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

dialogLang(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Choose The Language"),
              Center(
                child: Row(
                  children: [
                    RaisedButton(
                      child: Text("Arabic"),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      child: Text("English"),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      });
}
