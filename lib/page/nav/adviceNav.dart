// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tappengine/page/screen/home/homeVC.dart';
import 'package:tappengine/page/screen/profile/edit_emailVC.dart';
import 'package:tappengine/page/screen/profile/edit_phone_numberVC.dart';
import 'package:tappengine/page/screen/profile/edit_profileVC.dart';
import '../screen/advice/adviceVC.dart';
import '../screen/profile/edit_addressVC.dart';
import '../screen/profile/notificationsVC.dart';
import '../screen/profile/personal_infoVC.dart';
import '../screen/reusebles/more/add_money.dart';

class AdviceNav extends StatefulWidget {
  final Widget root;
  const AdviceNav({super.key, required this.root});
  @override
  State<AdviceNav> createState() => _AdviceNavState();
}

class _AdviceNavState extends State<AdviceNav> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'advice',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => widget.root,
        '/home': (context) => const HomeVC(),
        '/advice': (context) => const AdviceVC(),
        '/personalInfo': (context) => const PersonalInfoVC(),
        '/editProfile': (context) => const EditProfileVC(),
        '/editPhoneNumber': (context) => const EditPhoneNumberVC(),
        '/editEmail': (context) => const EditEmailVC(),
        '/editAddress': (context) => const EditAddressVC(),
        '/notifications': (context) => const NotificationsVC(),
        '/addMoney': (context) => const AddMoneyVC(),
      },
    );
  }
}
