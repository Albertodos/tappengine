import 'package:flutter/material.dart';
import 'package:tappengine/widgets/views/cards/info/info.dart';
import 'package:tappengine/widgets/views/reusebles/reusables.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../../widgets/views/cards/orders/orders.dart';

class TransactionsVC extends StatefulWidget {
  const TransactionsVC({super.key});

  @override
  State<TransactionsVC> createState() => _TransactionsVCState();
}

class _TransactionsVCState extends State<TransactionsVC> {
  @override
  Widget build(BuildContext context) {
    var pulldata = PullData(
        data: [OrdersCards().cards03(), OrdersCards().cards03(), OrdersCards().cards03()], more: "", title: "Today", position: Axis.vertical);
    var pulldata1 = PullData(
        data: [OrdersCards().cards03(), OrdersCards().cards03(), OrdersCards().cards03()], more: "", title: "29 SET", position: Axis.vertical);

    return Column(
      children: [
        ListStrutural(
          data: pulldata,
          colorTitle: AppColors.black,
          height: null,
        ),
        ListStrutural(
          data: pulldata1,
          colorTitle: AppColors.black,
          height: null,
        ),
      ],
    );
  }
}
