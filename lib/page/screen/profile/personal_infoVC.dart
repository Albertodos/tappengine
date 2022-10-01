import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/app_colors.dart';
import '../../../../helpers/cliper.dart';
import '../../../../widgets/views/cards/user/userCard.dart';
import 'controller/user_C.dart';
import '../../../../helpers/globals.dart' as globals;

class PersonalInfoVC extends StatefulWidget {
  const PersonalInfoVC({super.key});

  @override
  State<PersonalInfoVC> createState() => _PersonalInfoVCState();
}

class _PersonalInfoVCState extends State<PersonalInfoVC> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // userPersonal.chamgeUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      extendBodyBehindAppBar: true,
      primary: false,
      extendBody: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            collapsedHeight: 100,
            backgroundColor: AppColors.purpura.withAlpha(0),
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                // child: , //UserCards().userBack(),
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
                    UserCards(user: globals.userPersonal.userPersonal.value.toJsonInfo()).userInfo(context),
                    Column(
                      children: globals.userPersonal.userPersonal.value
                          .toJsonUserPersonal()
                          .values
                          .map((e) => UserCards(user: e).userSettingsItem(context))
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
