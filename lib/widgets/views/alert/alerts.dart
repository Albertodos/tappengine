// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../ui_kits/button_ui/button_ui.dart';
import '../../ui_kits/labels_ui/label_ui.dart';

class AlertsCards extends StatelessWidget {
  AlertsCards({super.key});
  var positionEvents = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget tryAgain(Function(String) cb) {
    return SizedBox(
      width: Get.width - 64,
      height: 260,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: AppColors.purpura.withAlpha(25),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const UILabels(
                text: "Error retrieving data",
                textLines: 1,
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 16,
              ),
              // const UILabels(
              //   text: "Something Went Terribly Wrong",
              //   textLines: 1,
              //   color: AppColors.black,
              //   fontSize: 14,
              //   fontWeight: FontWeight.w400,
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              SizedBox(
                  height: 50,
                  child: UIBottons(
                      labels: const UILabels(
                        text: 'Try Again',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                      colorList: const [],
                      cb: cb)),
            ],
          ),
        ),
      ),
    );
  }
}
