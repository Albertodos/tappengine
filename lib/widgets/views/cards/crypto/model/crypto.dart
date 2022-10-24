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

  //  "id": 45,
  //   "supplierId": 7605,
  //   "fromsymbol": "ETH",
  //   "tosymbol": "USD",
  //   "coinName": "Ethereum",
  //   "price": "1308.92",
  //   "lastVolume": "1.19779",
  //   "percentagePriceChange": "0.97821391100414",
  //   "imageUrl": "https://cryptocompare.com//media/37746238/eth.png",
  //   "historicalData": null

  Future<List<CryptoCards>> getListDataItem(url, context) async {
    var response = await HttpService.getMicroService(url, context);
    var crypto = List<CryptoCards>.from(response.map((e) => CryptoCards(crypto: Crypto.fromJson(e))).toList());
    return crypto;
  }
}
