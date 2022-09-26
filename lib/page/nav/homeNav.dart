// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tappengine/page/screen/home/homeVC.dart';

import '../screen/home/profile/personal_infoVC.dart';

class HomeNav extends StatefulWidget {
  final Widget root;
  const HomeNav({super.key, required this.root});
  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
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
      },
    );
  }
}
