import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/model/objects/user/user.dart';
import 'package:tappengine/page/screen/autentication/register/verify_emailVC.dart';
import 'package:tappengine/page/tab/homeTab.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../../../widgets/animation/animation.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/views/form/form.dart';
import 'verify_identity_nextVC.dart';

class VerifyIdentityVC extends StatefulWidget {
  const VerifyIdentityVC({Key? key}) : super(key: key);

  @override
  State<VerifyIdentityVC> createState() => _VerifyIdentityVCState();
}

class _VerifyIdentityVCState extends State<VerifyIdentityVC> {
  bool selected = false;
  double opacityLevel = 0.0;
  bool _passwordVisible = false;
  var userLogin = User();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        selected = true;
        opacityLevel = opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray0,
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.purpura.withAlpha(25)),
                child: SvgPicture.asset(
                  'assets/icons/icverify_identify.svg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const UILabels(
                text: "Verify your identity",
                textLines: 1,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const UILabels(
                text:
                    "Financial regulations require us to verify your identity. Once complete, you can buy, sell or transfer cryptocurrency. Learn more.",
                textLines: 0,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: const UILabels(
                        text: "Other Details",
                        textLines: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: userLogin
                              .toJsonVerifyIdentity()
                              .values
                              .map((e) => FromView(
                                    user: e,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: const UILabels(
                        text: "Business Information",
                        textLines: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: userLogin
                              .toJsonVerifyIdentityBusiness()
                              .values
                              .map((e) => FromView(
                                    user: e,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimationUI(
                      widget: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: UIBottons(
                              labels: const UILabels(
                                text: 'Submit',
                                textLines: 0,
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              colorList: const [],
                              cb: (v) {
                                setState(() {
                                  selected = !selected;
                                });
                                Future.delayed(const Duration(milliseconds: 800), () {
                                  Get.offAll(const HomeTab());
                                });
                              })),
                    ).position(context, selected, 10.0, 0.0),
                    if (!selected)
                      const Positioned(
                        right: 30,
                        top: 15,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
