import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

class VerifyIdentityInfoVC extends StatefulWidget {
  const VerifyIdentityInfoVC({Key? key}) : super(key: key);

  @override
  State<VerifyIdentityInfoVC> createState() => _VerifyIdentityInfoVCState();
}

class _VerifyIdentityInfoVCState extends State<VerifyIdentityInfoVC> {
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
                height: 90,
                width: 90,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(45), color: AppColors.blue),
              ),
              const SizedBox(
                height: 20,
              ),
              const UILabels(
                text: "Verify your info",
                textLines: 1,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const UILabels(
                text: "Tappengine legally required to collect this information.",
                textLines: 0,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.bounceOut,
                tween: Tween(begin: 1.0, end: 0.0),
                builder: (context, value, child) {
                  // horizontal disposition of the widget.
                  return Transform.translate(
                    offset: Offset(value * 50, 0.0),
                    child: child,
                  );
                },
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 30, top: 40, right: 30, bottom: 30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: userLogin
                        .toJsonVerifyIdentity3()
                        .values
                        .map((e) => FromView(
                              user: e,
                            ))
                        .toList(),
                  ),
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
                                Future.delayed(const Duration(milliseconds: 8500), () {
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
