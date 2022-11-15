import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/page/screen/autentication/welcomeVC.dart';

import '../autentication/controller/autentication.dart';

class SplashVC extends StatefulWidget {
  const SplashVC({Key? key}) : super(key: key);

  @override
  State<SplashVC> createState() => _SplashVCState();
}

class _SplashVCState extends State<SplashVC> {
  final Autentication autenticationC = Get.put(Autentication());
  Future<void> onDoneLoading() async {
    // await localStorage.get("token").then((value) => value == null ? Get.offAll(const LoginVC()) : getUser());
    Get.offAll(const WelcomeVC());
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 2), onDoneLoading);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autenticationC.getCryptoImage(context);
    autenticationC.getBalanceImage(context);
    autenticationC.getMobileScreens(context).then((value) {
      loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.gray0],
        ),
      ),
      child: Center(
        child: SizedBox(
          child: SvgPicture.asset(
            'assets/logo/complete_logo.svg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
