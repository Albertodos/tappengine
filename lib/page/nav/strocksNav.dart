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
import '../screen/reusebles/web/pdfVC.dart';
import '../screen/stocks/corporate_eventsVC.dart';

class StrocksNav extends StatefulWidget {
  final Widget root;
  const StrocksNav({super.key, required this.root});
  @override
  State<StrocksNav> createState() => _StrocksNavState();
}

class _StrocksNavState extends State<StrocksNav> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'crypto',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => widget.root,
        '/corporateEvents': (context) => const CorporateEventsVC(),
        '/buyOverview': (context) => const BuyOverviewVC(),
        '/enterAmount': (context) => const EnterAmountVC(),
        '/comfirmOrder': (context) => const ComfirmOrderVC(),
        '/schedule': (context) => const ScheduleVC(),
        '/statement': (context) => const StatementVC(),
        '/pdf': (context) => const PdfVC(),
        '/addMoney': (context) => const AddMoneyVC(),
        '/personalInfo': (context) => const PersonalInfoVC(),
        '/editProfile': (context) => const EditProfileVC(),
        '/editPhoneNumber': (context) => const EditPhoneNumberVC(),
        '/editEmail': (context) => const EditEmailVC(),
        '/editAddress': (context) => const EditAddressVC(),
        '/notifications': (context) => const NotificationsVC(),
      },
    );
  }
}
