import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/model/pref.dart';
import 'package:electricity/view/mainPage/consumptionMain/monitor.dart';
import 'package:electricity/view/mainPage/consumptionMain/value_monitor.dart';
import 'package:flutter/material.dart';

/*
class ElectricConsumMonitor extends StatefulWidget {
  final notes;
  ElectricConsumMonitor({this.notes});

  @override
  _ElectricConsumMonitorState createState() => _ElectricConsumMonitorState();
}

class _ElectricConsumMonitorState extends State<ElectricConsumMonitor> {
  */
class ElectricConsumMonitor extends StatelessWidget {
  final notes;
  ElectricConsumMonitor({this.notes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(20),
            child: Text(
              "current Consumption",
              style: Theme.of(context).textTheme.headline6,
            )),
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
                  '${notes["currentCon"]}',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            "k watt",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            "total Consumption since the start",
            style: Theme.of(context).textTheme.headline6,
          ),
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
                            '${notes["totalConsy"]}',
                            style: Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "watt",
                      style: Theme.of(context).textTheme.headline6,
                    ),
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
                            '${notes["totalConwatt"]}',
                            style: TextStyle(color: Colors.red, fontSize: 48),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "sy",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
