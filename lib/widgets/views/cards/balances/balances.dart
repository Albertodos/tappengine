import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

class BalancesCards extends StatelessWidget {
  const BalancesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: Get.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColors.purpura.withAlpha(25),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UILabels(
                text: "Crypto",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              const UILabels(
                text: "\$3,00000.32",
                textLines: 1,
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "+\$2,33543563",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  UILabels(
                    text: "1.82%",
                    textLines: 1,
                    color: AppColors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Container(
                height: 2,
                color: AppColors.purpura.withAlpha(25),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
