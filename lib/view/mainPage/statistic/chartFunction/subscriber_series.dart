import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberSeries {
  final String day;
  final charts.Color barColor;
  final int subscribers;

  SubscriberSeries(
      {required this.day, required this.subscribers, required this.barColor});
}
