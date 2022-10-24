import 'dart:convert';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/api_path.dart';
import 'package:tappengine/model/objects/pull_data.dart';
import 'package:tappengine/widgets/views/cards/crypto/model/crypto.dart';
import 'package:tappengine/widgets/views/cards/crypto/model/tab_menu.dart';

import '../../../../dependencies/http/http.dart';
import '../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../widgets/views/cards/products/model/products_vies.dart';
import '../../../../widgets/views/cards/products/products.dart';
import '../../../../widgets/views/cards/crypto/cryptos.dart';
import '../../../../widgets/views/cards/menu/menuCard.dart';
import '../../../../widgets/views/cards/publicity/publicity.dart';
import '../../../../widgets/views/cards/watchlists.dart/watchlists.dart';
import '../../reusebles/buy_overview/page_view/news.dart';
import '../../reusebles/buy_overview/page_view/orders.dart';
import '../../reusebles/buy_overview/page_view/overview.dart';
import '../../reusebles/buy_overview/page_view/transactions.dart';

class ProductsC extends GetxController {
  final pullData = <PullData>[].obs;

  Future getproductsView(url, context) async {
    print(url);
    var response = await HttpService.getService(url, context);
    if (response is List) {
      pullData.value = List<PullData>.from(response.map((e) => PullData.fromJson(e, context)).toList());

      for (var item in pullData) {
        getDataItem(item, pullData.indexOf(item), context);
      }
    }

    return "error tto login";
  }

  Future getDataItem(PullData data, int position, context) async {
    switch (data.type) {
      case "CryptoListView":
        await Crypto().getListDataItem(data.dataUrl, context).then((value) {
          pullData[position].data = value;
        });
        break;
      case "CryptoDashboard01":
        await Crypto().getListDataItem(data.dataUrl, context).then((value) {
          var cryptoDashboard = value.map((e) => e.cryptoDashboard01(context));
          pullData[position].position = Axis.vertical;
          pullData[position].height = 220;
          pullData[position].data = cryptoDashboard;
        });
        break;

      case "ProductsListView":
        await ProductsView().getListDataItem(data.dataUrl, context).then((value) {
          pullData[position].data = value;
        });

        break;
      case "MenuTab":
        await TabMenu().getTabmenu(data.dataUrl, context).then((value) {
          pullData[position].data = value;
        });
        //
        break;

      case "PubAdvice":
        pullData[position].data = [const PublicityCards().card01()];
        break;
      case "CryptoAnalyticsGridView":
        pullData[position].data = [
          // MenuCards().tabMenu(["Crypto", "Stocks"], (p) {}),
          AnalyticsCards().card01(),
        ];
        break;
      case "PubCrypto":
        pullData[position].data = [PublicityCards().card02()];
        break;

      default:
    }
    pullData.value = List<PullData>.from(pullData.map((e) => e).toList());
    return "error tto login";
  }
}
