import 'package:flutter/material.dart';
import '../../../../helpers/globals.dart' as globals;
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../helpers/cliper.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../widgets/views/cards/menu/menuCard.dart';
import '../../../widgets/views/cards/user/userCard.dart';

class FirstTimeDashboard extends StatefulWidget {
  const FirstTimeDashboard({super.key});

  @override
  State<FirstTimeDashboard> createState() => _FirstTimeDashboardState();
}

class _FirstTimeDashboardState extends State<FirstTimeDashboard> {

  var list = ['Ask an advisor', 'Invest in Stocks and ETFs', 'Buy/Sell/Hold over 100 Tokens', 'Auto Investing in Portfolio Models'];
  var selectMoreAdd = "Add money".obs;
  final positionMethod = 0.obs;

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
                  const SizedBox(
                    height: 64,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          selectMoreAdd.value = list[index];
                        },
                        child: Column(
                          children: [
                            Obx(() => MenuCards().card01("",list[index],
                                list[index] == selectMoreAdd.value
                                    ? AppColors.purpura
                                    : AppColors.white),),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  //MenuCards().card01('assets/icons/ic_coin.svg', "Ask an advisor"),
                  const SizedBox(
                    height: 20,
                  ),
              //MenuCards().card01('assets/icons/ic_coin.svg', "Invest in Stocks and ETFs"),
                  const SizedBox(
                    height: 20,
                  ),
                  //MenuCards().card01('assets/icons/ic_coin.svg', "Buy/Sell/Hold over 100 Tokens"),
                  const SizedBox(
                    height: 20,
                  ),
                  //MenuCards().card01('assets/icons/ic_coin.svg', "Auto Investing in Portfolio Models"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
