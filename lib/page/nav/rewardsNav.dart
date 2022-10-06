// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tappengine/page/screen/home/homeVC.dart';
import 'package:tappengine/page/screen/profile/edit_emailVC.dart';
import 'package:tappengine/page/screen/profile/edit_phone_numberVC.dart';
import 'package:tappengine/page/screen/profile/edit_profileVC.dart';
import '../screen/profile/edit_addressVC.dart';
import '../screen/profile/notificationsVC.dart';
import '../screen/profile/personal_infoVC.dart';
import '../screen/reusebles/more/add_money.dart';

class RewardsNav extends StatefulWidget {
  final Widget root;
  const RewardsNav({super.key, required this.root});
  @override
  State<RewardsNav> createState() => _RewardsState();
}

class _RewardsState extends State<RewardsNav> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => widget.root,
        '/home': (context) => const HomeVC(),
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
