import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/helpers/cliper.dart';
import 'package:tappengine/widgets/views/cards/user/userCard.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../widgets/views/cards/menu/menuCard.dart';
import 'profile/controller/user_C.dart';

class HomeVC extends StatefulWidget {
  const HomeVC({super.key});

  @override
  State<HomeVC> createState() => _HomeVCState();
}

class _HomeVCState extends State<HomeVC> {
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
                children: const [
                  UILabels(
                    text: "How would you like to proceed?",
                    textLines: 1,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.purpura,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UILabels(
                    text: "Please let us know if you would like assistance form our robo advisor, or you prefer to craft your own investments.",
                    textLines: 0,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeMenu(),
                  SizedBox(
                    height: 20,
                  ),
                  HomeMenu(),
                  SizedBox(
                    height: 20,
                  ),
                  HomeMenu(),
                  SizedBox(
                    height: 20,
                  ),
                  HomeMenu()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
