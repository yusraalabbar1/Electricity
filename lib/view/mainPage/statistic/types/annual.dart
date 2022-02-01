import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/view/mainPage/statistic/chartFunction/subscriber_chart.dart';
import 'package:electricity/view/mainPage/statistic/chartFunction/subscriber_series.dart';
import 'package:electricity/view/mainPage/statistic/chartFunction/value_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';

class annual extends StatefulWidget {
  annual({Key? key}) : super(key: key);

  @override
  _annualState createState() => _annualState();
}

class _annualState extends State<annual> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("===========================");
    print(a);
    // print(a[0]['Friday']);
  }

  final List<SubscriberSeries> data = [
    SubscriberSeries(
      day: "1",
      subscribers: a[0]['Sunday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "2",
      subscribers: a[0]['Monday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "3",
      subscribers: a[0]['Tuesday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "4",
      subscribers: a[0]['Wednesday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "5",
      subscribers: a[0]['Thursday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "6",
      subscribers: a[0]['Friday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "7",
      subscribers: a[0]['Saturday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "8",
      subscribers: a[0]['Saturday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "9",
      subscribers: a[0]['Friday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "10",
      subscribers: a[0]['Wednesday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "11",
      subscribers: a[0]['Tuesday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
    SubscriberSeries(
      day: "12",
      subscribers: a[0]['Wednesday'],
      barColor: charts.ColorUtil.fromDartColor(Color(0xff21C49D)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("anuual Statistic".tr),
        ),
        body: ListView(
          children: [
            Center(
                child: SubscriberChart(
              data: data,
            )),
            Container(
              margin: EdgeInsets.all(30),
              child: Text(
                "Chart of consumtion for the last year".tr,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Card(
                  elevation: 0.0,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.info)),
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                                "All numbers shown are in killowatt-hours".tr,
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 20)),
                          ))
                    ],
                  )),
            ),
          ],
        ));
  }
}



/*
 ListView(
          children: [
            Center(
                child: SubscriberChart(
              data: data,
            )),
            Container(
              margin: EdgeInsets.all(30),
              child: Text(
                "Chart of consumtion for the last 7 day",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Card(
                  elevation: 0.0,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.info)),
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                                "All numbers shown are in killowatt-hours",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 20)),
                          ))
                    ],
                  )),
            ),
          ],
        )*/