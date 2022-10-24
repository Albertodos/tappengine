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
    id = json['id'];
    name = json['name'];
    value = json['value'];
    valueChange = json['valueChange'];
    percent = json['percent'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    data['valueChange'] = this.valueChange;
    data['percent'] = this.percent;
    data['img'] = this.img;
    return data;
  }

  Future<List<ProductsCards>> getListDataItem(url, context) async {
    var response = await HttpService.getService(url, context);
    var crypto = List<ProductsCards>.from(response.map((e) => ProductsCards(productsView: ProductsView.fromJson(e))).toList());
    return crypto;
  }
}
