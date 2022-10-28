import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/page/nav/productsNav.dart';
import 'package:tappengine/page/screen/products/productsVC.dart';
import '../../helpers/globals.dart' as globals;

import '../screen/products/controller/productsC.dart';
import 'controller/tab_controller.dart';
import 'moreSheet.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TabC tabC = Get.put(TabC());
  final ProductsC productsC = Get.put(ProductsC());

  var widgetOptions = <Widget>[].obs;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 4) {
      if (tabC.barItems.length > 5) {
        MoreSheet().choosePaymentMethod(tabC.products.getRange(4, tabC.products.length).toList(), context);
      } else {
        setState(() {
          _selectedIndex = index;
        });
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    tabC.getproducts(context).then((value) {
      widgetOptions.value = tabC.products.map((element) {
        var controller = ProductsNav(key: Key(element.id.toString()), data: element);
        return controller;
      }).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    globals.hometabContext = context;

    return Obx(
      () => tabC.barItems.isNotEmpty
          ? Scaffold(
              body: Stack(
                children: <Widget>[
                  Center(
                    child: widgetOptions.isNotEmpty
                        ? widgetOptions[_selectedIndex]
                        : const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.black,
                            ),
                          ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Theme.of(context).cardColor,
                elevation: 2,
                type: BottomNavigationBarType.fixed,
                items: tabC.barItems.length > 5 ? getMoreBarItem() : tabC.barItems,
                currentIndex: _selectedIndex,
                selectedItemColor: AppColors.purpura,
                onTap: _onItemTapped,
                // unselectedLabelStyle: Styles.style9,
                // selectedLabelStyle: Styles.style9,
              ),
            )
          : const Scaffold(
              body: Center(
              child: CircularProgressIndicator(
                color: AppColors.black,
              ),
            )),
    );
  }

  List<BottomNavigationBarItem> getMoreBarItem() {
    return tabC.barItems.getRange(0, 4).toList() + [tabC.getMoreBarItems()];
  }
}
