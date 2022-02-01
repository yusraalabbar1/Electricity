import 'package:loading_indicator/loading_indicator.dart';

import 'package:flutter/material.dart';

const List<Color> _kDefaultRainbowColors = const [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

loadPage(context) =>
    (BuildContext context, Indicator indicator, bool showPathBackground) {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: false,
          builder: (ctx) {
            return Scaffold(
              appBar: AppBar(
                title: Text(indicator.toString().split('.').last),
              ),
              body: Padding(
                padding: const EdgeInsets.all(64),
                child: Center(
                  child: LoadingIndicator(
                    indicatorType: indicator,
                    colors: _kDefaultRainbowColors,
                    strokeWidth: 4.0,
                    pathBackgroundColor:
                        showPathBackground ? Colors.black45 : null,
                  ),
                ),
              ),
            );
          },
        ),
      );
    };
