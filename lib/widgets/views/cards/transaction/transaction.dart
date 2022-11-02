import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';
import '../crypto/model/crypto.dart';
import 'model/transaction.dart';

class TransactionCards extends StatelessWidget {
  final Transactions transactions;
  final Crypto crypto;
  const TransactionCards({super.key, required this.transactions, required this.crypto});

  @override
  Widget build(BuildContext context) {
    var type = transactions.walletTransactionType == "23" ? "Sold " : "Bought ";
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (transactions.dayMonth != "")
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UILabels(
                  text: transactions.dayMonth ?? "",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 16),
              ],
            ),
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
                          text: "$type  ${transactions.symbol}",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      UILabels(
                        text: transactions.amount ?? "",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: UILabels(
                          text: transactions.time ?? "",
                          textLines: 1,
                          color: AppColors.gray2,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      UILabels(
                        text: transactions.price ?? "",
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
