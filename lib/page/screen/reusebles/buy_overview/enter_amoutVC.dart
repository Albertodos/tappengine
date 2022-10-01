import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/news.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/orders.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/overview.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/transactions.dart';
import 'package:tappengine/page/sheet/payment_method/payment_method.dart';
import '../../../../helpers/cliper.dart';
import '../../../../constants/app_colors.dart';
import '../../../../model/objects/pull_data.dart';
import '../../../../widgets/structural/list_Structural.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../../widgets/views/cards/balances/balances.dart';

class EnterAmountVC extends StatefulWidget {
  const EnterAmountVC({super.key});

  @override
  State<EnterAmountVC> createState() => _EnterAmountVCState();
}

class _EnterAmountVCState extends State<EnterAmountVC> {
  final pagePosition = 0.obs;
  PageController controller = PageController(viewportFraction: 1, keepPage: true);

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
                        const UILabels(
                          text: "Buy BTC",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.graphic_eq_outlined,
                              color: AppColors.green,
                            ),
                            UILabels(
                              text: " 1 BTC = \$39 293, 6881",
                              textLines: 1,
                              color: AppColors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                cardsAmount(),
                                const SizedBox(
                                  height: 16,
                                ),
                                cardsAmount2()
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(30)),
                                border: Border.all(width: 1, color: AppColors.gray0),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.purpura.withAlpha(25),
                                    spreadRadius: 0,
                                    blurRadius: 8,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: UILabels(
                                text: "Repeats",
                                textLines: 1,
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            UILabels(
                              text: "Set",
                              textLines: 1,
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
            child: SizedBox(
                height: 50,
                width: Get.width,
                child: UIBottons(
                    labels: const UILabels(
                      text: 'Buy BTC with USD',
                      textLines: 0,
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    colorList: const [],
                    cb: (v) {
                      PaymentMethodSheet().choosePaymentMethod(context);
                    })),
          ),
        ],
      ),
    );
  }

  Widget cardsAmount() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.gray0),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.purpura.withAlpha(25),
        //     spreadRadius: 0,
        //     blurRadius: 28,
        //     offset: Offset(0, 4), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: UILabels(
                        text: "BTC",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    UILabels(
                      text: "+0,00024890",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: UILabels(
                        text: "Balance: 0",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.info_outline,
                      color: AppColors.black,
                      size: 15,
                    ),
                    UILabels(
                      text: " after 0,0000636 BTC fee",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardsAmount2() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.purpura.withAlpha(25),
            spreadRadius: 0,
            blurRadius: 28,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: UILabels(
                        text: "USD",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    UILabels(
                      text: "+0,00024890",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                const UILabels(
                  text: "Balance: 11,34.55",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
