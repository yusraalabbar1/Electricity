import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity/view/mainPage/statistic/physical_stat.dart';
import 'package:electricity/view/mainPage/statistic/chartFunction/value_chart.dart';
import 'package:electricity/view/mainPage/statistic/physical_stat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:charts_flutter/flutter.dart';

class statistics extends StatefulWidget {
  statistics({Key? key}) : super(key: key);

  @override
  _statisticsState createState() => _statisticsState();
}

class _statisticsState extends State<statistics> {
  final v = valueChart();
  @override
  @override
  void initState() {
    super.initState();
    v.nastedupdateCollection();
  }

  Widget build(BuildContext context) {
    var daily = 22;
    var weekly = 33;
    var monthly = 50;
    var annual = 200;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "statistics".tr,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Card(
                elevation: 0.0,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            "All numbers shown are in killowatt-hours".tr,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ))
                  ],
                )),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "daily".tr,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    physicalModel(context, "daily", daily),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "weekly".tr,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    physicalModel(context, "weekly", weekly),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "monthly".tr,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    physicalModel(context, "monthly", monthly),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "annual".tr,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    physicalModel(context, "annual", annual),
                    SizedBox(
                      height: 20,
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
