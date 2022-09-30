import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/news.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/orders.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/overview.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/page_view/transactions.dart';
import 'package:tappengine/widgets/views/cards/info/info.dart';
import 'package:tappengine/widgets/views/reusebles/reusables.dart';
import '../../../../helpers/cliper.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../../constants/app_colors.dart';
import '../../../../model/objects/pull_data.dart';
import '../../../../widgets/structural/list_Structural.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../widgets/views/cards/balances/balances.dart';
import '../../../../widgets/views/cards/menu/menuCard.dart';
import '../../../../widgets/views/cards/publicity/publicity.dart';
import '../../../../widgets/views/cards/user/userCard.dart';
import '../../../../widgets/views/cards/watchlists.dart/watchlists.dart';

class BuyOverviewVC extends StatefulWidget {
  const BuyOverviewVC({super.key});

  @override
  State<BuyOverviewVC> createState() => _BuyOverviewVCState();
}

class _BuyOverviewVCState extends State<BuyOverviewVC> {
  final pagePosition = 0.obs;
  PageController controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    var pulldata = PullData(data: [const BalancesCards().card02(context)], more: "", title: "", position: Axis.vertical);
    var pulldata2 = PullData(data: [
      MenuCards().tabMenu([
        "Overview",
        "News",
        "Orders",
        "Transactions",
      ], (p) {
        controller.animateToPage(p,
            curve: Curves.decelerate, duration: const Duration(milliseconds: 300)); // for animated jump. Requires a curve and a duration

        pagePosition.value = p;
      }),
    ], more: "", title: "", position: Axis.vertical);

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
                    // title: Obx(
                    //   () => Padding(
                    //     padding: const EdgeInsets.only(bottom: 20),
                    //     child: UserCards(
                    //       user: globals.userPersonal.userPersonal.value.toJsonInfo(),
                    //     ).userWelcome(context),
                    //   ),
                    // ),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListStrutural(
                        data: pulldata,
                        colorTitle: AppColors.black,
                        height: null,
                      ),
                      ListStrutural(
                        data: pulldata2,
                        colorTitle: AppColors.black,
                        height: null,
                      ),
                      ExpandablePageView(
                        controller: controller,
                        onPageChanged: (value) {},
                        children: const [
                          OverviewVC(),
                          NewsVC(),
                          OrdersVC(),
                          TransactionsVC(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 50,
                      child: UIBottons(
                          labels: const UILabels(
                            text: 'Buy',
                            textLines: 0,
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          colorList: const [],
                          cb: (v) {})),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                      height: 50,
                      child: UIBottons(
                              labels: const UILabels(
                                text: 'Sell',
                                textLines: 0,
                                color: AppColors.purpura,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              colorList: const [],
                              cb: (v) {})
                          .out(Colors.transparent)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
