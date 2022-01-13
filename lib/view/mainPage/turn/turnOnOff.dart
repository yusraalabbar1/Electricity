import 'package:flutter/material.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';

class turnOnOff extends StatefulWidget {
  turnOnOff({Key? key}) : super(key: key);

  @override
  _turnOnOffState createState() => _turnOnOffState();
}

class _turnOnOffState extends State<turnOnOff> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: FlutterSwitch(
            width: 125.0,
            height: 55.0,
            valueFontSize: 25.0,
            toggleSize: 45.0,
            value: status,
            borderRadius: 30.0,
            padding: 8.0,
            activeColor: Color.fromRGBO(51, 226, 255, 1),
            inactiveColor: Colors.red,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ),
      ),
    );
  }
}
