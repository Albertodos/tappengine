import 'package:flutter/material.dart';
import 'package:tappengine/widgets/views/cards/orders/model/orders.dart';
import '../../../../helpers/globals.dart' as globals;
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/helpers/utils.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';
import 'package:tappengine/widgets/views/cards/crypto/controller/controller.dart';
import '../../../../page/sheet/payment_method/payment_method.dart';
import '../../../ui_kits/button_ui/button_ui.dart';
import '../analytics/analytics.dart';
import 'model/crypto.dart';

class CryptoCards extends StatelessWidget {
  final Crypto? crypto;
  CryptoCards({super.key, this.crypto});
  final CryptoC cryptoC = Get.put(CryptoC());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: InkWell(
        onTap: () {
          // EventsSheet().infoEvents();
          cryptoC.selectCrypto.value = crypto!;
          Navigator.pushNamed(context, "/${globals.rootName}/buyOverview");
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
                child: Image.network((crypto!.img.toString()), height: 19, width: 19),
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
                            text: crypto!.name ?? "",
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
                              text: crypto!.percent ?? "",
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
                            text: "${crypto!.name} • ${crypto!.valueChange}",
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
                          text: crypto!.value ?? "",
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

  Widget cryptoHeader(context) {
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
                        print("/${globals.rootName}/invest");
                        print("/${globals.rootName}/invest");

                        Navigator.pushNamed(
                          context,
                          "/${globals.rootName}/invest",
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

  Widget cryptoPreviewHeader(context) {
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
                    text: crypto!.name ?? "",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      UILabels(
                        text: crypto!.fromsymbol ?? "",
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
              child: Image.network((crypto!.img.toString()), height: 19, width: 19),
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
                          "/${globals.rootName}/enterAmount",
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

  Widget cryptoGrid_2(context) {
    return InkWell(
      onTap: () {
        // EventsSheet().infoEvents();
        cryptoC.selectCrypto.value = crypto!;
        Navigator.pushNamed(context, "/${globals.rootName}/buyOverview");
      },
      child: Container(
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
                child: Image.network((crypto!.img.toString()), height: 19, width: 19),
              ),
              const SizedBox(
                height: 16,
              ),
              UILabels(
                text: crypto!.name.toString(),
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              UILabels(
                text: crypto!.fromsymbol.toString(),
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
                  children: [
                    const Icon(Icons.keyboard_arrow_down, color: AppColors.red),
                    UILabels(
                      text: crypto!.percent.toString(),
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
      ),
    );
  }

  Widget cryptoGrid(context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/${globals.rootName}/buyOverview",
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
                  Expanded(
                    child: UILabels(
                      text: crypto!.name ?? "",
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
                    child: Image.network((crypto!.img.toString()), height: 19, width: 19),
                  ),
                ],
              ),
              UILabels(
                text: crypto!.fromsymbol ?? '',
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
                  Expanded(
                    child: UILabels(
                      text: crypto!.value ?? "",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: AppColors.purpura5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.expand_more,
                          color: AppColors.purpura1,
                          size: 20,
                        ),
                        UILabels(
                          text: crypto!.percent ?? "",
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

  Widget cryptoListView2(context) {
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
                  Expanded(
                    child: UILabels(
                      text: crypto!.name ?? "",
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
              UILabels(
                text: crypto!.fromsymbol ?? "",
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
                  Expanded(
                    child: UILabels(
                      text: crypto!.value ?? "",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: AppColors.purpura5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.expand_more,
                          color: AppColors.purpura1,
                          size: 20,
                        ),
                        UILabels(
                          text: "${crypto!.percent}%",
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

  Widget cryptoListView3() {
    return Container(
      width: Get.width - 64,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                child: Image.network((crypto!.img.toString()), height: 19, width: 19),
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
                            text: crypto!.name ?? "",
                            textLines: 1,
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          //height: 30,
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2, top: 2),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: AppColors.purpura5,
                          ),
                          child: UILabels(
                            text: "${crypto!.percent}%  Buys",
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
                      children: [
                        Expanded(
                          child: UILabels(
                            text: crypto!.fromsymbol ?? "",
                            textLines: 1,
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        UILabels(
                          text: crypto!.value ?? "",
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

  Widget cryptoGrid_3() {
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
            child: Image.network((crypto!.img.toString()), height: 19, width: 19),
          ),
          const SizedBox(
            height: 16,
          ),
          UILabels(
            text: crypto!.fromsymbol ?? "",
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: AppColors.purpura5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.expand_more,
                  color: AppColors.purpura1,
                  size: 20,
                ),
                UILabels(
                  text: "${crypto!.percent}%",
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

  Widget cryptoDashboard01(context) {
    var isLoveValue = false.obs;

    return Container(
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
            Row(
              children: [
                Expanded(
                  child: UILabels(
                    text: crypto!.value ?? "",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    isLoveValue.value = !isLoveValue.value;
                  },
                  icon: Obx(() => Utlis().selectStar(isLoveValue)),
                )
              ],
            ),
            Row(
              children: [
                const Icon(Icons.keyboard_arrow_down, color: AppColors.green),
                UILabels(
                  text: crypto!.percent ?? "",
                  textLines: 1,
                  color: AppColors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                const UILabels(
                  text: " • Today",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 210,
              child: AnalyticsCards(
                crypto: crypto,
              ).graph(context, AppColors.green),
            ),
            const SizedBox(
              height: 16,
            ),
            const UILabels(
              text:
                  "Data displayed above is indicative only. actual exection price may vary. past performance is not a reliable indicator of future results.",
              textLines: 0,
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }

  Widget cryptoDashboard02(context) {
    return Container(
      height: 260,
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
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: UILabels(
                    text: crypto!.name ?? '',
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: const [
                    UILabels(
                      text: "last 12 months",
                      textLines: 1,
                      color: AppColors.purpura,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    Icon(Icons.keyboard_arrow_down, color: AppColors.purpura),
                  ],
                ),
              ],
            ),
            UILabels(
              text: crypto!.value ?? '',
              textLines: 1,
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: [
                const Icon(Icons.keyboard_arrow_down, color: AppColors.green),
                UILabels(
                  text: crypto!.valueChange ?? '',
                  textLines: 1,
                  color: AppColors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            AnalyticsCards(
              crypto: crypto,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget cryptoDashboard03(context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: Get.width - 100,
      height: 300,
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
            const UILabels(
              text: "Profit and Loss",
              textLines: 1,
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            UILabels(
              text: crypto!.value ?? "........",
              textLines: 1,
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            UILabels(
              text: crypto!.dayMonth ?? ".......",
              textLines: 1,
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: AnalyticsCards(
                crypto: crypto,
              ).graph2(context, AppColors.green),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  Widget cryptoDashboard04(context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 300,
      height: 200,
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
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: AppColors.white,
                    ),
                    child: Image.network((crypto!.img.toString()), height: 19, width: 19),
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
                                text: crypto!.name ?? "",
                                textLines: 1,
                                color: AppColors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              //height: 30,
                              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2, top: 2),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                color: AppColors.purpura5,
                              ),
                              child: UILabels(
                                text: "${crypto!.percent}%  Buys",
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
                          children: [
                            Expanded(
                              child: UILabels(
                                text: crypto!.fromsymbol ?? "",
                                textLines: 1,
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            UILabels(
                              text: crypto!.value ?? "",
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
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: AnalyticsCards(
                crypto: crypto,
              ).graph2(context, AppColors.purpura),
            ),
          ],
        ),
      ),
    );
  }
}
