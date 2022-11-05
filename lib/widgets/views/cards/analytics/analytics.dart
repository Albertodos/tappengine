import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/widgets/views/cards/analytics/custom_graphic.dart';

import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';
import 'circle_graphic.dart';

class AnalyticsCards extends StatelessWidget {
  const AnalyticsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget card01() {
    return Container(
      //height: 260,
      width: Get.width,
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
      alignment: Alignment.center,
      child: Column(
        children: [
          CircleGraphic(),
          card("Fixed Income", "25%", AppColors.green),
          card("Bonds", "38%", AppColors.purpura8),
          card("Money Markets", "34%", AppColors.blue),
          card("Others", "52%", AppColors.red),
        ],
      ),
    );
  }

  Widget card(title, percent, Color color){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 8, ),
      child: Row(
        children: [
          Expanded(child: Row(
            children: [
              Container(
                  width: 5,
                  height: 30,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),)
              ),
              const SizedBox(width: 8),
               UILabels(
                text: title,
                textLines: 1,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ],
          )),
           UILabels(
            text: percent,
            textLines: 1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget card02() {
    return Container(
      height: 300,
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
      alignment: Alignment.center,
    );
  }

  Widget card03() {
    return Container(
      height: 260,
      width: Get.width,
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
      child: CustomGraphic(
        chartDataList: [],
      ),
      alignment: Alignment.center,
    );
  }
}
