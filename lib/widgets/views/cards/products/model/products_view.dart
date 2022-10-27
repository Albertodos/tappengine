import 'package:tappengine/widgets/views/cards/products/Products.dart';

import '../../../../../dependencies/http/http.dart';

class ProductsView {
  int? id;
  String? name;
  String? value;
  String? valueChange;
  String? percent;
  String? img;

  ProductsView({this.id, this.name, this.value, this.valueChange, this.percent, this.img});

  ProductsView.fromJson(Map<String, dynamic> json) {
    id = json['walletId'];
    name = json['description'].toString();
    value = json['currentTotalPrice'].toString();
    valueChange = json['unrealisedReturnValue'].toString();
    percent = json['unrealisedReturnPercentage'].toString();
    img = json['img'].toString();
  }

  Future<List<ProductsCards>> getListDataItem(url, context) async {
    var response = await HttpService.getService(url, context);
    var products = List<ProductsCards>.from(response.map((e) => ProductsCards(productsView: ProductsView.fromJson(e))).toList());
    return products;
  }
}
