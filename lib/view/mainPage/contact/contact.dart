import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'button_builder.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff1C846B),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.0),
              MyButton(
                assetName: 'images/phone.jpg',
                text: 'Phone',
                onpressed: () async {
                  const tel = 'tel:+963940121138';
                  if (await canLaunch(tel)) {
                    await launch(tel);
                  } else {
                    throw 'could not launch $tel';
                  }
                },
              ),
              SizedBox(height: 30.0),
              MyButton(
                assetName: 'images/sms.jpg',
                text: 'SMS',
                onpressed: () async {
                  const sms = 'sms:+963940121138';
                  if (await canLaunch(sms)) {
                    await launch(sms);
                  } else {
                    throw 'could not launch $sms';
                  }
                },
              ),
              SizedBox(height: 30.0),
              MyButton(
                assetName: 'images/whats.jpg',
                text: 'WhatsApp',
                onpressed: () async {
                  const whatsapp = 'whatsapp://send?phone=+963940121138';
                  if (await canLaunch(whatsapp)) {
                    await launch(whatsapp);
                  } else {
                    throw 'could not launch $whatsapp';
                  }
                },
              ),
              SizedBox(height: 30.0),
              MyButton(
                assetName: 'images/facebook.png',
                text: 'Facebook',
                onpressed: () async {
                  const face = 'http://m.me/ruba.salhani';
                  if (await canLaunch(face)) {
                    await launch(face);
                  } else {
                    throw 'could not launch $face';
                  }
                },
              ),
              SizedBox(height: 30.0),
              MyButton(
                assetName: 'images/email.png',
                text: 'E-mail',
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
            ],
          ),
        ),
      ),
    );
  }
}
