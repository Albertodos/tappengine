import 'package:flutter/material.dart';
import 'package:tappengine/widgets/views/cards/info/info.dart';
import 'package:tappengine/widgets/views/reusebles/reusables.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/analytics/analytics.dart';

class OverviewVC extends StatefulWidget {
  const OverviewVC({super.key});

  @override
  State<OverviewVC> createState() => _OverviewVCState();
}

class _OverviewVCState extends State<OverviewVC> {
  @override
  Widget build(BuildContext context) {
    var pulldata2 = PullData(data: [
      AnalyticsCards().card01(),
    ], more: "", title: "", position: Axis.vertical);
    var pulldata3 = PullData(
        data: [ReusablesView().list01(), ReusablesView().list01(), ReusablesView().list01(), ReusablesView().list01()],
        more: "",
        title: "Investment",
        position: Axis.vertical);
    var pulldata4 = PullData(
        data: [ReusablesView().list01(), ReusablesView().list01(), ReusablesView().list01(), ReusablesView().list01()],
        more: "Info",
        title: "Stats",
        position: Axis.vertical);
    var pulldata5 = PullData(data: [
      ReusablesView(),
      ReusablesView().list02(),
      ReusablesView().list02(),
    ], more: "", title: "Important", position: Axis.vertical);
    var pulldata6 = PullData(data: [
      InfoCards(),
      InfoCards(),
      InfoCards().card01(),
    ], more: "", title: "About Bitcoin", position: Axis.vertical);

    return Column(
      children: [
        ListStrutural(
          data: pulldata2,
          colorTitle: AppColors.black,
          height: null,
        ),
        ListStrutural(
          data: pulldata4,
          colorTitle: AppColors.black,
          height: null,
        ),
        ListStrutural(
          data: pulldata5,
          colorTitle: AppColors.black,
          height: null,
        ),
        ListStrutural(
          data: pulldata6,
          colorTitle: AppColors.black,
          height: null,
        ),
      ],
    );
  }
}
