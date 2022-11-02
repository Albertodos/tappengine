import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/widgets/views/cards/news/model/news.dart';
import 'package:tappengine/widgets/views/cards/news/news.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../../widgets/views/cards/crypto/model/crypto.dart';

class NewsVC extends StatefulWidget {
  final Crypto crypto;
  const NewsVC({super.key, required this.crypto});

  @override
  State<NewsVC> createState() => _NewsVCState();
}

class _NewsVCState extends State<NewsVC> {
  final news = <NewsCards>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    News().getListDataItem("Watchlist/GetLastedNews/${widget.crypto.fromsymbol}", context).then((value) {
      news.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => news.isNotEmpty
              ? ListStrutural(
                  data: PullData(data: news, more: "", title: "", position: Axis.vertical),
                  colorTitle: AppColors.black,
                  height: null,
                )
              : const CircularProgressIndicator(
                  color: AppColors.black,
                ),
        ),
      ],
    );
  }
}
