import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../helpers/cliper.dart';
import '../../../helpers/globals.dart' as globals;
import '../../../constants/app_colors.dart';
import '../../../model/objects/pull_data.dart';
import '../../../widgets/structural/list_Structural.dart';
import '../../../widgets/views/cards/analytics/analytics.dart';
import '../../../widgets/views/cards/products/products.dart';
import '../../../widgets/views/cards/menu/menuCard.dart';
import '../../../widgets/views/cards/publicity/publicity.dart';
import '../../../widgets/views/cards/user/userCard.dart';
import '../../../widgets/views/cards/watchlists.dart/watchlists.dart';

class InvestVC extends StatefulWidget {
  const InvestVC({super.key});

  @override
  State<InvestVC> createState() => _InvestVCState();
}

class _InvestVCState extends State<InvestVC> {
  @override
  Widget build(BuildContext context) {
    // var pulldata = PullData(
    //     data: [WatchlistsCards().cards04(context), WatchlistsCards().cards04(context), WatchlistsCards().cards04(context)],
    //     more: "",
    //     title: "Recently viewed",
    //     position: Axis.horizontal);
    // var pulldata2 = PullData(data: [
    //   MenuCards().tabMenu(["Crypto", "Stocks"], (p) {}),
    //   WatchlistsCards().cards01(),
    //   WatchlistsCards().cards01(),
    //   WatchlistsCards().cards01(),
    //   WatchlistsCards().cards01()
    // ], more: "View All", title: "All crypto 83", position: Axis.vertical);
    // var pulldata3 = PullData(
    //     data: [AnalyticsCards().card02(), AnalyticsCards().card02(), AnalyticsCards().card02()],
    //     more: "View All",
    //     title: "Popular crypto",
    //     position: Axis.horizontal);
    // var pulldata5 = PullData(data: [WatchlistsCards().cards06()], more: "View All", title: "Most traded this week", position: Axis.vertical);

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
              // title: Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.only(bottom: 20),
              //     // child: UserCards(
              //     //   user: globals.userPersonal.userPersonal.value.toJsonInfo(),
              //     // ).userWelcome(context),
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
          // SliverToBoxAdapter(
          //   child: Column(
          //     children: [
          //       ListStrutural(
          //         data: pulldata,
          //         colorTitle: AppColors.black,
          //         height: 165.0,
          //       ),
          //       ListStrutural(
          //           data: PullData(data: [
          //             Wrap(
          //               // direction: Axis.vertical,
          //               alignment: WrapAlignment.spaceAround,
          //               spacing: 16.0,
          //               runAlignment: WrapAlignment.spaceAround,
          //               runSpacing: 32.0,
          //               crossAxisAlignment: WrapCrossAlignment.center,
          //               // textDirection: TextDirection.rtl,
          //               //  verticalDirection: VerticalDirection.up,
          //               children: <Widget>[
          //                 WatchlistsCards().cards05(),
          //                 WatchlistsCards().cards05(),
          //                 WatchlistsCards().cards05(),
          //                 WatchlistsCards().cards05(),
          //                 WatchlistsCards().cards05(),
          //                 WatchlistsCards().cards05(),
          //                 WatchlistsCards().cards05(),
          //                 WatchlistsCards().cards05()
          //               ],
          //             ),
          //           ], more: "View All", title: "Today's top movers", position: Axis.vertical),
          //           colorTitle: AppColors.black,
          //           height: null),
          //       const SizedBox(
          //         height: 32,
          //       ),
          //       ListStrutural(
          //         data: pulldata5,
          //         colorTitle: AppColors.black,
          //         height: null,
          //       ),
          //       ListStrutural(
          //         data: pulldata3,
          //         colorTitle: AppColors.black,
          //         height: 210.0,
          //       ),
          //       ListStrutural(
          //         data: pulldata2,
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
