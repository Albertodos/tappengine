import '../../../../../dependencies/http/http.dart';
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
  String? typeName;

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
    price = json['price'].toString();
    quantity = json['quantity'].toString();
    side = json['side'].toString();
    time = json['time'].toString();
    status = json['status'].toString();
    clientName = json['clientName'].toString();
    type = json['type'].toString();
    typeName = json['typeName'].toString();
  }

  Future<List<OrdersCards>> getListDataItem(url, context) async {
    var response = await HttpService.postMicroService(url, context);

    var crypto = List<OrdersCards>.from(response['data'].map((e) => OrdersCards(orders: Orders.fromJson(e))).toList());
    return crypto;
  }
}
