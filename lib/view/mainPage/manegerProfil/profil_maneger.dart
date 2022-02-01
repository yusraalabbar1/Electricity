import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/model/pref.dart';
import 'package:electricity/view/mainPage/startSreen/logIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

// final notes;
//   ListNote({this.notes});
class ListNote extends StatefulWidget {
  final notes;
  ListNote({Key? key, this.notes}) : super(key: key);

  @override
  State<ListNote> createState() => _ListNoteState();
}

class _ListNoteState extends State<ListNote> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  // ListNote({this.notes});

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var firstName = widget.notes['firstName'];
    var lastName = widget.notes['lastName'];
    var email = widget.notes['email'];
    return Form(
      key: formstate,
      child: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xff21C49D),
                child: _photo != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _photo!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/electmange.appspot.com/o/${numberAcount}.png?alt=media&token=8327edf7-550a-4ab6-9355-0a5624899446",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
              ),
            ),
          ),
          Text("${widget.notes['firstName']} ${widget.notes['lastName']}",
              style: TextStyle(color: Color(0xff1C846B), fontSize: 24)),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("First:".tr,
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 20)))),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    // enabled: false,
                    decoration: InputDecoration(
                      labelText: "${widget.notes['firstName']}",
                    ),
                    onSaved: (string) {
                      if (string == "" || string == null) {
                        firstName = widget.notes['firstName'];
                      } else {
                        firstName = string;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("Last:".tr,
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 20)))),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    // enabled: false,
                    decoration: InputDecoration(
                      labelText: "${widget.notes['lastName']}",
                    ),
                    onSaved: (string) {
                      if (string == "" || string == null) {
                        lastName = widget.notes['lastName'];
                      } else {
                        lastName = string;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("Email:".tr,
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 20)))),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  child: TextFormField(
                    // enabled: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "${widget.notes['email']}",
                    ),
                    onSaved: (string) {
                      if (string == "" || string == null) {
                        email = widget.notes['email'];
                      } else {
                        email = string;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("Counter:".tr,
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 20)))),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: "${widget.notes['numberAcount']}",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                      margin: EdgeInsets.all(30),
                      child: InkWell(
                        onTap: () {
                          islogin = "false";
                          bill = "";
                          saveprefsignUp();
                          Navigator.of(context)
                              .pushReplacementNamed("screenLogIn");
                        },
                        child: Text("SignOut".tr,
                            style: TextStyle(
                                color: Color(0xff1C846B), fontSize: 15)),
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                      margin: EdgeInsets.all(30),
                      child: InkWell(
                        onTap: () {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            formdata.save();
                            DocumentReference users = FirebaseFirestore.instance
                                .collection('informationUsers')
                                .doc("$idAcount");
                            users.update({
                              "firstName": "$firstName",
                              "lastName": "$lastName",
                              "email": "$email"
                            });
                          }
                        },
                        child: Text("Update".tr,
                            style: TextStyle(
                                color: Color(0xff1C846B), fontSize: 15)),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  ////////////////////////////////////////////////
  ///

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = '$fileName';

    final ref =
        firebase_storage.FirebaseStorage.instance.ref("$numberAcount" + ".png");
    await ref.putFile(_photo!);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
