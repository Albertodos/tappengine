import 'package:flutter/material.dart';
import 'package:tappengine/widgets/views/cards/info/info.dart';
import 'package:tappengine/widgets/views/reusebles/reusables.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../../widgets/views/cards/orders/orders.dart';

class OrdersVC extends StatefulWidget {
  const OrdersVC({super.key});

  @override
  State<OrdersVC> createState() => _OrdersVCState();
}

class _OrdersVCState extends State<OrdersVC> {
  @override
  Widget build(BuildContext context) {
    var pulldata =
        PullData(data: [OrdersCards().cards01(), OrdersCards().cards01(), OrdersCards().cards01()], more: "", title: "", position: Axis.vertical);

    return Column(
      children: [
        ListStrutural(
          data: pulldata,
          colorTitle: AppColors.black,
          height: null,
        ),
      ],
    );
  }
}
