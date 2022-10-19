import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/widgets/views/cards/balances/balances.dart';

import '../../../../constants/app_colors.dart';
import '../../../../model/objects/pull_data.dart';
import '../../../../widgets/structural/list_Structural.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../widgets/views/form/form.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../../widgets/views/reusebles/reusables.dart';

class PortfolioAdviceVC extends StatefulWidget {
  const PortfolioAdviceVC({Key? key}) : super(key: key);

  @override
  _PortfolioAdviceVCState createState() => _PortfolioAdviceVCState();
}

class _PortfolioAdviceVCState extends State<PortfolioAdviceVC> {
  @override
  Widget build(BuildContext context) {
    var pulldata2 = PullData(data: [
      AnalyticsCards().card01(),
    ], more: "", title: "", position: Axis.vertical);


    return Column(
      children: [
        ListStrutural(
          data: pulldata2,
          colorTitle: AppColors.black,
          height: null,
        ),
        Container(
          width: Get.width,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.purpura.withAlpha(25),
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ExpansionTile(
                title: const UILabels(
                  text: "Model Portfolio",
                  textLines: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                children: [
                  const ReusablesView().list07(),
                  const ReusablesView().list07(),
                  const ReusablesView().list07(),
                  const ReusablesView().list07(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget list07(){
    return ExpansionTile(
      title: const UILabels(
        text: "iShares core U.S. Aggregate bond ETF",
        textLines: 1,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const[
          UILabels(
            text: "AAG",
            textLines: 1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          UILabels(
            text: "20%",
            textLines: 1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          UILabels(
            text: "\$0.00%",
            textLines: 1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          SizedBox()
        ],
      ),
      children: [
        Container(
            width: Get.width,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.gray3,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(color: AppColors.purpura, offset: Offset(-5, 0)),
              ],
            ),
            child: Column(
              children:  [
                const UILabels(
                  text: "iShares core U.S. Aggregate bond ETF has exhibited a sharpe ratio of 1.03 over the past 5 years. ",
                  textLines: 0,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                const SizedBox(height: 10),
                const UILabels(
                  text: "Sharpe ratio is equal to the average yearly return devided by return volatility.",
                  textLines: 0,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                const SizedBox(height: 10),
                SizedBox(
                    height: 50,
                    width: Get.width,
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'See Details',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList:  const [],
                        cb: (v) {
                        })
                ),
              ],
            )),
      ],
    );
  }
}
