import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_colors.dart';
import '../../../helpers/cliper.dart';
import '../../../model/objects/user/user.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../widgets/ui_kits/listTile/listTileCustomCard.dart';
import '../../../widgets/views/form/form.dart';

class NotificationsVC extends StatefulWidget {
  const NotificationsVC({Key? key}) : super(key: key);

  @override
  _NotificationsVCState createState() => _NotificationsVCState();
}

class _NotificationsVCState extends State<NotificationsVC> {

  var userLogin = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
              child:  Container(height:Get.height*0.75,
                child: Stack(
                  children: [
                    Positioned(child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTitleCustomNotification(
                                subtitle: "Receive Important Alert Like Password Reset",
                                title: "Security alerts"),
                            ListTitleCustomNotification(
                                title: "Push notification",
                                iconTrailing: Switch(
                                    activeColor: AppColors.purpura,
                                    inactiveTrackColor: AppColors.gray,
                                    value: true,
                                    onChanged: (value) {
                                    })),
                            ListTitleCustomNotification(
                                title: "In app notification",
                                iconTrailing: Switch(
                                    activeColor: AppColors.purpura,
                                    inactiveTrackColor: AppColors.gray,
                                    value: true,
                                    onChanged: (value) {
                                    })),
                            Divider(endIndent: 28,
                                indent: 15),
                            ListTitleCustomNotification(
                                subtitle: "receive updates about buy, sell and transfer",
                                title: "Account activity"),
                            ListTitleCustomNotification(
                                title: "Push notification",
                                iconTrailing: Switch(
                                    activeColor: AppColors.purpura,
                                    inactiveTrackColor: AppColors.gray,
                                    value: false,
                                    onChanged: (value) {
                                    })),
                            ListTitleCustomNotification(
                                title: "In app notification",
                                iconTrailing: Switch(
                                    activeColor: AppColors.purpura,
                                    inactiveTrackColor: AppColors.gray,
                                    value: false,
                                    onChanged: (value) {
                                    })),
                            Divider(endIndent: 28,
                                indent: 15),
                            ListTitleCustomNotification(
                                subtitle: "receive price change alerts for your watchlist",
                                title: "Price alerts"),
                            ListTitleCustomNotification(
                                title: "Push notification",
                                iconTrailing: Switch(
                                    activeColor: AppColors.purpura,
                                    inactiveTrackColor: AppColors.gray,
                                    value: false,
                                    onChanged: (value) {
                                    })),
                            ListTitleCustomNotification(
                                title: "In app notification",
                                iconTrailing: Switch(
                                    activeColor: AppColors.purpura,
                                    inactiveTrackColor: AppColors.gray,
                                    value: false,
                                    onChanged: (value) {
                                    })),
                          ],
                        )),),
                    Positioned(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                          height: 50,
                          width: Get.width,
                          child: Expanded(
                            child: SizedBox(
                                height: 50,
                                child: UIBottons(
                                    labels: const UILabels(
                                      text: 'Disable All Notifications',
                                      textLines: 0,
                                      color: AppColors.purpura,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    colorList: const [],
                                    cb: (v) {
                                    }).out(Colors.transparent)),
                          ),
                        ),
                      ),
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
