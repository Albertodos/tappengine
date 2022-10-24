import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tappengine/widgets/views/cards/menu/menuCard.dart';
import 'package:tappengine/widgets/views/cards/orders/orders.dart';
import '../../../helpers/cliper.dart';
import '../../../helpers/globals.dart' as globals;
import '../../../constants/app_colors.dart';
import '../../../model/objects/pull_data.dart';
import '../../../widgets/structural/list_Structural.dart';
import '../../../widgets/views/cards/analytics/analytics.dart';
import '../../../widgets/views/cards/products/products.dart';
import '../../../widgets/views/cards/publicity/publicity.dart';
import '../../../widgets/views/cards/user/userCard.dart';
import '../../../widgets/views/cards/watchlists.dart/watchlists.dart';

class CryptoVC extends StatefulWidget {
  const CryptoVC({super.key});

  @override
  State<CryptoVC> createState() => _CryptoVCState();
}

class _CryptoVCState extends State<CryptoVC> {
  @override
  Widget build(BuildContext context) {
    // var pulldata = PullData(data: [const BalancesCards().card01(context)], more: "", title: "", position: Axis.vertical);
    // var pulldata2 = PullData(
    //     data: [WatchlistsCards().cards01(), WatchlistsCards().cards01(), WatchlistsCards().cards01(), WatchlistsCards().cards01()],
    //     more: "",
    //     title: "My investments",
    //     position: Axis.vertical);
    // var pulldata3 = PullData(
    //     data: [AnalyticsCards().card02(), AnalyticsCards().card02(), AnalyticsCards().card02()],
    //     more: "",
    //     title: "Analytics",
    //     position: Axis.horizontal);
    // var pulldata4 = PullData(data: [const PublicityCards().card03()], more: "", title: "Insights", position: Axis.vertical);
    // var pulldata5 = PullData(
    //     data: [OrdersCards().cards02(), OrdersCards().cards02(), OrdersCards().cards02()],
    //     more: "View All",
    //     title: "Orders",
    //     position: Axis.horizontal);

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
          //         height: 310.0,
          //       ),
          //       ListStrutural(
          //         data: pulldata4,
          //         colorTitle: AppColors.black,
          //         height: null,
          //       ),
          //       ListStrutural(
          //         data: pulldata5,
          //         colorTitle: AppColors.black,
          //         height: 130.0,
          //       ),
          //       ListStrutural(
          //         data: PullData(more: "View All", title: "Today's top movers", position: Axis.vertical ,data: [
          //           Wrap(
          //           // direction: Axis.vertical,
          //           // alignment: WrapAlignment.center,
          //           spacing: 16.0,
          //           // runAlignment:WrapAlignment.center,
          //           runSpacing: 16.0,
          //           // crossAxisAlignment: WrapCrossAlignment.center,
          //           // textDirection: TextDirection.rtl,
          //           //  verticalDirection: VerticalDirection.up,
          //           children: <Widget>[
          //             WatchlistsCards().cards03(),
          //             WatchlistsCards().cards03(),
          //             WatchlistsCards().cards03(),
          //             WatchlistsCards().cards03()
          //           ],
          //         )],),
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
