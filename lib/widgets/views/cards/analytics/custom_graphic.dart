import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/model/objects/dashboard/dashboard.dart';

class CustomGraphic extends StatefulWidget {
  final List<DashboardModel> chartDataList;

  const CustomGraphic({Key? key, required this.chartDataList}) : super(key: key);

  @override
  State<CustomGraphic> createState() => _CustomGraphicState();
}

class _CustomGraphicState extends State<CustomGraphic> {
  @override
  Widget build(BuildContext context) {
    //const maxX = 368.0; //chartDataList.isEmpty ? 368.0 : chartDataList.value.map((e) => e.x).reduce(max);

    return AspectRatio(
      aspectRatio: 1.5,
      child: SizedBox(
        height: 300,
        width: 300,
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(isVisible: false),
            primaryYAxis: NumericAxis(
              // X axis will be opposed
              anchorRangeToVisiblePoints: false,

              opposedPosition: true,
              majorGridLines: MajorGridLines(color: Colors.red, width: 0),
              minorGridLines: MinorGridLines(color: Colors.red, width: 0),
              majorTickLines: MajorTickLines(color: Colors.red, width: 0),
              minorTickLines: MinorTickLines(color: Colors.red, width: 0),
            ),
            // Chart title
            title: ChartTitle(text: ''),
            // Enable legend
            legend: Legend(isVisible: false, position: LegendPosition.bottom, iconWidth: 30, iconHeight: 30),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: false),
            series: <ChartSeries<DashboardModel, String>>[
              SplineSeries<DashboardModel, String>(
                dataSource: widget.chartDataList,
                xValueMapper: (DashboardModel sales, _) =>
                (sales.x?.year.toString() ?? "") +
                    "/" +
                    (sales.x?.day.toString() ?? "") +
                    "/" +
                    (sales.x?.month.toString() ?? "") +
                    "/" +
                    (sales.x?.hour.toString() ?? ""),
                yValueMapper: (DashboardModel sales, _) =>
                    double.parse(sales.y.toString()),
                color: AppColors.green,
                width: 3,
                markerSettings: MarkerSettings(borderColor: Colors.white, isVisible: false, color: Colors.blue),

                // Enable data label
                //dataLabelSettings: DataLabelSettings(isVisible: true)
              )
            ]),
      ),
    );
  }
}
