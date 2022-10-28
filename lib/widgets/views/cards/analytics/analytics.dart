import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';
import '../crypto/model/crypto.dart';
import 'graph.dart';

class AnalyticsCards extends StatelessWidget {
  final Crypto? crypto;
  final dashboardData = <DashboardData>[].obs;
  AnalyticsCards({super.key, this.crypto});

  @override
  Widget build(BuildContext context) {
    if (crypto!.dashboardData?.isEmpty ?? true) {
      crypto!.getDashboardData("2", context).then(
        (value) {
          dashboardData.value = value;
        },
      );
    } else {
      dashboardData.value = crypto!.dashboardData ?? [];
    }
    return Expanded(
      child: Obx(
        () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: dashboardData
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.purpura3,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.purpura,
                            ),
                            height: getHeigth(double.parse(e.y ?? "0")),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }

  Widget graph(BuildContext context) {
    if (crypto!.dashboardData?.isEmpty ?? true) {
      crypto!.getDashboardData("2", context).then(
        (value) {
          dashboardData.value = value;
        },
      );
    } else {
      dashboardData.value = crypto!.dashboardData ?? [];
    }
    return Obx(() => CustomGraphic(
          chartDataList: dashboardData,
        ));
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

  double getHeigth(double value) {
    var max = dashboardData.reduce((curr, next) => double.parse(curr.y ?? "0") > double.parse(next.y ?? "0") ? curr : next);
    return (value * 120) / double.parse(max.y ?? "0");
  }
}
