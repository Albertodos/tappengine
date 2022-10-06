import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/model/objects/user/user.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../../../widgets/animation/animation.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/views/form/form.dart';
import 'verify_identityVC.dart';

class SelectCitizeShipeVC extends StatefulWidget {
  const SelectCitizeShipeVC({Key? key}) : super(key: key);

  @override
  State<SelectCitizeShipeVC> createState() => _SelectCitizeShipeVCState();
}

class _SelectCitizeShipeVCState extends State<SelectCitizeShipeVC> {
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
                'assets/icons/ic_citizenship.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const UILabels(
              text: "Select your citizenship",
              textLines: 1,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            const SizedBox(
              height: 16,
            ),
            const UILabels(
              text: "Tappengine is legally required to collect this information. If you're a citizen of more than one country, please pick one.",
              textLines: 0,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            AnimationUI(
              widget: Container(
                width: Get.width,
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 30),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                  FromView(
                    user: userLogin.toJsonVerifyNumber()['country'],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: UIBottons(
                          labels: const UILabels(
                            text: 'Continue',
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
                              Get.offAll(const VerifyIdentityVC());
                            });
                          })),
                ]),
              ),
            ).scale(),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
