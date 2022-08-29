import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:money_project/app/inserts/widgets/field_multiple_choices_widget.dart';
import 'package:money_project/app/outputs/output_controller.dart';
import 'package:money_project/app/outputs/widgets/bottom_title_widget.dart';
import 'package:money_project/app/outputs/widgets/left_title_widget.dart';
import 'package:money_project/app/outputs/widgets/list_fl_spot.dart';
import 'package:money_project/core/commons/constants.dart';
import 'package:money_project/core/commons/widgets/component_pop_widget.dart';

class OutputPage extends StatefulWidget {
  const OutputPage({Key? key}) : super(key: key);

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends ModularState<OutputPage, OutputController> {
  @override
  void initState() {
    controller.getMonths();
    super.initState();
  }

  @override
  void dispose() {
    controller.listValues.value = [];
    super.dispose();
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
            ValueListenableBuilder(
              valueListenable: controller.year,
              builder: (context, value, child) {
                return FieldMultipleChoicesWidget(
                  initialValue: "2022",
                  listObjects: years,
                  nameField: "Selecione o Ano",
                  variableController: controller.year,
                );
              },
            ),
            InteractiveViewer(
              boundaryMargin: EdgeInsets.all(80),
              minScale: 0.5,
              maxScale: 3,
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
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: controller.listValues.value.length == 12
                                    ? ListFlSpot(controller)
                                    : [],
                                isCurved: true,
                                barWidth: 2,
                                color: Colors.black,
                                preventCurveOverShooting: true,
                                dotData: FlDotData(
                                  show: true,
                                ),
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
                                  interval: controller.valueMedian(),
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
