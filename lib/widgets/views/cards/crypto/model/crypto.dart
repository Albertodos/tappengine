import 'package:tappengine/helpers/utils.dart';

import '../../../../../dependencies/http/http.dart';

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
  CryptoBalances? cryptoBalances;
  List<DashboardData>? dashboardData;

  Crypto({this.id, this.name, this.value, this.valueChange, this.percent, this.img});

  Crypto.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['coinName'].toString();
    tosymbol = json['tosymbol'].toString();
    value = json['price'].toString();
    valueChange = json['lastVolume'].toString();
    percent = json['percentagePriceChange'].toString();

    fromsymbol = json['fromsymbol'] != null ? json['fromsymbol'].toString() : json['fromSymbol'];
    ;
    img = Utlis().getCryptoImage(fromsymbol, json['imageUrl'].toString());

    supplierId = json['supplierId'].toString();
    time = json['time'].toString();
    dayMonth = "Today";
    // dayMonth = Utlis().getDataTime(time ?? "") == DateTime.now()
    //     ? "Today"
    //     : "${Utlis().getDataTime(time ?? "").day}/${Utlis().getDataTime(time ?? "").month}";
  }

  Future<List<CryptoCards>> getListDataItem(url, context) async {
    var response = await HttpService.getMicroService(url, context);
    var crypto = List<CryptoCards>.from(response.map((e) => CryptoCards(crypto: Crypto.fromJson(e))).toList());
    getDashboardData(2, context);
    return crypto;
  }

  Future<List<DashboardData>> getDashboardData(filter, context) async {
    var response = await HttpService.getMicroService("Watchlist/GetDashboardData/$fromsymbol/$tosymbol/$filter", context);
    dashboardData = List<DashboardData>.from(response.map((e) => DashboardData.fromJson(e)).toList());

    return dashboardData ?? [];
  }
}

class CryptoBalances {
  int? id;
  String? name;
  String? value;
  String? valueChange;
  String? percent;
  String? img;
  String? fromsymbol;

  CryptoBalances({this.id, this.name, this.value, this.valueChange, this.percent, this.img});

  CryptoBalances.fromJson(Map<String, dynamic> json) {
    id = json['walletId'];
    name = json['description'].toString();
    value = json['currentTotalPrice'].toString();
    valueChange = json['unrealisedReturnValue'].toString();
    percent = json['unrealisedReturnPercentage'].toString();
    img = json['img'].toString();
  }

  Future<CryptoCards> getListDataItem(url, context) async {
    var response = await HttpService.getMicroService(url, context);
    var cryptoBalances = CryptoCards(cryptoBalances: CryptoBalances.fromJson(response));
    return cryptoBalances;
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
