import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';

class AnalyticsCards extends StatelessWidget {
  const AnalyticsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget card01() {
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
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(
                  child: UILabels(
                    text: "Spends",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: const [
                    UILabels(
                      text: "last 12 months",
                      textLines: 1,
                      color: AppColors.purpura,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    Icon(Icons.keyboard_arrow_down, color: AppColors.purpura),
                  ],
                ),
              ],
            ),
            const UILabels(
              text: "\$20,204",
              textLines: 1,
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: const [
                Icon(Icons.keyboard_arrow_down, color: AppColors.green),
                UILabels(
                  text: "\$1,009.78",
                  textLines: 1,
                  color: AppColors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                child: LinearProgressIndicator(
                  value: 0.7,
                  color: Colors.greenAccent, //<-- SEE HERE
                  backgroundColor: Colors.grey, //<-- SEE HERE
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
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
}
