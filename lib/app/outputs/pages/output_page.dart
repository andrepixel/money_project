// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:money_project/app/outputs/output_controller.dart';
import 'package:money_project/app/outputs/widgets/bottom_title_widget.dart';
import 'package:money_project/app/outputs/widgets/left_title_widget.dart';
import 'package:money_project/app/outputs/widgets/list_fl_spot.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class OutputPage extends StatefulWidget {
  String isOutput;

  OutputPage({
    Key? key,
    required this.isOutput,
  });

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends ModularState<OutputPage, OutputController> {
  @override
  void initState() {
    if (widget.isOutput == "false") {
      controller.getMonthsInsert();
    } else {
      controller.getMonthsOutput();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ComponentPopWidget(
              title: "Output",
              path: "/",
            ),
            InteractiveViewer(
              boundaryMargin: EdgeInsets.all(80),
              minScale: 0.5,
              maxScale: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 150,
                  ),
                  child: SizedBox(
                    height: 400,
                    width: 350,
                    child: ValueListenableBuilder(
                      valueListenable: controller.year,
                      builder: (context, value, child) {
                        return LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(
                              enabled: true,
                              handleBuiltInTouches: true,
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor: Colors.grey,
                                tooltipRoundedRadius: 8,
                                getTooltipItems:
                                    (List<LineBarSpot> lineBarsSpot) {
                                  return lineBarsSpot.map(
                                    (lineBarSpot) {
                                      return LineTooltipItem(
                                        lineBarSpot.y.toString(),
                                        const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ).toList();
                                },
                              ),
                            ),
                            backgroundColor: Color.fromARGB(255, 247, 249, 255),
                            lineBarsData: [
                              LineChartBarData(
                                spots: controller.listValues.value.length == 12
                                    ? ListFlSpot(controller)
                                    : [],
                                isCurved: true,
                                barWidth: 2,
                                gradient: LinearGradient(
                                  colors: widget.isOutput == "false"
                                      ? [
                                          Colors.green,
                                          Colors.blue,
                                        ]
                                      : [
                                          Colors.red,
                                          Colors.orange,
                                        ],
                                ),
                                preventCurveOverShooting: true,
                              ),
                            ],
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 1,
                                  getTitlesWidget: BottomTitleWidgets,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: LeftTitleWidgets,
                                  interval:
                                      controller.valuesLeftIntervalOutputPage(),
                                  reservedSize: 70,
                                ),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                          ),
                        );
                      },
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
}
