import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ElectricConsumMonitor extends StatefulWidget {
  ElectricConsumMonitor({Key? key}) : super(key: key);

  @override
  _ElectricConsumMonitorState createState() => _ElectricConsumMonitorState();
}

class _ElectricConsumMonitorState extends State<ElectricConsumMonitor> {
  var current = 20;
  var totalWatt = 2000;
  var totalSy = 3500;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.2,
        title: Text(" Electric Consumption Monitor",
            style: TextStyle(color: Color(0xff21C49D), fontSize: 20)),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(20),
              child: Text("current Consumption",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          PhysicalModel(
            color: Colors.teal,
            elevation: 8,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(100),
            child: GestureDetector(
              onTap: () {},
              child: ClipOval(
                child: Container(
                  color: Colors.white,
                  height: 140.0,
                  width: 140.0,
                  child: Center(
                      child: Text(
                    '$current',
                    style: TextStyle(color: Color(0xff21C49D), fontSize: 40),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text("k watt",
                style: TextStyle(color: Color(0xff1C846B), fontSize: 20)),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text("total Consumption sice the start",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    PhysicalModel(
                      color: Colors.teal,
                      elevation: 8,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        onTap: () {},
                        child: ClipOval(
                          child: Container(
                            color: Colors.white,
                            height: 140.0,
                            width: 140.0,
                            child: Center(
                                child: Text(
                              '$totalWatt',
                              style: TextStyle(
                                  color: Color(0xff21C49D), fontSize: 40),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text("watt",
                          style: TextStyle(
                              color: Color(0xff1C846B), fontSize: 20)),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    PhysicalModel(
                      color: Colors.teal,
                      elevation: 8,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        onTap: () {},
                        child: ClipOval(
                          child: Container(
                            color: Colors.white,
                            height: 140.0,
                            width: 140.0,
                            child: Center(
                                child: Text(
                              '$totalSy',
                              style: TextStyle(color: Colors.red, fontSize: 40),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text("sy",
                          style: TextStyle(
                              color: Color(0xff1C846B), fontSize: 20)),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
