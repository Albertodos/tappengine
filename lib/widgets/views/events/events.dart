// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/sheet/events/eventsSheet.dart';

import '../../../../constants/app_colors.dart';
import '../../ui_kits/button_ui/button_ui.dart';
import '../../ui_kits/labels_ui/label_ui.dart';

class EventsCards extends StatelessWidget {
  EventsCards({super.key});
  var positionEvents = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget cardHearder(context, Function(int) cb) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  UILabels(
                    text: "Corporate Events",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  UILabels(
                    text: "Events",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: AppColors.purpura.withAlpha(25),
              ),
            ),
          ]),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 50,
                      child: UIBottons(
                          labels: UILabels(
                            text: 'My Events',
                            textLines: 0,
                            color: positionEvents.value == 0 ? AppColors.white : AppColors.purpura,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          colorList: const [],
                          cb: (v) {
                            cb(0);
                            positionEvents.value = 0;
                            // Navigator.pushNamed(
                            //   context,
                            //   "/corporateEvents",
                            // );
                          }).out(positionEvents.value == 0 ? AppColors.purpura : Colors.transparent)),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                      height: 50,
                      child: UIBottons(
                          labels: UILabels(
                            text: 'All Events',
                            textLines: 0,
                            color: positionEvents.value == 1 ? AppColors.white : AppColors.purpura,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          borderColor: AppColors.gray3,
                          colorList: const [],
                          cb: (v) {
                            cb(1);
                            positionEvents.value = 1;
                          }).out(positionEvents.value == 1 ? AppColors.purpura : Colors.transparent)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cards01(context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/corporateEvents",
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Get.width - 64,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: AppColors.gray,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    UILabels(
                      text: "24",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    UILabels(
                      text: "October",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 60,
                  width: 2,
                  color: AppColors.gray3,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      UILabels(
                        text: "Market Closed",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      UILabels(
                        text: "Holiday",
                        textLines: 1,
                        color: AppColors.purpura2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.white,
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget cards02(context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   "/corporateEvents",
        // );
        EventsSheet().infoEntity(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Get.width - 64,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: AppColors.gray,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 60,
                  width: 2,
                  color: AppColors.gray3,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      UILabels(
                        text: "No Events for this Month",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      UILabels(
                        text: "No Events",
                        textLines: 1,
                        color: AppColors.purpura2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
