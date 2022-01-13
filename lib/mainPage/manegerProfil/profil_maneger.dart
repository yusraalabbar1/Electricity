import 'package:flutter/material.dart';

class ListNote extends StatelessWidget {
  final notes;
  ListNote({this.notes});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Color(0xff21C49D), spreadRadius: 0.1)
              ],
            ),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: Color(0xff21C49D),
                    ))),
          ),
        ),
        Text("${notes['firstName']} ${notes['lastName']}",
            style: TextStyle(color: Color(0xff1C846B), fontSize: 24)),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text("First: ",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 20)))),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "${notes['firstName']}",
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
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text("Last: ",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 20)))),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "${notes['lastName']}",
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
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text("Email: ",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 20)))),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "${notes['email']}",
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
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text("Counter: ",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 20)))),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "${notes['numberAcount']}",
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
                        onTap: () {},
                        child: Text("contact us",
                            style: TextStyle(
                                color: Color(0xff1C846B), fontSize: 15)),
                      )),
                )),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                    margin: EdgeInsets.all(30),
                    child: InkWell(
                      onTap: () {},
                      child: Text("SignUp",
                          style: TextStyle(
                              color: Color(0xff1C846B), fontSize: 15)),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
