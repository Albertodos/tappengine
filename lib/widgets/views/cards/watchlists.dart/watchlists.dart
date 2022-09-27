import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/widgets/animation/animation.dart';
import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';

class WatchlistsCards extends StatelessWidget {
  WatchlistsCards({super.key});
  var menuTab = ['Crypto', 'Stocks'];
  final positionTabMenu = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget tabMenu() {
    return Obx(
      () => SizedBox(
          height: 70,
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
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  UILabels(
                                    text: menuTab[index],
                                    textLines: 1,
                                    color: positionTabMenu.value == index ? AppColors.purpura : AppColors.black,
                                    fontSize: 18,
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
                      const SizedBox(
                        height: 20,
                      )
                    ])
              : null),
    );
  }

  Widget list() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: UILabels(
                          text: "BNB",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      UILabels(
                        text: "0.82%",
                        textLines: 1,
                        color: AppColors.purpura,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: UILabels(
                          text: "BNB • 161,234,261",
                          textLines: 1,
                          color: AppColors.purpura,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      UILabels(
                        text: "\$12,3444.09",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 2,
                    color: AppColors.purpura.withAlpha(25),
                  ),
                ],
              ),
            )
          ]),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
