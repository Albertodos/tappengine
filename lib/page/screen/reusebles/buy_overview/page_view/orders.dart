import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/crypto/model/crypto.dart';
import '../../../../../widgets/views/cards/orders/model/orders.dart';
import '../../../../../widgets/views/cards/orders/orders.dart';

class OrdersVC extends StatefulWidget {
  final Crypto crypto;
  const OrdersVC({super.key, required this.crypto});

  @override
  State<OrdersVC> createState() => _OrdersVCState();
}

class _OrdersVCState extends State<OrdersVC> {
  final orders = <OrdersCards>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Orders().getListDataItem("Orders/GetWalletOrders/1/${widget.crypto.fromsymbol}/1/10", context).then((value) {
      orders.value = value as List<OrdersCards>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => orders.isNotEmpty
              ? ListStrutural(
                  data: PullData(data: orders, more: "", title: "", position: Axis.vertical),
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
