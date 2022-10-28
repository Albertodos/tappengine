import 'package:flutter/material.dart';
import 'package:tappengine/widgets/views/cards/crypto/model/crypto.dart';
import 'package:tappengine/widgets/views/cards/info/info.dart';
import 'package:tappengine/widgets/views/reusebles/reusables.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../../widgets/views/cards/analytics/graph.dart';

class OverviewVC extends StatefulWidget {
  final Crypto crypto;
  const OverviewVC({super.key, required this.crypto});

  @override
  State<OverviewVC> createState() => _OverviewVCState();
}

class _OverviewVCState extends State<OverviewVC> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pulldata2 = PullData(data: [
      AnalyticsCards(
        crypto: widget.crypto,
      ).graph(context)
    ], more: "", title: "", position: Axis.vertical);
    var pulldata3 = PullData(data: [ReusablesView().list03()], more: "", title: "Investment", position: Axis.vertical);
    var pulldata4 = PullData(
        data: [ReusablesView().list01(), ReusablesView().list01(), ReusablesView().list01(), ReusablesView().list01()],
        more: "Info",
        title: "Stats",
        position: Axis.vertical);
    var pulldata5 = PullData(data: [
      ReusablesView(),
      ReusablesView().list02(),
      ReusablesView().list02(),
    ], more: "", title: "About Bitcoin", position: Axis.vertical);
    var pulldata6 = PullData(data: [
      InfoCards(),
      InfoCards(),
      InfoCards().card01(),
    ], more: "", title: "Important", position: Axis.vertical);

    return Column(
      children: [
        ListStrutural(
          data: pulldata2,
          colorTitle: AppColors.black,
          height: null,
        ),
        ListStrutural(
          data: pulldata3,
          colorTitle: AppColors.black,
          height: null,
        ),
        // ListStrutural(
        //   data: pulldata4,
        //   colorTitle: AppColors.black,
        //   height: null,
        // ),
        // ListStrutural(
        //   data: pulldata5,
        //   colorTitle: AppColors.black,
        //   height: null,
        // ),
        // ListStrutural(
        //   data: pulldata6,
        //   colorTitle: AppColors.black,
        //   height: null,
        // ),
      ],
    );
  }
}
