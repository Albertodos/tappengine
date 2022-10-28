import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/page/screen/reusebles/more/add_money.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../../../dependencies/shimmer/shimmer.dart';
import '../../../../page/sheet/payment_method/payment_method.dart';
import '../../../ui_kits/button_ui/button_ui.dart';
import 'model/products_view.dart';

class ProductsCards extends StatelessWidget {
  final ProductsView productsView;
  const ProductsCards({super.key, required this.productsView});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
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
              UILabels(
                text: productsView.name ?? "",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              UILabels(
                text: productsView.value ?? "",
                textLines: 1,
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UILabels(
                    text: productsView.valueChange ?? "",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.green,
                  ),
                  UILabels(
                    text: productsView.percent ?? "",
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
    );
  }

  Widget productsHeader(context) {
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
                    text: productsView.name ?? "",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    children: [
                      UILabels(
                        text: productsView.value ?? "",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: AppColors.green),
                      UILabels(
                        text: productsView.percent ?? "",
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
                  const UILabels(
                    text: "Bitcoin",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: const [
                      UILabels(
                        text: "BTC",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      UILabels(
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

  Widget shimmer() {
    return ShimmerDependencies().shimmer(
      SizedBox(
        width: Get.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                const UILabels(
                  text: ".................",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                const UILabels(
                  text: "............",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    UILabels(
                      text: "........",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.green,
                    ),
                    UILabels(
                      text: ".........",
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
      ),
    );
  }
}
