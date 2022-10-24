import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/api_path.dart';
import 'package:tappengine/dependencies/shared_preference/interface_shared_preference.dart';

import '../../../constants/app_colors.dart';
import '../../../dependencies/http/http.dart';
import '../../../dependencies/shared_preference/shared_preference_service.dart';
import '../model/products.dart';

class TabC extends GetxController {
  ILocalStorage localStorage = PrefsLocalStorageService();

  final barItems = <BottomNavigationBarItem>[].obs;
  final products = <Products>[].obs;
  final moreBarItems = <BottomNavigationBarItem>[].obs;

  Future getproducts(context) async {
    await getCacheProducts().then((value) async {
      //Upade Produtos

      var response = await HttpService.getService("products.json", context);

      if (response is Map<String, dynamic>) {
        var barItem = <BottomNavigationBarItem>[];
        saveProducts(response).then((value) {
          products.value = List<Products>.from(response['products'].map((e) => Products.fromJson(e)).toList());
          for (var item in products) {
            barItem.add(getBarItems(item));
          }
          barItems.value = barItem;
          return "User Is not existe";
        });
      }
      return "error tto login";
    });
    return "error tto login";
  }

  Future getCacheProducts() async {
    await localStorage.get("products").then((value) {
      if (value != null) {
        Map<String, dynamic> json = jsonDecode(value);

        print(json["products"]);

        var barItem = <BottomNavigationBarItem>[];
        products.value = List<Products>.from(json["products"].map((e) => Products.fromJson(e)).toList());
        for (var item in products) {
          barItem.add(getBarItems(item));
        }
        barItems.value = barItem;
      }
      return "";
    });
  }

  BottomNavigationBarItem getBarItems(
    Products item,
  ) {
    return BottomNavigationBarItem(
        icon: SvgPicture.network(ApiPath.imgBaseUrl + (item.icon.toString()), height: 19, width: 19, color: AppColors.gray2), label: item.name);
  }

  BottomNavigationBarItem getMoreBarItems() {
    return const BottomNavigationBarItem(icon: Expanded(child: Icon(Icons.more_horiz)), label: "More");
  }

  Future saveProducts(products) async {
    String encodedMap = json.encode(products);

    await localStorage.put("products", encodedMap);
    return "save";
  }
}
