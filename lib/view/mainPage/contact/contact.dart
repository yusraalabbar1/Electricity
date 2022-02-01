import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'button_builder.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Contact Us".tr,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: 100,
                  color: Color(0xff21C49D),
                  child: Center(
                      child: Icon(
                    Icons.contacts,
                    color: Colors.white,
                  )),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 80,
                child: MyButton(
                  assetName: 'images/phone2.jpg',
                  text: 'Phone'.tr,
                  onpressed: () async {
                    const tel = 'tel:+221778821171';
                    if (await canLaunch(tel)) {
                      await launch(tel);
                    } else {
                      throw 'could not launch $tel';
                    }
                  },
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 60,
                child: MyButton(
                  assetName: 'images/sms2.png',
                  text: 'SMS'.tr,
                  onpressed: () async {
                    const sms = 'sms:+221778821171';
                    if (await canLaunch(sms)) {
                      await launch(sms);
                    } else {
                      throw 'could not launch $sms';
                    }
                  },
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 60,
                child: MyButton(
                  assetName: 'images/whats.jpg',
                  text: 'WhatsApp'.tr,
                  onpressed: () async {
                    const whatsapp = 'whatsapp://send?phone=+221778821171';
                    if (await canLaunch(whatsapp)) {
                      await launch(whatsapp);
                    } else {
                      throw 'could not launch $whatsapp';
                    }
                  },
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 60,
                child: MyButton(
                  assetName: 'images/face2.png',
                  text: 'Facebook'.tr,
                  onpressed: () async {
                    const face = 'http://m.me/ruba.salhani';
                    if (await canLaunch(face)) {
                      await launch(face);
                    } else {
                      throw 'could not launch $face';
                    }
                  },
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 60,
                child: MyButton(
                  assetName: 'images/email2.png',
                  text: 'E-mail'.tr,
                  onpressed: () async {
                    final Uri _emailuri = Uri(
                        scheme: 'mailto',
                        path: 'ruba.salhani@gmail.com',
                        queryParameters: (<String, String>{
                          'subject': 'Example Subject & Symbols are allowed!'
                        }));

                    if (await canLaunch(_emailuri.toString())) {
                      await launch(_emailuri.toString());
                    } else {
                      throw 'could not launch $_emailuri.toString()';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
