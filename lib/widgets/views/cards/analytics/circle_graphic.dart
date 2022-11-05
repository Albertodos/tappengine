import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';

class CircleGraphic extends StatefulWidget {
  const CircleGraphic({Key? key}) : super(key: key);



  @override
  _CircleGraphicState createState() => _CircleGraphicState();
}

class _CircleGraphicState extends State<CircleGraphic> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Fixed Income', 25, AppColors.green),
      ChartData('Bonds', 38, AppColors.purpura8),
      ChartData('Money Markets', 34, AppColors.blue),
      ChartData('Others', 52, AppColors.red)
    ];

    return Center(
        child: Container(
            child: SfCircularChart(
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      pointColorMapper: (ChartData data, _) => data.color,
                      // Radius of doughnut's inner circle
                      innerRadius: '65%'
                  )
                ]
            )
        )
    );

}



}
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}