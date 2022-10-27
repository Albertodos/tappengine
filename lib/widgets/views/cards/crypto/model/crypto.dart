import '../../../../../dependencies/http/http.dart';
import '../cryptos.dart';

class Crypto {
  int? id;
  String? name;
  String? value;
  String? valueChange;
  String? percent;
  String? img;
  String? fromsymbol;
  CryptoBalances? cryptoBalances;

  Crypto({this.id, this.name, this.value, this.valueChange, this.percent, this.img});

  Crypto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['coinName'];
    value = json['price'];
    valueChange = json['lastVolume'];
    percent = json['percentagePriceChange'];
    img = json['imageUrl'];
    fromsymbol = json['fromsymbol'];
  }

  Future<List<CryptoCards>> getListDataItem(url, context) async {
    var response = await HttpService.getMicroService(url, context);
    var crypto = List<CryptoCards>.from(response.map((e) => CryptoCards(crypto: Crypto.fromJson(e))).toList());
    return crypto;
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
    var response = await HttpService.getService(url, context);
    var cryptoBalances = CryptoCards(cryptoBalances: CryptoBalances.fromJson(response));
    return cryptoBalances;
  }
}
