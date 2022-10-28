import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/widgets/views/cards/info/info.dart';
import 'package:tappengine/widgets/views/cards/news/model/news.dart';
import 'package:tappengine/widgets/views/cards/news/news.dart';
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
  final news = <NewsCards>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    News().getListDataItem("data.dataUrl", context).then((value) {
      news.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pulldata2 = PullData(data: [
      AnalyticsCards().card01(),
    ], more: "", title: "", position: Axis.vertical);

    return Column(
      children: [
        Obx(
          () => news.isNotEmpty
              ? ListStrutural(
                  data: PullData(data: news, more: "", title: "", position: Axis.horizontal),
                  colorTitle: AppColors.black,
                  height: 420.0,
                )
              : const CircularProgressIndicator(
                  color: AppColors.black,
                ),
        ),
      ],
    );
  }
}
