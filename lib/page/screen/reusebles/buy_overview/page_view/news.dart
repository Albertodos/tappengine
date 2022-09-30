import 'package:flutter/material.dart';
import 'package:tappengine/widgets/views/cards/info/info.dart';
import 'package:tappengine/widgets/views/reusebles/reusables.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/analytics/analytics.dart';

class NewsVC extends StatefulWidget {
  const NewsVC({super.key});

  @override
  State<NewsVC> createState() => _NewsVCState();
}

class _NewsVCState extends State<NewsVC> {
  @override
  Widget build(BuildContext context) {
    var pulldata2 = PullData(data: [
      AnalyticsCards().card01(),
    ], more: "", title: "", position: Axis.vertical);

    return Column(
      children: [
        ListStrutural(
          data: pulldata2,
          colorTitle: AppColors.black,
          height: null,
        ),
      ],
    );
  }
}
