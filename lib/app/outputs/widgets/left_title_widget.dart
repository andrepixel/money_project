import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget LeftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(fontSize: 12);

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
      'R\$ ${value + 100}',
      style: style,
    ),
  );
}
