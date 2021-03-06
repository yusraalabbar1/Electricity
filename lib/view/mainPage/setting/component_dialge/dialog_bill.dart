import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/controller/control.dart';
import 'package:electricity/model/pref.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

GlobalKey<FormState> formstate = new GlobalKey<FormState>();
homecontroller controller = Get.find();
showLoading(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Form(
                  key: formstate,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "How much do you want to pay?".tr,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: "$bill"),
                              onSaved: (string) {
                                bill = string!;
                                controller.changeBill();
                                saveprefBill();
                                int lim = int.parse(bill);
                                FirebaseFirestore.instance
                                    .collection('informationUsers')
                                    .doc("$idAcount")
                                    .update({'limit': lim});
                              },
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  "sy",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RaisedButton(
                            child: Text("ok".tr),
                            onPressed: () {
                              var formdata = formstate.currentState;
                              if (formdata!.validate()) {
                                formdata.save();
                                print("valid");
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RaisedButton(
                            child: Text("cancel".tr),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        );
      });
}
