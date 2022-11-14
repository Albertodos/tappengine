import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/helpers/utils.dart';
import 'package:tappengine/page/sheet/payment_method/payment_method.dart';
import '../../../../helpers/cliper.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../../widgets/views/cards/crypto/controller/controller.dart';
import '../more/controller/buy.dart';

class EnterAmountVC extends StatefulWidget {
  const EnterAmountVC({super.key});

  @override
  State<EnterAmountVC> createState() => _EnterAmountVCState();
}

class _EnterAmountVCState extends State<EnterAmountVC> {
  final CryptoC cryptoC = Get.find();
  final BuyC buyC = Get.put(BuyC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 100,
                  collapsedHeight: 100,
                  backgroundColor: AppColors.purpura.withAlpha(0),
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipPath(
                      clipper: InBorderBotton(),
                      child: ClipPath(
                        clipper: InBorderBotton(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          color: AppColors.purpura,
                        ),
                      ),
                    ),
                    expandedTitleScale: 1,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UILabels(
                          text: "Buy ${cryptoC.selectCrypto.value.fromsymbol}",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.graphic_eq_outlined,
                              color: AppColors.green,
                            ),
                            UILabels(
                              text: " 1 ${cryptoC.selectCrypto.value.fromsymbol} = \$${cryptoC.selectCrypto.value.value}",
                              textLines: 1,
                              color: AppColors.green1,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                cardsAmount(),
                                const SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/${globals.rootName}/addMoney",
                                      );
                                    },
                                    child: Hero(tag: 'cardsAmount', child: cardsAmount2()))
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(30)),
                                border: Border.all(width: 1, color: AppColors.gray0),
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
                              child: const Icon(
                                Icons.arrow_upward,
                                color: AppColors.purpura,
                                size: 30,
                                weight: 0.1,
                                fill: 0.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: UILabels(
                                text: "Repeats",
                                textLines: 1,
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            UILabels(
                              text: "Set",
                              textLines: 1,
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
            child: SizedBox(
                height: 50,
                width: Get.width,
                child: Obx(
                  () => UIBottons(
                      labels: UILabels(
                        text: 'Buy \$${buyC.amoutSelect.value} ${cryptoC.selectCrypto.value.fromsymbol} ',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      colorList: const [],
                      cb: (v) {
                        PaymentMethodSheet().choosePaymentMethod(context);
                      }),
                )),
          ),
        ],
      ),
    );
  }

  Widget cardsAmount() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.gray0),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.purpura.withAlpha(25),
        //     spreadRadius: 0,
        //     blurRadius: 28,
        //     offset: Offset(0, 4), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          UILabels(
                            text: cryptoC.selectCrypto.value.fromsymbol ?? "",
                            textLines: 1,
                            color: AppColors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.arrow_drop_down_circle_outlined, size: 18, color: AppColors.purpura6),
                        ],
                      ),
                    ),
                    Obx(
                      () => UILabels(
                        text: currentValue(),
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: UILabels(
                        text: "Balance: 0",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Icon(
                    //   Icons.info_outline,
                    //   color: AppColors.gray2,
                    //   size: 14,
                    // ),
                    // UILabels(
                    //   text: " after 0,0000636 BTC fee",
                    //   textLines: 1,
                    //   color: AppColors.gray2,
                    //   fontSize: 12,
                    //   fontWeight: FontWeight.w400,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardsAmount2() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.purpura.withAlpha(25),
            spreadRadius: 0,
            blurRadius: 28,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: UILabels(
                        text: "USD",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Obx(
                      () => UILabels(
                        text: "\$${buyC.amoutSelect.value}",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const UILabels(
                  text: "Balance: 11,34.55",
                  textLines: 1,
                  color: AppColors.black,
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

  String currentValue() {
    var price = double.parse(cryptoC.selectCrypto.value.value?.replaceAll(',', '') ?? "0");
    var many = double.parse(buyC.amoutSelect.value);
    return Utlis().getNumberFormat((price * many).toString(), "#,###.##");
  }
}
