import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';
import 'package:tappengine/widgets/views/cards/crypto/controller/controller.dart';
import '../../../../page/sheet/payment_method/payment_method.dart';
import '../../../ui_kits/button_ui/button_ui.dart';
import 'model/crypto.dart';

class CryptoCards extends StatelessWidget {
  final Crypto crypto;
  CryptoCards({super.key, required this.crypto});
  final CryptoC cryptoC = Get.put(CryptoC());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: InkWell(
        onTap: () {
          // EventsSheet().infoEvents();
          cryptoC.selectCrypto.value = crypto;
          Navigator.pushNamed(context, "/buyOverview");
        },
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
                child: Image.network((crypto.img.toString()), height: 19, width: 19),
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
                        Expanded(
                          child: UILabels(
                            text: crypto.name ?? "",
                            textLines: 1,
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.keyboard_arrow_down, color: AppColors.purpura1),
                            UILabels(
                              text: crypto.percent ?? "",
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
                      children: [
                        Expanded(
                          child: UILabels(
                            text: "${crypto.name} • ${crypto.valueChange}",
                            textLines: 1,
                            color: AppColors.purpura2,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        UILabels(
                          text: crypto.value ?? "",
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
      ),
    );
  }

  Widget card01(context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UILabels(
                    text: "Crypto balances",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    children: const [
                      UILabels(
                        text: "\$3,00000.32",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.green),
                      UILabels(
                        text: "1.82%",
                        textLines: 1,
                        color: AppColors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: AppColors.purpura.withAlpha(25),
              ),
            ),
          ]),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              SizedBox(
                  height: 50,
                  child: UIBottons(
                      labels: const UILabels(
                        text: 'Invest',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      colorList: const [],
                      cb: (v) {
                        Navigator.pushNamed(
                          context,
                          "/invest",
                        );
                      })),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: SizedBox(
                    height: 50,
                    child: UIBottons(
                            labels: const UILabels(
                              text: 'Recurring buy',
                              textLines: 0,
                              color: AppColors.purpura,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            borderColor: AppColors.gray3,
                            colorList: const [],
                            cb: (v) {})
                        .out(Colors.transparent)),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                  height: 50,
                  child: UIBottons(
                      labels: const Icon(
                        Icons.more_horiz_outlined,
                        color: AppColors.purpura,
                      ),
                      borderColor: AppColors.gray3,
                      colorList: const [],
                      cb: (v) {
                        // Get.to(AddMoneyVC());
                        PaymentMethodSheet().morePaymentMethod(context, (p0) => null);
                      }).out(Colors.transparent)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget card02(context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UILabels(
                    text: crypto.name ?? "",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      UILabels(
                        text: crypto.fromsymbol ?? "",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      const UILabels(
                        text: " • Active",
                        textLines: 1,
                        color: AppColors.green1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: AppColors.purpura.withAlpha(25),
              ),
              child: Image.network((crypto.img.toString()), height: 19, width: 19),
            ),
          ]),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              SizedBox(
                  height: 50,
                  child: UIBottons(
                      labels: const UILabels(
                        text: 'Buy',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      colorList: const [],
                      cb: (v) {
                        Navigator.pushNamed(
                          context,
                          "/enterAmount",
                        );
                      })),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                  height: 50,
                  child: UIBottons(
                          labels: const UILabels(
                            text: 'Sell',
                            textLines: 0,
                            color: AppColors.purpura,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          borderColor: AppColors.gray3,
                          colorList: const [],
                          cb: (v) {})
                      .out(Colors.transparent)),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: SizedBox(
                    height: 50,
                    child: UIBottons(
                            labels: const UILabels(
                              text: 'Recurring buy',
                              textLines: 0,
                              color: AppColors.purpura,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            borderColor: AppColors.gray3,
                            colorList: const [],
                            cb: (v) {})
                        .out(Colors.transparent)),
              ),
            ],
          ),
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
                      color: AppColors.black,
                      fontSize: 16,
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
                      text: "\$1,547.76",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: AppColors.purpura5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.expand_more,
                          color: AppColors.purpura1,
                          size: 20,
                        ),
                        UILabels(
                          text: "1.04%",
                          textLines: 1,
                          color: AppColors.purpura1,
                          fontSize: 12,
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
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              color: AppColors.purpura.withAlpha(25),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const UILabels(
            text: "USDT",
            textLines: 1,
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: AppColors.purpura5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.expand_more,
                  color: AppColors.purpura1,
                  size: 20,
                ),
                UILabels(
                  text: "1.04%",
                  textLines: 1,
                  color: AppColors.purpura1,
                  fontSize: 12,
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
        color: AppColors.gray,
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
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          //height: 30,
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2, top: 2),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            color: AppColors.purpura5,
                          ),
                          child: const UILabels(
                            text: "1.04%  Buys",
                            textLines: 1,
                            color: AppColors.purpura1,
                            fontSize: 12,
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

  Widget cryptoDashboard01(context) {
    return InkWell(
      onTap: () {
        cryptoC.selectCrypto.value = crypto;
        Navigator.pushNamed(context, "/buyOverview");
      },
      child: Container(
        height: 300,
        margin: const EdgeInsets.all(10),
        width: Get.width - 100,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
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
              UILabels(
                text: crypto.name ?? "",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              UILabels(
                text: crypto.value ?? "",
                textLines: 1,
                color: AppColors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const UILabels(
                text: "Today",
                textLines: 1,
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 140,
                child: SvgPicture.asset(
                  "assets/images/graph01.svg",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
