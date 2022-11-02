import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/views/cards/crypto/model/crypto.dart';

class CustomGraphic extends StatelessWidget {
  final List<DashboardData> chartDataList;

  CustomGraphic({Key? key, required this.chartDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //const maxX = 368.0; //chartDataList.isEmpty ? 368.0 : chartDataList.value.map((e) => e.x).reduce(max);

    return SfCartesianChart(
        primaryXAxis: CategoryAxis(isVisible: false),
        primaryYAxis: CategoryAxis(isVisible: false),
        plotAreaBorderWidth: 0,

        // Chart title
        margin: EdgeInsets.zero,
        title: ChartTitle(text: ''),
        // Enable legend
        legend: Legend(isVisible: false, position: LegendPosition.bottom, iconWidth: 30, iconHeight: 30),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: false),
        series: <ChartSeries<DashboardData, String>>[
          AreaSeries<DashboardData, String>(
            dataSource: chartDataList,
            xValueMapper: (DashboardData sales, _) =>
                (sales.x?.year.toString() ?? "") +
                "/" +
                (sales.x?.day.toString() ?? "") +
                "/" +
                (sales.x?.month.toString() ?? "") +
                "/" +
                (sales.x?.hour.toString() ?? ""),
            yValueMapper: (DashboardData sales, _) => double.parse(sales.y.toString()),

            gradient: LinearGradient(colors: [
              AppColors.green1.withAlpha(60),
              Colors.grey.withAlpha(0),
            ], stops: [
              0.0,
              1.0
            ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, tileMode: TileMode.repeated),
            borderColor: AppColors.green1,
            borderWidth: 2,
            // width: 3,
            markerSettings: MarkerSettings(borderColor: Colors.white, isVisible: false, color: Colors.blue),

            // Enable data label
            //dataLabelSettings: DataLabelSettings(isVisible: true)
          )
        ]);
  }

  // Widget rightTitleWidgets(double value, TitleMeta meta) {
  //   const style = TextStyle(
  //     color: Color(0xff67727d),
  //     fontWeight: FontWeight.bold,
  //     fontSize: 15,
  //   );
  //   String text;
  //   switch (value.toInt()) {
  //     case 1:
  //       text = '10';
  //       break;
  //     case 3:
  //       text = '30';
  //       break;
  //     case 5:
  //       text = "2500";
  //       break;
  //     default:
  //       return Container();
  //   }

  //   return Text(text, style: style, textAlign: TextAlign.right);
  // }
}
