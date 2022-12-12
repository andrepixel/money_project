import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/outputs/output_controller.dart';
import 'package:money_project/core/commons/constants.dart';

import '../../../core/commons/widgets/component_pop_widget.dart';

class OutputGraphic2Page extends StatefulWidget {
  const OutputGraphic2Page({Key? key}) : super(key: key);

  @override
  State<OutputGraphic2Page> createState() => _OutputGraphic2PageState();
}

class _OutputGraphic2PageState
    extends ModularState<OutputGraphic2Page, OutputController> {
  final Color leftBarColor = Colors.green;
  final Color rightBarColor = Colors.red;
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    controller.getValuesMonths();

    final barGroup1 = makeGroupData(
      0,
      controller.valuesMonthsDouble[0][0],
      controller.valuesMonthsDouble[0][1],
    );
    final barGroup2 = makeGroupData(
      1,
      controller.valuesMonthsDouble[1][0],
      controller.valuesMonthsDouble[1][1],
    );
    final barGroup3 = makeGroupData(
      2,
      controller.valuesMonthsDouble[2][0],
      controller.valuesMonthsDouble[2][1],
    );
    final barGroup4 = makeGroupData(
      3,
      controller.valuesMonthsDouble[3][0],
      controller.valuesMonthsDouble[3][1],
    );
    final barGroup5 = makeGroupData(
      4,
      controller.valuesMonthsDouble[4][0],
      controller.valuesMonthsDouble[4][1],
    );
    final barGroup6 = makeGroupData(
      5,
      controller.valuesMonthsDouble[5][0],
      controller.valuesMonthsDouble[5][1],
    );
    final barGroup7 = makeGroupData(
      6,
      controller.valuesMonthsDouble[6][0],
      controller.valuesMonthsDouble[6][1],
    );
    final barGroup8 = makeGroupData(
      7,
      controller.valuesMonthsDouble[7][0],
      controller.valuesMonthsDouble[7][1],
    );
    final barGroup9 = makeGroupData(
      8,
      controller.valuesMonthsDouble[8][0],
      controller.valuesMonthsDouble[8][1],
    );
    final barGroup10 = makeGroupData(
      9,
      controller.valuesMonthsDouble[9][0],
      controller.valuesMonthsDouble[9][1],
    );
    final barGroup11 = makeGroupData(
      10,
      controller.valuesMonthsDouble[10][0],
      controller.valuesMonthsDouble[10][1],
    );
    final barGroup12 = makeGroupData(
      11,
      controller.valuesMonthsDouble[11][0],
      controller.valuesMonthsDouble[11][1],
    );

    final listInsertions = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
      barGroup12,
    ];

    rawBarGroups = listInsertions;

    showingBarGroups = rawBarGroups;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Saida Gráfico 2",
              path: "./outputmenu2",
            ),
            Divider(
              color: Colors.transparent,
              height: 50,
            ),
            SizedBox(
              height: 500,
              width: 700,
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(80),
                minScale: 5,
                maxScale: 10,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Legenda',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Receita',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.green,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Despesa',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Expanded(
                          child: BarChart(
                            BarChartData(
                              maxY: 1000,
                              groupsSpace: 1000.00,
                              barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.grey,
                                  getTooltipItem: (a, b, c, d) => null,
                                ),
                                touchCallback: (FlTouchEvent event, response) {
                                  if (response == null ||
                                      response.spot == null) {
                                    setState(() {
                                      touchedGroupIndex = -1;
                                      showingBarGroups = List.of(rawBarGroups);
                                    });

                                    return;
                                  }

                                  touchedGroupIndex =
                                      response.spot!.touchedBarGroupIndex;

                                  setState(
                                    () {
                                      if (!event.isInterestedForInteractions) {
                                        touchedGroupIndex = -1;
                                        showingBarGroups =
                                            List.of(rawBarGroups);

                                        return;
                                      }
                                      showingBarGroups = List.of(rawBarGroups);
                                      if (touchedGroupIndex != -1) {
                                        var sum = 0.0;

                                        for (final rod in showingBarGroups[
                                                touchedGroupIndex]
                                            .barRods) {
                                          sum += rod.toY;
                                        }

                                        final avg = sum /
                                            showingBarGroups[touchedGroupIndex]
                                                .barRods
                                                .length;

                                        showingBarGroups[touchedGroupIndex] =
                                            showingBarGroups[touchedGroupIndex]
                                                .copyWith(
                                          barRods: showingBarGroups[
                                                  touchedGroupIndex]
                                              .barRods
                                              .map((rod) {
                                            return rod.copyWith(toY: avg);
                                          }).toList(),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  axisNameWidget: Text(
                                    "                Mêses",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  axisNameSize: 22,
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: bottomTitles,
                                    reservedSize: 42,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 70,
                                    interval: 5000,
                                    getTitlesWidget: leftTitles,
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: showingBarGroups,
                              gridData: FlGridData(show: false),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    String text;

    if (value == 0) {
      text = 'R\$0';
    } else if (value <= 500) {
      text = 'R\$500';
    }else if (value >= 1000) {
      text = 'R\$1K';
    } else if (value == 5000) {
      text = 'R\$5K';
    } else if (value >= 10000) {
      text = 'R\$10K+';
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final List<String> listOfMonths = List.filled(12, "");

    for (int i = 0; i < listOfMonths.length; i++) {
      listOfMonths[i] = months[i].substring(0, 1);
    }

    final Widget text;

    if (value <= listOfMonths.length - 1) {
      text = Text(
        listOfMonths[value.toInt()],
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 16, //margin top
        child: text,
      );
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: SizedBox.shrink(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: rightBarColor,
          width: width,
        ),
      ],
    );
  }
}
