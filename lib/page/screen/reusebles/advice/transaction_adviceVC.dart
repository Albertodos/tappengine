import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../model/objects/pull_data.dart';
import '../../../../model/objects/user/user.dart';
import '../../../../widgets/structural/list_Structural.dart';
import '../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../widgets/views/cards/balances/balances.dart';
import '../../../../widgets/views/form/form.dart';
import '../../../../widgets/views/reusebles/reusables.dart';

class TransactionAdviceVC extends StatefulWidget {
  const TransactionAdviceVC({Key? key}) : super(key: key);

  @override
  _TransactionAdviceVCState createState() => _TransactionAdviceVCState();
}

class _TransactionAdviceVCState extends State<TransactionAdviceVC> {

  var userLogin = User();

  @override
  Widget build(BuildContext context) {
    var pulldata2 = PullData(data: [
      ReusablesView().list06(),
    ], more: "", title: "", position: Axis.vertical);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 32, left: 32),
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
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
          child: Column(
            children: userLogin
                .toJsonTransaction()
                .values
                .map((e) => FromView(
              user: e, onSubmitted: (String ) {  },
            ))
                .toList(),
          ),
        ),
        ListStrutural(
          data: pulldata2,
          colorTitle: AppColors.black,
          height: null,
        ),
      ],
    );
  }
}
