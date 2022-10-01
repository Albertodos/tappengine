import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';

import '../../../ui_kits/labels_ui/label_ui.dart';

class MenuCards extends StatelessWidget {
  MenuCards({super.key});

  final positionTabMenu = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: AppColors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.purpura.withAlpha(25)),
              child: SvgPicture.asset(
                'assets/icons/icverify_identify.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const UILabels(
              text: "I'm looking to buy crypto",
              textLines: 1,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.purpura,
            ),
            const SizedBox(
              height: 20,
            ),
            const UILabels(
              text: "Trade over 50 cryptocurrencies via mobile, desktop and tablet devices.",
              textLines: 0,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget tabMenu(List<String> menuTab, Function(int) position) {
    return Obx(
      () => Column(
        children: [
          SizedBox(
              height: 50,
              width: Get.width,
              child: !positionTabMenu.value.isNaN
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          Expanded(
                            child: ListView.builder(
                              // shrinkWrap: true,
                              itemCount: menuTab.length,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,

                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    positionTabMenu.value = index;
                                    position(index);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      UILabels(
                                        text: menuTab[index],
                                        textLines: 1,
                                        color: positionTabMenu.value == index ? AppColors.purpura : AppColors.gray2,
                                        fontSize: 16,
                                        fontWeight: positionTabMenu.value == index ? FontWeight.w700 : FontWeight.w400,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 4,
                            width: 30,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: AppColors.purpura),
                          ),
                        ])
                  : null),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
