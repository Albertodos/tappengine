import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/widgets/views/cards/products/model/products_vies.dart';

import '../../dependencies/http/http.dart';
import '../../widgets/views/cards/products/products.dart';

class PullData {
  String? title;
  // final  data = <dynamic>[].obs;
  dynamic data;
  String? more;
  String? dataUrl;
  dynamic type;
  Axis? position;
  dynamic height;

  PullData({
    this.data,
    this.more,
    this.type,
    this.title,
    this.position,
  });

  PullData.fromJson(Map<String, dynamic> json, context) {
    title = json['name'].toString();
    type = json['type'].toString();
    // switch (type) {
    //   case "CryptoBalancesListView":
    data = [
      ProductsCards(
        productsView: ProductsView(),
      ).shimmer(),
      ProductsCards(
        productsView: ProductsView(),
      ).shimmer(),
      ProductsCards(
        productsView: ProductsView(),
      ).shimmer()
    ];
    //     break;
    //   default:
    // }
    more = json['moreUrl'].toString();

    dataUrl = json['dataUrl'].toString();
    position = Axis.vertical;
    // getDataItem(dataUrl, context);
  }
}
