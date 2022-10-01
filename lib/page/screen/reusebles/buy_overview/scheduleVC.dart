import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/sheet/payment_method/payment_method.dart';

import '../../../../constants/app_colors.dart';
import '../../../../helpers/cliper.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';

class ScheduleVC extends StatefulWidget {
  const ScheduleVC({super.key});

  @override
  State<ScheduleVC> createState() => _ScheduleVCState();
}

class _ScheduleVCState extends State<ScheduleVC> {
  var selectRepeats = 'Weekly'.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 100,
                  collapsedHeight: 100,
                  backgroundColor: AppColors.purpura.withAlpha(0),
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipPath(
                      clipper: InBorderBotton(),
                      child: ClipPath(
                        clipper: InBorderBotton(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          color: AppColors.purpura,
                        ),
                      ),
                    ),
                    expandedTitleScale: 1,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        cardsDate("Start Date", "Today", Icons.calendar_month_outlined),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                            onTap: () {
                              PaymentMethodSheet().repeats(context, (v) {
                                selectRepeats.value = v;
                              });
                            },
                            child: Obx(() => cardsDate("Repeats", selectRepeats.value, Icons.arrow_drop_down_circle_outlined))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
            child: Column(
              children: [
                const UILabels(
                  text: "Scheduled weekly for every Tuesday, starting on 13 September 2022",
                  textLines: 0,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                    height: 50,
                    width: Get.width,
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'Schedule',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList: const [],
                        cb: (v) {
                          Navigator.pushNamed(context, '/statement');
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardsDate(title, value, icon) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.gray0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UILabels(
                    text: title,
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  UILabels(
                    text: value,
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
