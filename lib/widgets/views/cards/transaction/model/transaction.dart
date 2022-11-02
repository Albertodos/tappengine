import 'package:tappengine/helpers/utils.dart';

import '../../../../../dependencies/http/http.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../crypto/model/crypto.dart';
import '../transaction.dart';

class Transactions {
  String? id;
  String? accountId;
  String? walletTransactionType;
  String? symbol;
  String? amount;
  String? price;
  String? time;
  String? date;
  String? dayMonth;

  Transactions({this.id, this.accountId, this.walletTransactionType, this.symbol, this.amount, this.price, this.date});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    accountId = json['accountId'].toString();
    walletTransactionType = json['walletTransactionType'].toString();
    symbol = json['symbol'].toString();
    amount = json['amount'].toString();
    price = json['price'].toString();
    date = json['date'].toString();
    dayMonth = Utlis().getDataTime(date ?? "") == DateTime.now()
        ? "Today"
        : "${Utlis().getDataTime(date ?? "").day}/${Utlis().getDataTime(date ?? "").month}";

    time = "${Utlis().getDataTime(date ?? "").hour}:${Utlis().getDataTime(date ?? "").minute}";
  }

  Future<List<TransactionCards>> getListDataItem(url, setCrypto, context) async {
    var response = await HttpService.getMicroService(url, context);

    var crypto = List<TransactionCards>.from(response['data']
        .map((e) => TransactionCards(
              transactions: Transactions.fromJson(e),
              crypto: setCrypto,
            ))
        .toList());

    return crypto;
  }
}
