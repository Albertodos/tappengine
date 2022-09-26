import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/model/objects/user/user.dart';
import 'package:tappengine/page/screen/autentication/register/registerVC.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../../../widgets/animation/animation.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/views/form/form.dart';

class LoginVC extends StatefulWidget {
  const LoginVC({Key? key}) : super(key: key);

  @override
  State<LoginVC> createState() => _LoginVCState();
}

class _LoginVCState extends State<LoginVC> {
  bool selected = true;
  double opacityLevel = 0.0;
  bool _passwordVisible = false;
  var userLogin = User();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        // selected = true;
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
            SizedBox(
              height: 120,
              child: SvgPicture.asset(
                'assets/logo/complete_logo.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            const SizedBox(
              height: 20,
            ),
            AnimationUI(
              widget: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(left: 30, top: 40, right: 30, bottom: 40),
                    margin: const EdgeInsets.only(top: 32),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                    child: Column(
                      children: [
                        Column(
                          children: userLogin
                              .toJsonLogin()
                              .values
                              .map((e) => FromView(
                                    user: e,
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 50,
                            child: UIBottons(
                                labels: Row(
                                  children: [
                                    const Expanded(
                                      child: UILabels(
                                        text: 'Sign In',
                                        textLines: 0,
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
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
                                colorList: const [],
                                cb: (v) {
                                  setState(() {
                                    selected = !selected;
                                  });
                                })),
                      ],
                    ),
                  ),
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.purpura.withAlpha(25)),
                    child: SvgPicture.asset(
                      'assets/icons/user_login.svg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ).scale(),
            const SizedBox(
              height: 20,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            gotoRegister(),
          ],
        ),
      ),
    );
  }

  Widget gotoRegister() {
    return Text.rich(
      TextSpan(
          text: "Haven't a tappengine account? ",
          style: const TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: "Create an Account",
                style: const TextStyle(fontSize: 12, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(const RegisterVC(),
                        duration: const Duration(seconds: 1), //duration of transitions, default 1 sec
                        transition: Transition.cupertino);
                    // code to open / launch privacy policy link here
                  }),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
