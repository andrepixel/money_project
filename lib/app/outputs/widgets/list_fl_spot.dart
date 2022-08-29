import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_project/app/outputs/output_controller.dart';

List<FlSpot> ListFlSpot(OutputController controller) {
  return [
    FlSpot(
      0,
      controller.listValues.value[0],
    ),
    FlSpot(
      1,
      controller.listValues.value[1],
    ),
    FlSpot(
      2,
      controller.listValues.value[2],
    ),
    FlSpot(
      3,
      controller.listValues.value[3],
    ),
    FlSpot(
      4,
      controller.listValues.value[4],
    ),
    FlSpot(
      5,
      controller.listValues.value[5],
    ),
    FlSpot(
      6,
      controller.listValues.value[6],
    ),
    FlSpot(
      7,
      controller.listValues.value[7],
    ),
    FlSpot(
      8,
      controller.listValues.value[8],
    ),
    FlSpot(
      9,
      controller.listValues.value[9],
    ),
    FlSpot(
      10,
      controller.listValues.value[10],
    ),
    FlSpot(
      11,
      controller.listValues.value[11],
    )
  ];
}
