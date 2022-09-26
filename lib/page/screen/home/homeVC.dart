import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/helpers/cliper.dart';
import 'package:tappengine/model/objects/pull_data.dart';
import 'package:tappengine/widgets/structural/list_Structural.dart';
import 'package:tappengine/widgets/views/cards/user/userCard.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../widgets/views/cards/balances/balances.dart';
import '../../../widgets/views/cards/menu/menuCard.dart';
import '../../../widgets/views/cards/watchlists.dart/watchlists.dart';

class HomeVC extends StatefulWidget {
  const HomeVC({super.key});

  @override
  State<HomeVC> createState() => _HomeVCState();
}

class _HomeVCState extends State<HomeVC> {
  var pulldata = PullData(data: const [BalancesCards(), BalancesCards(), BalancesCards()], more: "", title: "MY BAlances", position: Axis.vertical);
  var pulldata2 = PullData(
      data: [const WatchlistsCards().tabMenu(), const BalancesCards(), const BalancesCards()],
      more: "",
      title: "MY Watchlists",
      position: Axis.vertical);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      globals.userPersonal.chamgeUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray0,
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
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
              child: Column(
                children: [
                  ListStrutural(data: pulldata, colorTitle: AppColors.black),
                  ListStrutural(data: pulldata2, colorTitle: AppColors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
