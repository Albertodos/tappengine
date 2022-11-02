import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/crypto/controller/controller.dart';
import '../../../../../widgets/views/cards/crypto/model/crypto.dart';
import '../../../../../widgets/views/cards/transaction/model/transaction.dart';
import '../../../../../widgets/views/cards/transaction/transaction.dart';

class TransactionsVC extends StatefulWidget {
  final Crypto crypto;
  const TransactionsVC({super.key, required this.crypto});

  @override
  State<TransactionsVC> createState() => _TransactionsVCState();
}

class _TransactionsVCState extends State<TransactionsVC> {
  final transaction = <TransactionCards>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Transactions()
        .getListDataItem("Transactions/GetUserTransactionsByAsset/1/${widget.crypto.fromsymbol}/1/10", widget.crypto, context)
        .then((value) {
      transaction.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => transaction.isNotEmpty
              ? ListStrutural(
                  data: PullData(data: transaction, more: "", title: "", position: Axis.vertical),
                  colorTitle: AppColors.black,
                  height: null,
                )
              : const CircularProgressIndicator(
                  color: AppColors.black,
                ),
        ),
      ],
    );
  }
}
