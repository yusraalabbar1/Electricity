import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/model/pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'componentDialogAuth/dialogsUth.dart';
import 'package:get/get.dart';

import 'package:loading_indicator/loading_indicator.dart';

var numberAcount;
var idAcount;
List ids = [];

class screenLogIn extends StatefulWidget {
  screenLogIn({Key? key}) : super(key: key);

  @override
  _screenLogInState createState() => _screenLogInState();
}

class _screenLogInState extends State<screenLogIn> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  bool _isObscure = true;
  var passWord;
  List a = [];
  List ids = [];

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
        if (a[i]['numberAcount'].toString() == numberAcount.toString()) {
          print("true");
          if (a[i]['password'].toString() == passWord.toString()) {
            await savepref();
            await saveprefNumberAcount();
            await saveprefIdAcount();
            print("=======id=========");
            idAcount = ids[i];

            await saveprefIdAcount();
            print(idAcount);
            print("=======id=========");
            dialogeinfoTrue(context);
            Navigator.of(context).pushReplacementNamed("HomePage");
          } else {
            dialogePasswordFalse(context);
          }
        } else {
          print("false");
        }
      }
    } else {
      print("Not valid...");
      dialogeInfoFalse(context);
    }
  }

  getDataRealTime() {
    FirebaseFirestore.instance
        .collection('informationUsers')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        ids.add(element.id);

        a.add(element.data());
      });
      print("================================");
      print(a);
      print(ids);
      print("================================");
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
        backgroundColor: Color(0xff21C49D),
        elevation: 0.0,
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.format_list_numbered,
                          color: Color(0xff27A2BB),
                        ),
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus
                                ? Color(0xffFAB10C)
                                : Colors.black),
                        labelText: " Number counter  ".tr,
                      ),
                      // autovalidateMode: AutovalidateMode.always,
                      validator: (text) {
                        if (text!.length > 5) {
                          return "can not enter bigerr than 5";
                        }
                        return null;
                      },
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
                      textInputAction: TextInputAction.next,
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
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus
                                ? Color(0xffFAB10C)
                                : Colors.black),
                        labelText: " Password  ".tr,
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (text) {
                        if (text!.length < 3) {
                          return "can not enter less than 3";
                        }
                        return null;
                      },
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
                "Log In".tr,
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
