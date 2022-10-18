import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/model/objects/user/user.dart';
import 'package:tappengine/page/screen/autentication/login/loginVC.dart';
import 'package:tappengine/page/screen/autentication/register/verify_emailVC.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../../widgets/animation/animation.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/views/form/form.dart';
import '../../../../widgets/views/reusebles/reusables.dart';

class RegisterVC extends StatefulWidget {
  const RegisterVC({Key? key}) : super(key: key);

  @override
  State<RegisterVC> createState() => _RegisterVCState();
}

class _RegisterVCState extends State<RegisterVC> {
  bool selected = true;
  double opacityLevel = 0.0;
  var userLogin = User();
  bool isChecked = false;

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const ReusablesView().isBack(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 44,
                    ),
                    const UILabels(
                      text: "Create your account",
                      textLines: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimationUI(
                      widget: Container(
                        width: Get.width,
                        padding: const EdgeInsets.only(left: 30, top: 40, right: 30, bottom: 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                        child: Column(
                          children: [
                            Column(
                              children: globals.userPersonal.userFroms.value
                                  .froms(["name", "email", "password", "coutryResidence"])
                                  .values
                                  .map((e) => FromView(
                                        user: e,
                                        onSubmitted: (k) {},
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20, width: 20, child: checkbox()),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(child: policy()),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: UIBottons(
                                    labels: Row(
                                      children: [
                                        const Expanded(
                                          child: UILabels(
                                            text: 'Create account',
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
                                      Future.delayed(const Duration(milliseconds: 800), () {
                                        Get.offAll(const VerifyEmailVC());
                                      });
                                    })),
                          ],
                        ),
                      ),
                    ).scale(),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
            gotoLogin(),
          ],
        ),
      ),
    );
  }

  Widget gotoLogin() {
    return Text.rich(
      TextSpan(
          text: "Already have a tappengine account? ",
          style: const TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: "Login",
                style: const TextStyle(fontSize: 12, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.offAll(const LoginVC(),
                        duration: const Duration(seconds: 1), //duration of transitions, default 1 sec
                        transition: Transition.cupertino);
                    // code to open / launch privacy policy link here
                  }),
          ]),
      textAlign: TextAlign.center,
    );
  }

  Widget policy() {
    return Text.rich(
      TextSpan(
          text: "I certify that I am 18 years of age or older, and agree to the",
          style: const TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: " User Agreement",
                style: const TextStyle(fontSize: 12, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch privacy policy link here
                  }),
            const TextSpan(
              text: " and ",
              style: TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
            TextSpan(
                text: "Privacy Policy",
                style: const TextStyle(fontSize: 12, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch privacy policy link here
                  }),
          ]),
      textAlign: TextAlign.left,
    );
  }

  Widget checkbox() {
    return Checkbox(
      checkColor: AppColors.purpura,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
