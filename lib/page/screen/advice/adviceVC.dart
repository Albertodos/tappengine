import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/page/screen/reusebles/advice/overview_adviceVC.dart';
import 'package:tappengine/page/screen/reusebles/advice/portfolio_adviceVC.dart';
import 'package:tappengine/widgets/views/cards/user/userCard.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../helpers/cliper.dart';
import '../../../model/objects/pull_data.dart';
import '../../../widgets/structural/list_Structural.dart';
import '../../../widgets/views/cards/balances/balances.dart';
import '../../../widgets/views/cards/menu/menuCard.dart';
import '../reusebles/advice/transaction_adviceVC.dart';
import '../reusebles/buy_overview/page_view/news.dart';
import '../reusebles/buy_overview/page_view/overview.dart';
import '../reusebles/buy_overview/page_view/transactions.dart';

class AdviceVC extends StatefulWidget {
  const AdviceVC({Key? key}) : super(key: key);

  @override
  _AdviceVCState createState() => _AdviceVCState();
}

class _AdviceVCState extends State<AdviceVC> {
  final pagePosition = 0.obs;
  PageController controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    var pulldata = PullData(data: [const BalancesCards().card03(context)], more: "", title: "", position: Axis.vertical);
    var pulldata1 = PullData(data: [
      MenuCards().tabMenu([
        "Overview",
        "Portfolio",
        "Transactions",
      ], (p) {
        controller.animateToPage(p,
            curve: Curves.decelerate, duration: const Duration(milliseconds: 300)); // for animated jump. Requires a curve and a duration

        pagePosition.value = p;
      }),
    ], more: "", title: "", position: Axis.vertical);

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            collapsedHeight: 100,
            backgroundColor: AppColors.purpura.withAlpha(0),
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Obx(
                    () => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: UserCards(
                    user: globals.userPersonal.userPersonal.value.toJsonInfo(),
                  ).userWelcome(context),
                ),
              ),
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
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                children: [
                  ListStrutural(
                    data: pulldata,
                    colorTitle: AppColors.black,
                    height: null,
                  ),
                  ListStrutural(
                    data: pulldata1,
                    colorTitle: AppColors.black,
                    height: null,
                  ),
                  ExpandablePageView(
                    controller: controller,
                    onPageChanged: (value) {},
                    children: const [
                      OverviewAdviceVC(),
                     PortfolioAdviceVC(),
                     TransactionAdviceVC(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

