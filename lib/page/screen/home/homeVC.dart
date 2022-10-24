import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/helpers/cliper.dart';
import 'package:tappengine/model/objects/pull_data.dart';
import 'package:tappengine/widgets/structural/list_Structural.dart';
import 'package:tappengine/widgets/views/cards/analytics/analytics.dart';
import 'package:tappengine/widgets/views/cards/publicity/publicity.dart';
import 'package:tappengine/widgets/views/cards/user/userCard.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../widgets/views/cards/products/products.dart';
import '../../../widgets/views/cards/menu/menuCard.dart';
import '../../../widgets/views/cards/watchlists.dart/watchlists.dart';

class HomeVC extends StatefulWidget {
  const HomeVC({super.key});

  @override
  State<HomeVC> createState() => _HomeVCState();
}

class _HomeVCState extends State<HomeVC> {
  // var pulldata = PullData(data: const [BalancesCards(), BalancesCards(), BalancesCards()], more: "", title: "My Balances", position: Axis.vertical);
  // var pulldata2 = PullData(data: [
  //   MenuCards().tabMenu(["Crypto", "Stocks"], (p) {}),
  //   WatchlistsCards().cards01(),
  //   WatchlistsCards().cards01(),
  //   WatchlistsCards().cards01(),
  //   WatchlistsCards().cards01()
  // ], more: "", title: "My Watchlists", position: Axis.vertical);
  // var pulldata3 = PullData(data: [const PublicityCards().card01()], more: "", title: "", position: Axis.vertical);
  // var pulldata4 = PullData(data: [
  //   MenuCards().tabMenu(["Crypto", "Stocks"], (p) {}),
  //   const AnalyticsCards().card01()
  // ], more: "", title: "Analytics", position: Axis.vertical);
  // var pulldata5 = PullData(data: [const PublicityCards().card02()], more: "View All", title: "Learn", position: Axis.vertical);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          // SliverToBoxAdapter(
          //   child: Column(
          //     children: [
          //       ListStrutural(
          //         data: pulldata,
          //         colorTitle: AppColors.black,
          //         height: null,
          //       ),
          //       ListStrutural(
          //         data: pulldata2,
          //         colorTitle: AppColors.black,
          //         height: null,
          //       ),
          //       ListStrutural(
          //         data: pulldata3,
          //         colorTitle: AppColors.black,
          //         height: null,
          //       ),
          //       ListStrutural(
          //         data: pulldata4,
          //         colorTitle: AppColors.black,
          //         height: null,
          //       ),
          //       ListStrutural(
          //         data: pulldata5,
          //         colorTitle: AppColors.black,
          //         height: null,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
