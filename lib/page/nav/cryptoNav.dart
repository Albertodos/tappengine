// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tappengine/page/screen/reusebles/buy_overview/buy_overviewVC.dart';
import 'package:tappengine/page/screen/home/homeVC.dart';
import 'package:tappengine/page/screen/profile/edit_emailVC.dart';
import 'package:tappengine/page/screen/profile/edit_phone_numberVC.dart';
import 'package:tappengine/page/screen/profile/edit_profileVC.dart';

import '../screen/reusebles/buy_overview/confirm_orderVC.dart';
import '../screen/reusebles/buy_overview/enter_amoutVC.dart';
import '../screen/reusebles/buy_overview/scheduleVC.dart';
import '../screen/crypto/investVC.dart';
import '../screen/profile/edit_addressVC.dart';
import '../screen/profile/notificationsVC.dart';
import '../screen/profile/personal_infoVC.dart';
import '../screen/reusebles/buy_overview/statementVC.dart';
import '../screen/reusebles/more/add_money.dart';

class CryptoNav extends StatefulWidget {
  final Widget root;
  const CryptoNav({super.key, required this.root});
  @override
  State<CryptoNav> createState() => _CryptoNavState();
}

class _CryptoNavState extends State<CryptoNav> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'crypto',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => widget.root,
        '/invest': (context) => const InvestVC(),
        '/buyOverview': (context) => const BuyOverviewVC(),
        '/enterAmount': (context) => const EnterAmountVC(),
        '/comfirmOrder': (context) => const ComfirmOrderVC(),
        '/schedule': (context) => const ScheduleVC(),
        '/statement': (context) => const StatementVC(),
        '/addMoney': (context) => const AddMoneyVC(),
      },
    );
  }
}
