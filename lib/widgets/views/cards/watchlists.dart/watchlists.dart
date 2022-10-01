import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/widgets/animation/animation.dart';
import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';

class WatchlistsCards extends StatelessWidget {
  WatchlistsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget cards01() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: AppColors.purpura.withAlpha(25),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children:  [
                      const Expanded(
                        child: UILabels(
                          text: "BNB",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.keyboard_arrow_down, color: AppColors.purpura1),
                          UILabels(
                            text: "0.82%",
                            textLines: 1,
                            color: AppColors.purpura1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: UILabels(
                          text: "BNB • 161,234,261",
                          textLines: 1,
                          color: AppColors.purpura2,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      UILabels(
                        text: "\$12,3444.09",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 2,
                    color: AppColors.purpura.withAlpha(25),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }

  Widget cards03() {
    return Container(
      width: (Get.width / 2) - 44,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: AppColors.purpura.withAlpha(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const UILabels(
              text: "Ethereum",
              textLines: 1,
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            const UILabels(
              text: "ETH",
              textLines: 1,
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: AppColors.red.withAlpha(15),
              ),
              child: Row(
                children: const [
                  Icon(Icons.keyboard_arrow_down, color: AppColors.red),
                  UILabels(
                    text: "  1.04%  ",
                    textLines: 1,
                    color: AppColors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cards04(context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/buyOverview",
        );
      },
      child: Container(
        width: 240,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.purpura.withAlpha(25),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: UILabels(
                      text: "Ethereum",
                      textLines: 1,
                      color: AppColors.purpura,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const UILabels(
                text: "ETH",
                textLines: 1,
                color: AppColors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Expanded(
                    child: UILabels(
                      text: "Ethereum",
                      textLines: 1,
                      color: AppColors.purpura,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: AppColors.red.withAlpha(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.expand_more,
                          color: AppColors.red,
                        ),
                        UILabels(
                          text: "  1.04%  ",
                          textLines: 1,
                          color: AppColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cards05() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              color: AppColors.purpura.withAlpha(25),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const UILabels(
            text: "USDC",
            textLines: 1,
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: AppColors.red.withAlpha(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.expand_more,
                  color: AppColors.red,
                ),
                UILabels(
                  text: "1.04%",
                  textLines: 1,
                  color: AppColors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cards06() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: AppColors.purpura.withAlpha(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: UILabels(
                            text: "Cardano",
                            textLines: 1,
                            color: AppColors.purpura,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            color: AppColors.red.withAlpha(15),
                          ),
                          child: const UILabels(
                            text: "  1.04%  Buys ",
                            textLines: 1,
                            color: AppColors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: UILabels(
                            text: "ADA",
                            textLines: 1,
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        UILabels(
                          text: "\$3456,344.45",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
