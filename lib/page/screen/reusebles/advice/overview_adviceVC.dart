import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../model/objects/pull_data.dart';
import '../../../../widgets/structural/list_Structural.dart';
import '../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../widgets/views/cards/info/info.dart';
import '../../../../widgets/views/reusebles/reusables.dart';

class OverviewAdviceVC extends StatefulWidget {
  const OverviewAdviceVC({Key? key}) : super(key: key);

  @override
  _OverviewAdviceVCState createState() => _OverviewAdviceVCState();
}

class _OverviewAdviceVCState extends State<OverviewAdviceVC> {
  @override
  Widget build(BuildContext context) {

    var pulldata = PullData(
        data: [ReusablesView().list04()],
        more: "",
        title: "",
        position: Axis.vertical);
    var pulldata1 = PullData(
        data: [ReusablesView().list05()],
        more: "",
        title: "",
        position: Axis.vertical);
    var pulldata2 = PullData(data: [
      AnalyticsCards().card03(),
    ], more: "", title: "", position: Axis.vertical);

    return Column(
      children: [
        ListStrutural(
          data: pulldata,
          colorTitle: AppColors.black,
          height: null,
        ),
        ListStrutural(
          data: pulldata1,
          colorTitle: AppColors.black,
          height: null,
        ),
        ListStrutural(
          data: pulldata2,
          colorTitle: AppColors.black,
          height: null,
        ),
      ],
    );
  }
}
