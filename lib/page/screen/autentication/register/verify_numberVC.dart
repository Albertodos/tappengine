import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/model/objects/user/user.dart';
import 'package:tappengine/page/screen/autentication/register/verify_emailVC.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../../../widgets/animation/animation.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/views/form/form.dart';
import 'select_citizenshipeVC.dart';

class VerifyNumberVC extends StatefulWidget {
  const VerifyNumberVC({Key? key}) : super(key: key);

  @override
  State<VerifyNumberVC> createState() => _VerifyNumberVCState();
}

class _VerifyNumberVCState extends State<VerifyNumberVC> {
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
                'assets/icons/ic_country_verify.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const UILabels(
              text: "Set up two-step verification",
              textLines: 0,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            const SizedBox(
              height: 32,
            ),
            AnimationUI(
              widget: Container(
                width: Get.width,
                padding: const EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 60),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: userLogin
                          .toJsonVerifyNumber()
                          .values
                          .map((e) => FromView(
                                user: e,
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const UILabels(
                      text:
                          "Security is critical at Tappengine. To help keep your account safe, we'll text you a varification code when you sign in on a new device.",
                      textLines: 0,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    codeResend(),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        height: 50,
                        width: Get.width,
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
                              Future.delayed(const Duration(milliseconds: 8500), () {
                                Get.offAll(const SelectCitizeShipeVC());
                              });
                            })),
                  ],
                ),
              ),
            ).scale(),
          ],
        ),
      ),
    );
  }

  Widget codeResend() {
    return Text.rich(
      TextSpan(
          text: "Code didn't arrive?",
          style: const TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: "Resend",
                style: const TextStyle(fontSize: 12, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("Register Page");
                    // code to open / launch privacy policy link here
                  }),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
