// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tappengine/page/screen/home/homeVC.dart';
import 'package:tappengine/page/screen/products/productsVC.dart';
import 'package:tappengine/page/screen/profile/edit_emailVC.dart';
import 'package:tappengine/page/screen/profile/edit_phone_numberVC.dart';
import 'package:tappengine/page/screen/profile/edit_profileVC.dart';
import 'package:tappengine/page/tab/model/products.dart';
import '../screen/crypto/investVC.dart';
import '../screen/profile/edit_addressVC.dart';
import '../screen/profile/notificationsVC.dart';
import '../screen/profile/personal_infoVC.dart';
import '../screen/reusebles/buy_overview/buy_overviewVC.dart';
import '../screen/reusebles/buy_overview/confirm_orderVC.dart';
import '../screen/reusebles/buy_overview/enter_amoutVC.dart';
import '../screen/reusebles/buy_overview/scheduleVC.dart';
import '../screen/reusebles/buy_overview/statementVC.dart';
import '../screen/reusebles/more/add_money.dart';
import '../screen/reusebles/web/pdfVC.dart';

class ProductsNav extends StatefulWidget {
  final Products data;
  const ProductsNav({super.key, required this.data});
  @override
  State<ProductsNav> createState() => _ProductsNavState();
}

class _ProductsNavState extends State<ProductsNav> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => ProductsVC(
              key: Key(widget.data.dataUrl.toString()),
              dataUrl: widget.data.dataUrl.toString(),
            ),
        '/home': (context) => const HomeVC(),
        '/personalInfo': (context) => const PersonalInfoVC(),
        '/editProfile': (context) => const EditProfileVC(),
        '/editPhoneNumber': (context) => const EditPhoneNumberVC(),
        '/editEmail': (context) => const EditEmailVC(),
        '/editAddress': (context) => const EditAddressVC(),
        '/notifications': (context) => const NotificationsVC(),
        '/addMoney': (context) => const AddMoneyVC(),
        '/invest': (context) => const InvestVC(),
        '/buyOverview': (context) => const BuyOverviewVC(),
        '/enterAmount': (context) => const EnterAmountVC(),
        '/comfirmOrder': (context) => const ComfirmOrderVC(),
        '/schedule': (context) => const ScheduleVC(),
        '/statement': (context) => const StatementVC(),
        '/pdf': (context) => const PdfVC(),
      },
    );
  }
}
