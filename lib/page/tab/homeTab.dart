import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/page/screen/home/homeVC.dart';

import '../nav/homeNav.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeNav(root: HomeVC()),
    const HomeNav(root: HomeVC()),
    const HomeNav(root: HomeVC()),
    const HomeNav(root: HomeVC()),
    const HomeNav(root: HomeVC()),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/home.svg", width: 19, color: _selectedIndex == 0 ? AppColors.purpura : AppColors.gray2),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/crypto.svg", width: 19, color: _selectedIndex == 1 ? AppColors.purpura : AppColors.gray2),
              label: "Crypto"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/stocks.svg", width: 19, color: _selectedIndex == 2 ? AppColors.purpura : AppColors.gray2),
              label: "Stocks"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/models.svg", width: 19, color: _selectedIndex == 3 ? AppColors.purpura : AppColors.gray2),
              label: "Advice"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/report.svg", width: 19, color: _selectedIndex == 4 ? AppColors.purpura : AppColors.gray2),
              label: "Rewards"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.purpura,
        onTap: _onItemTapped,
        // unselectedLabelStyle: Styles.style9,
        // selectedLabelStyle: Styles.style9,
      ),
    );
  }
}
