import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../dependencies/http/http.dart';
import '../../../../../helpers/utils.dart';
import '../../../alert/alerts.dart';
import '../orders.dart';

class Orders {
  String? id;
  String? accountId;
  String? asset;
  String? counterAsset;
  String? price;
  String? quantity;
  String? side;
  String? time;
  String? status;
  String? clientName;
  String? type;
  String? img;
  String? typeName;
  final priceFormat = NumberFormat("#,###.00", "pt_BR");
  final valueChageFormat = NumberFormat("#,#######0.00", "pt_BR");

  Orders(
      {this.id,
      this.accountId,
      this.asset,
      this.counterAsset,
      this.price,
      this.quantity,
      this.side,
      this.time,
      this.status,
      this.clientName,
      this.type,
      this.typeName});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    accountId = json['accountId'].toString();
    asset = json['asset'].toString();
    counterAsset = json['counterAsset'].toString();
    price = Utlis().getNumberFormat(json['price'].toString(), "#,###.##");
    quantity = json['quantity'].toString();
    side = json['side'].toString();
    time = json['time'].toString();
    status = json['status'].toString();
    clientName = json['clientName'].toString();
    type = json['type'].toString();
    typeName = json['typeName'] ?? "Sell";
    img = Utlis().getCryptoImage(asset, json['imageUrl'].toString());
  }

  Future<List<Widget>> getListDataItem(url, context) async {
    var response = await HttpService.postMicroService(url, context);
    var crypto = <Widget>[];

    if (response.isNotEmpty) {
      crypto = List<OrdersCards>.from(response['data'].map((e) => OrdersCards(orders: Orders.fromJson(e))).toList());
    } else {
      crypto = [AlertsCards().tryAgain((p0) => getListDataItem(url, context))];
    }
    return crypto;
  }
}
