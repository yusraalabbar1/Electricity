import 'package:electricity/view/mainPage/statistic/chartFunction/value_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:electricity/view/mainPage/statistic/chartFunction/value_chart.dart';
import 'package:flutter/material.dart';

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
          "Statistics",
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
                            "All numbers shown are in killowatt-hours",
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
                        "daily",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    PhysicalModel(
                      color: Colors.teal,
                      elevation: 8,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("daily");
                        },
                        child: ClipOval(
                          child: Container(
                            color: Colors.white,
                            height: 140.0,
                            width: 140.0,
                            child: Center(
                                child: Text(
                              '$daily',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                    ),
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
                        "weekly",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    PhysicalModel(
                      color: Colors.teal,
                      elevation: 8,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("weekly");
                        },
                        child: ClipOval(
                          child: Container(
                            color: Colors.white,
                            height: 140.0,
                            width: 140.0,
                            child: Center(
                                child: Text(
                              '$weekly',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                    ),
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
                        "monthly",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    PhysicalModel(
                      color: Colors.teal,
                      elevation: 8,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("monthly");
                        },
                        child: ClipOval(
                          child: Container(
                            color: Colors.white,
                            height: 140.0,
                            width: 140.0,
                            child: Center(
                                child: Text(
                              '$monthly',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                    ),
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
                        "annual",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    PhysicalModel(
                      color: Colors.teal,
                      elevation: 8,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("annual");
                        },
                        child: ClipOval(
                          child: Container(
                            color: Colors.white,
                            height: 140.0,
                            width: 140.0,
                            child: Center(
                                child: Text(
                              '$annual',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                    ),
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
