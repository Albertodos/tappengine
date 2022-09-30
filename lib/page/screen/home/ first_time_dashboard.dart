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
                  const UILabels(
                    text: "How would you like to proceed?",
                    textLines: 1,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.purpura,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const UILabels(
                    text: "Please let us know if you would like assistance form our robo advisor, or you prefer to craft your own investments.",
                    textLines: 0,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MenuCards(),
                  const SizedBox(
                    height: 20,
                  ),
                  MenuCards(),
                  const SizedBox(
                    height: 20,
                  ),
                  MenuCards(),
                  const SizedBox(
                    height: 20,
                  ),
                  MenuCards()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
