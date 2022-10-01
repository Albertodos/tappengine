import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/news.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/orders.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/overview.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/transactions.dart';
import 'package:tappengine/page/sheet/payment_method/payment_method.dart';
import 'package:tappengine/widgets/views/cards/menu/menuCard.dart';
import '../../../../helpers/cliper.dart';
import '../../../../constants/app_colors.dart';
import '../../../../model/objects/pull_data.dart';
import '../../../../model/objects/user/user.dart';
import '../../../../widgets/structural/list_Structural.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../../widgets/views/cards/balances/balances.dart';
import '../../../../widgets/views/form/form.dart';

class StatementVC extends StatefulWidget {
  const StatementVC({super.key});

  @override
  State<StatementVC> createState() => _StatementVCState();
}

class _StatementVCState extends State<StatementVC> {
  final pagePosition = 0.obs;
  PageController controller = PageController(viewportFraction: 1, keepPage: true);
  var userLogin = User();

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
                            UILabels(
                              text: "BTC",
                              textLines: 1,
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            UILabels(
                              text: " • Active",
                              textLines: 1,
                              color: AppColors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        MenuCards().tabMenu(["PDF", "Excel"], (p0) => null),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: EdgeInsets.all(32),
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
                          alignment: Alignment.center,
                          child: Column(
                            children: userLogin
                                .toJsonLogin()
                                .values
                                .map((e) => FromView(
                                      user: e,
                                    ))
                                .toList(),
                          ),
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
            child: Column(
              children: [
                const UILabels(
                  text:
                      "Transaction information is available here while your account is still open. If you need a copy of this after your account is closed, you will need to download it first.",
                  textLines: 0,
                  color: AppColors.black,
                  fontSize: 12,
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
                          text: 'Generate',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList: const [],
                        cb: (v) {
                          // PaymentMethodSheet().choosePaymentMethod(context);
                        })),
              ],
            ),
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
