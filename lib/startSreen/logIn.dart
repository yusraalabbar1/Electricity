import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:shared_preferences/shared_preferences.dart';

var numberAcount;
var isloginParf;

class screenLogIn extends StatefulWidget {
  screenLogIn({Key? key}) : super(key: key);

  @override
  _screenLogInState createState() => _screenLogInState();
}

class _screenLogInState extends State<screenLogIn> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  // var numberAcount;
  bool _isObscure = true;
  var passWord;
  List a = [];
  FocusNode myFocusNode = new FocusNode();
  Future send() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print(a);
      print("valid");
      for (var i = 0; i < a.length; i++) {
        print("======================");
        print(numberAcount);
        print(a[i]['numberAcount']);

        print("======================");
        if (a[i]['numberAcount'].toString() == numberAcount.toString() &&
            a[i]['password'].toString() == passWord.toString()) {
          print("true");

          Navigator.of(context).pushReplacementNamed("HomePage");
        } else {
          print("false");
        }
      }
    } else {
      print("Image Not upload");
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          title: 'Error',
          desc: 'Informaton is false',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
        ..show();
    }
  }

  getDataRealTime() {
    FirebaseFirestore.instance
        .collection('informationUsers')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        a.add(element.data());
        print(element.data());
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataRealTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))],
      ),
      body: ListView(
        children: <Widget>[
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 300,
              color: Color(0xff21C49D),
              child: Center(
                  child: Text(
                "E+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
              key: formstate,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.format_list_numbered,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus
                                ? Color(0xffFAB10C)
                                : Colors.black),
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff27A2BB), width: 1.5)),
                        labelText: " Number counter  ",
                      ),
                      // autovalidateMode: AutovalidateMode.always,

                      onSaved: (string) {
                        numberAcount = string;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus
                                ? Color(0xffFAB10C)
                                : Colors.black),
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff27A2BB), width: 1.5)),
                        labelText: " Password  ",
                      ),
                      // autovalidateMode: AutovalidateMode.always,

                      onSaved: (string) {
                        passWord = string;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 60, right: 60),
            child: RaisedButton(
              splashColor: Colors.white,
              onPressed: () {
                send();
                //
              },
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
