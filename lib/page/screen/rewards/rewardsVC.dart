import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/helpers/cliper.dart';
import 'package:tappengine/widgets/views/cards/user/userCard.dart';
import '../../../../helpers/globals.dart' as globals;

class RewardsVC extends StatefulWidget {
  const RewardsVC({super.key});

  @override
  State<RewardsVC> createState() => _RewardsVCState();
}

class _RewardsVCState extends State<RewardsVC> {
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: Obx(
                () => Column(
                  children: [
                    UserCards(user: globals.userPersonal.userPersonal.value.toJsonInfo()).userRewards(context),
                    const SizedBox(
                      height: 32,
                    ),
                    Column(
                      children: globals.userPersonal.userRewards.value
                          .toJsonUserRewards()
                          .values
                          .map((e) => UserCards(user: e).rewardsSettingsItem(context))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
