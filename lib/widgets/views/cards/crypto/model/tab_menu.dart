import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/model/objects/pull_data.dart';
import 'package:tappengine/widgets/views/cards/analytics/analytics.dart';
import 'package:tappengine/widgets/views/cards/crypto/cryptos.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../dependencies/http/http.dart';
import '../../../../structural/list_Structural.dart';
import '../../products/model/products_view.dart';
import 'crypto.dart';

class TabMenu {
  int? id;
  String? name;
  String? type;
  String? dataUrl;
  String? moreUrl;
  final widget = Column().obs;

  TabMenu({
    this.id,
    this.name,
    this.type,
    this.dataUrl,
    this.moreUrl,
  });

  TabMenu.fromJson(Map<String, dynamic> json, context) {
    id = json['orderId'];
    name = json['name'];
    type = json['type'];
    dataUrl = json['dataUrl'];
    moreUrl = json['moreUrl'];
    getDataItem(context);
  }

  Future<List<TabMenu>> getTabmenu(url, context) async {
    var response = await HttpService.getService(url, context);
    var menuTab = List<TabMenu>.from(response.map((e) => TabMenu.fromJson(e, context)).toList());
    return menuTab;
  }

  Future getDataItem(context) async {
    switch (type) {
      case "CryptoListView":
        await Crypto().getListDataItem(dataUrl, context).then((value) {
          widget.value = Column(children: value.map((e) => e).toList());
        });

        break;
      case "CryptoDashboard01":
        await Crypto().getListDataItem(dataUrl, context).then((value) {
          widget.value = Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              width: Get.width,
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: value.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return (value is List<CryptoCards>)
                      ? value.map((e) => (e).cryptoDashboard02(context)).toList()[index]
                      : value.map((e) => e).toList()[index];
                },
              ),
            )
          ]);
        });

        break;
      case "ProductsListView":
        await ProductsView().getListDataItem(dataUrl, context).then((value) {
          widget.value = Column(children: value.map((e) => e).toList());
        });

        break;
      case "MenuTab":
        break;

      case "PubAdvice":
        break;
      case "CryptoAnalyticsGridView":
        //  await .getListDataItem(dataUrl, context).then((value) {
        widget.value = Column(children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnalyticsCards().card01(),
          )
        ]);
        // });
        break;
      case "PubCrypto":
        break;

      default:
    }
    return "error tto login";
  }
}
