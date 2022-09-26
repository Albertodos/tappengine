import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tappengine/model/objects/user/user.dart';

import '../../../constants/app_colors.dart';
import '../../../helpers/cliper.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../widgets/views/form/form.dart';

class EditPhoneNumberVC extends StatefulWidget {
  const EditPhoneNumberVC({Key? key}) : super(key: key);

  @override
  _EditPhoneNumberVCState createState() => _EditPhoneNumberVCState();
}

class _EditPhoneNumberVCState extends State<EditPhoneNumberVC> {

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
                            const CircleAvatar(
                              backgroundColor: AppColors.purpura3,
                              radius: 40,
                              child: Icon(Icons.phone, color: AppColors.purpura, size: 35),
                            ),
                            Column(
                              children: userLogin
                                  .toJsonEditPhoneNumber()
                                  .values
                                  .map((e) => FromView(
                                user: e,
                              ))
                                  .toList(),
                            ),
                          ],
                        )),),
                    Positioned(
                      //bottom: 0,
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                    height: 50,
                                    child: UIBottons(
                                        labels: const UILabels(
                                          text: 'Cancel',
                                          textLines: 0,
                                          color: AppColors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        colorList: const [],
                                        cb: (v) {
                                        }).out(Colors.transparent)),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: SizedBox(
                                    height: 50,
                                    child: UIBottons(
                                        labels: const UILabels(
                                          text: 'Save',
                                          textLines: 0,
                                          color: AppColors.purpura,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        colorList: const [],
                                        cb: (v) {
                                        }).out(Colors.transparent)),
                              ),
                            ],
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
