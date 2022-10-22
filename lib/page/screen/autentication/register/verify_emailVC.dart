import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/model/objects/user/user.dart';
import 'package:tappengine/page/screen/autentication/register/verify_numberVC.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../../../widgets/animation/animation.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/views/form/form.dart';

class VerifyEmailVC extends StatefulWidget {
  const VerifyEmailVC({Key? key}) : super(key: key);

  @override
  State<VerifyEmailVC> createState() => _VerifyEmailVCState();
}

class _VerifyEmailVCState extends State<VerifyEmailVC> {
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        selected = true;
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
                'assets/icons/ic_email_verify.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const UILabels(
              text: "Verify your email",
              textLines: 1,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
            const SizedBox(
              height: 32,
            ),
            AnimationUI(
              widget: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 60),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                  child: userInfo()),
            ).scale(),
            const Expanded(
              child: SizedBox(),
            ),
            resend()
          ],
        ),
      ),
    );
  }

  Widget resend() {
    return Text.rich(
      TextSpan(
          text: "Email didn't arrive? ",
          style: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: "Resend",
                style: const TextStyle(fontSize: 16, color: AppColors.blue, fontWeight: FontWeight.w700),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.offAll(const VerifyNumberVC());
                    // code to open / launch privacy policy link here
                  }),
          ]),
      textAlign: TextAlign.center,
    );
  }

  Widget userInfo() {
    return Text.rich(
      TextSpan(
          text: "We sent a verification email to",
          style: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: " kayfadeyi@tappengine.com.",
                style: const TextStyle(fontSize: 16, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch privacy policy link here
                  }),
            const TextSpan(
              text: " the link inside to get started! ",
              style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
