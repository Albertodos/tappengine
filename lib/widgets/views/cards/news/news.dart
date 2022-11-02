import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/news.dart';

class NewsCards extends StatelessWidget {
  const NewsCards({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchUrl(news.url);
      },
      child: Container(
        height: 420,
        margin: const EdgeInsets.all(10),
        width: Get.width - 100,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.purpura.withAlpha(25),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 220,
                  width: Get.width,
                  child: Image.network(
                    news.img ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              UILabels(
                text: news.title ?? "",
                textLines: 1,
                color: AppColors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 8,
              ),
              UILabels(
                text: news.body ?? "",
                textLines: 5,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),

              // UILabels(
              //   text: news.url ?? "",
              //   textLines: 1,
              //   color: AppColors.blue,
              //   fontSize: 12,
              //   fontWeight: FontWeight.w400,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(_url) async {
    Uri url = Uri.parse(_url);
    if (!await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
    )) {
      throw 'Could not launch $_url';
    }
  }
}
