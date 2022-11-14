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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: widget.data.name ?? "...",

        // Start the app with the "/" named route. In this case, the app starts
        // on the FirstScreen widget.
        initialRoute: '/${widget.data.name}/',
        routes: {
          '/${widget.data.name}/': (context) => ProductsVC(
                key: Key(widget.data.dataUrl.toString()),
                dataUrl: widget.data.dataUrl.toString(),
              ),
          '/${widget.data.name}/crypto': (context) => ProductsVC(
                key: Key(widget.data.dataUrl.toString()),
                dataUrl: widget.data.dataUrl.toString(),
              ),
          '/${widget.data.name}/home': (context) => const HomeVC(),
          '/${widget.data.name}/personalInfo': (context) => const PersonalInfoVC(),
          '/${widget.data.name}/editProfile': (context) => const EditProfileVC(),
          '/${widget.data.name}/editPhoneNumber': (context) => const EditPhoneNumberVC(),
          '/${widget.data.name}/editEmail': (context) => const EditEmailVC(),
          '/${widget.data.name}/editAddress': (context) => const EditAddressVC(),
          '/${widget.data.name}/notifications': (context) => const NotificationsVC(),
          '/${widget.data.name}/addMoney': (context) => const AddMoneyVC(),
          '/${widget.data.name}/invest': (context) => const InvestVC(),
          '/${widget.data.name}/buyOverview': (context) => const BuyOverviewVC(),
          '/${widget.data.name}/enterAmount': (context) => const EnterAmountVC(),
          '/${widget.data.name}/comfirmOrder': (context) => const ComfirmOrderVC(),
          '/${widget.data.name}/schedule': (context) => const ScheduleVC(),
          '/${widget.data.name}/statement': (context) => const StatementVC(),
          '/${widget.data.name}/pdf': (context) => const PdfVC(),
        });
  }
}
