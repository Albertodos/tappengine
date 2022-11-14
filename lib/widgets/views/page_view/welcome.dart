import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../ui_kits/labels_ui/label_ui.dart';

class WelcomePages extends StatefulWidget {
  final int pagePosition;
  const WelcomePages({super.key, required this.pagePosition});

  @override
  State<WelcomePages> createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
  bool selected = false;
  double opacityLevel = 0.0;
  var infoPage = [
    ['assets/images/ic_own_crypto.svg', 'Simplified investing', 'Sign up in minutes and choose from a range of Stocks, ETFs, Cryptos or specially curated model portfolios.'],
    // [
    //   'assets/images/buy_crypto.svg',
    //   'Earn rewards when you own buy crypto',
    //   'Affinity Plus members are automatically enrolled in our rewards program. Earn rewards on your stocks and cryptocurrencies. Our platform automatically reinvests the rewards on members’ behalf.'
    // ]
  ];

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
    return Container(
      height: Get.height,
      width: Get.width,
      color: AppColors.white,
      child: SingleChildScrollView(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 1),
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height / 2,
                color: AppColors.gray0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Container(
                    width: Get.width - 60,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      infoPage[widget.pagePosition][0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: AppColors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UILabels(
                          text: infoPage[widget.pagePosition][1],
                          textLines: 0,
                          color: AppColors.purpura,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        UILabels(
                          text: infoPage[widget.pagePosition][2],
                          color: AppColors.black,
                          textLines: 0,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
