import 'package:flutter/material.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/helpers/utils.dart';
import '../../../../../dependencies/http/http.dart';

import '../../../alert/alerts.dart';
import '../cryptos.dart';

class Crypto {
  String? id;
  String? dayMonth;
  String? time;
  String? name;
  String? value;
  String? valueChange;
  String? percent;
  String? img;
  String? fromsymbol;
  String? supplierId;
  String? tosymbol;
  Color color = AppColors.green;
  Widget? arrow;
  List<DashboardData>? dashboardData;

  Crypto({this.id, this.name, this.value, this.valueChange, this.percent, this.img});

  Crypto.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['coinName'] ?? json['symbol'].toString();
    tosymbol = json['tosymbol'].toString();
    value = Utlis().getNumberFormat(json['price'] ?? json['currentTotalPrice'].toString(), "#,###.##");
    valueChange = Utlis().getNumberFormat(json['lastVolume'] ?? json['unrealisedReturnValue'].toString(), "#,########.##");
    percent = "${json['percentagePriceChange'] ?? json['unrealisedReturnPercentage'].toString()} %";

    fromsymbol = json['fromsymbol'] != null ? json['fromsymbol'].toString() : json['fromSymbol'] ?? json['symbol'].toString();

    img = Utlis().getCryptoImage(fromsymbol, json['imageUrl'].toString());

    supplierId = json['supplierId'].toString();
    time = json['time'].toString();
    dayMonth = "Today";
    // if (json['percentagePriceChange'] != null) {
    color = Utlis().getPercent(json['percentagePriceChange'] ?? json['unrealisedReturnPercentage'].toString())[0];
    arrow = Utlis().getPercent(json['percentagePriceChange'] ?? json['unrealisedReturnPercentage'].toString())[1];
    // }

    // dayMonth = Utlis().getDataTime(time ?? "") == DateTime.now()
    //     ? "Today"
    //     : "${Utlis().getDataTime(time ?? "").day}/${Utlis().getDataTime(time ?? "").month}";
  }

  Future<List<Widget>> getListDataItem(url, context) async {
    var response = await HttpService.getMicroService(url, context);
    var crypto = <Widget>[];
    if (response.isNotEmpty) {
      crypto = List<CryptoCards>.from(response.map((e) => CryptoCards(crypto: Crypto.fromJson(e))).toList());
      getDashboardData(2, context);
    } else {
      crypto = [AlertsCards().tryAgain((p0) => getListDataItem(url, context))];
    }

    return crypto;
  }

  Future postFavourite(url, body, context) async {
    var response = await HttpService.postBodyMicroService(url, body, context);
    return response;
  }

  Future<List<DashboardData>> getDashboardData(filter, context) async {
    var response = await HttpService.getMicroService("Watchlist/GetDashboardData/$fromsymbol/$tosymbol/$filter", context);
    dashboardData = List<DashboardData>.from(response.map((e) => DashboardData.fromJson(e)).toList());

    return dashboardData ?? [];
  }
}

class DashboardData {
  String? y;
  DateTime? x;

  DashboardData({this.x, this.y});

  DashboardData.fromJson(Map<String, dynamic> json) {
    x = getDataTime(json['x']);
    y = json['y'];
  }
  static DateTime getDataTime(String data) {
    var dateTime = DateTime.parse(data);

    return dateTime;
  }
}
