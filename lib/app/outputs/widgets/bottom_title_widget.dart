import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget BottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 10,
    color: Colors.purple,
    fontWeight: FontWeight.bold,
  );
  String text;

  switch (value.toInt()) {
    case 0:
      text = 'Jan';
      break;
    case 1:
      text = 'Fev';
      break;
    case 2:
      text = 'Mar';
      break;
    case 3:
      text = 'Abr';
      break;
    case 4:
      text = 'Mai';
      break;
    case 5:
      text = 'Jun';
      break;
    case 6:
      text = 'Jul';
      break;
    case 7:
      text = 'Ago';
      break;
    case 8:
      text = 'Set';
      break;
    case 9:
      text = 'Otu';
      break;
    case 10:
      text = 'Nov';
      break;
    case 11:
      text = 'Dez';
      break;
    default:
      return Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}
