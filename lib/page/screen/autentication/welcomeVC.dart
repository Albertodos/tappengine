import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/page/screen/autentication/login/loginVC.dart';
import 'package:tappengine/page/screen/autentication/register/registerVC.dart';
import 'package:tappengine/page/tab/homeTab.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';
import 'package:tappengine/widgets/views/page_view/welcome.dart';

import '../../../widgets/animation/animation.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import 'controller/autentication.dart';

class WelcomeVC extends StatefulWidget {
  const WelcomeVC({Key? key}) : super(key: key);

  @override
  State<WelcomeVC> createState() => _WelcomeVCState();
}

class _WelcomeVCState extends State<WelcomeVC> {
  bool selected = false;
  double opacityLevel = 0.0;
  RxInt pagePosition = 0.obs;
  final PageController pagecontroller = PageController();
  final Autentication autenticationC = Get.put(Autentication());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autenticationC.getCryptoImage(context);
    autenticationC.getBalanceImage(context);
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
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: pagecontroller,
              children: const [
                WelcomePages(
                  pagePosition: 0,
                ),
                WelcomePages(
                  pagePosition: 1,
                ),
              ],
              onPageChanged: (value) {
                pagePosition.value = value;
              },
            ),
            Container(
              color: AppColors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      pageIndicator(0),
                      const SizedBox(
                        width: 16,
                      ),
                      pageIndicator(1)
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.white,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimationUI(
                          widget: Hero(
                            tag: "login",
                            child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: UIBottons(
                                    labels: const UILabels(
                                      text: 'Create an Account',
                                      textLines: 0,
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    colorList: const [],
                                    cb: (v) {
                                      Get.to(const RegisterVC(),
                                          duration: const Duration(seconds: 1), //duration of transitions, default 1 sec
                                          transition: Transition.cupertino);
                                    })),
                          ),
                        ).position(context, selected, 0.0, 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                height: 50,
                                child: UIBottons(
                                    labels: const UILabels(
                                      text: 'Login',
                                      textLines: 0,
                                      color: AppColors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    colorList: const [],
                                    cb: (v) {
                                      Get.to(const LoginVC(),
                                          duration: const Duration(seconds: 1), //duration of transitions, default 1 sec
                                          transition: Transition.cupertino);
                                    }).outTranparent()),
                            SizedBox(
                                height: 50,
                                child: UIBottons(
                                    labels: const UILabels(
                                      text: 'Skip',
                                      textLines: 0,
                                      color: AppColors.purpura,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    colorList: const [],
                                    cb: (v) {
                                      Get.to(const HomeTab(),
                                          duration: const Duration(seconds: 1), //duration of transitions, default 1 sec
                                          transition: Transition.cupertino);
                                    }).outTranparent()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pageIndicator(position) {
    return InkWell(
      onTap: () {
        pagecontroller.jumpToPage(position);
      },
      child: Obx(
        () => Container(
          height: 5,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
            color: pagePosition.value == position ? AppColors.purpura : AppColors.purpura.withAlpha(20),
          ),
        ),
      ),
    );
  }
}
