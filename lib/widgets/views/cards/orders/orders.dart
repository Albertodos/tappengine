import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';

class OrdersCards extends StatelessWidget {
  const OrdersCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget cards01() {
    return Column(
      children: [
        Container(
          width: Get.width,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: AppColors.gray3,
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
                          children: const [
                            Expanded(
                              child: UILabels(
                                text: "Recurring buy BTC",
                                textLines: 1,
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            UILabels(
                              text: "\$34",
                              textLines: 1,
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        const UILabels(
                          text: "BNB • 161,234,261",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  Widget cards02() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Get.width - 64,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: AppColors.gray,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                      children: const [
                        Expanded(
                          child: UILabels(
                            text: "Limit Sell BTC",
                            textLines: 1,
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        UILabels(
                          text: "\$3456",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const UILabels(
                      text: "BNB • 161,234,261",
                      textLines: 1,
                      color: AppColors.purpura2,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    const UILabels(
                      text: "Limit price: \$70,000",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget cards03() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    children: const [
                      Expanded(
                        child: UILabels(
                          text: "Sold BTC for USD",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      UILabels(
                        text: "-0.0928TC",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: UILabels(
                          text: "18:00",
                          textLines: 1,
                          color: AppColors.gray2,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      UILabels(
                        text: "\$12",
                        textLines: 1,
                        color: AppColors.gray2,
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
        ],
      ),
    );
  }
}
