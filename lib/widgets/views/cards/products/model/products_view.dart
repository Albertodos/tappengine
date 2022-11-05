import 'package:tappengine/widgets/views/cards/products/Products.dart';
import 'package:intl/intl.dart';
import '../../../../../dependencies/http/http.dart';

class ProductsView {
  String? id;
  String? name;
  String? value;
  String? valueChange;
  String? currentTotalAmount;
  String? percent;
  String? img;
  final priceFormat = NumberFormat("#,##0.00", "pt_BR");
  final valueChageFormat = NumberFormat("#,#######0.00", "pt_BR");

  ProductsView({this.id, this.name, this.value, this.valueChange, this.percent, this.img});

  ProductsView.fromJson(Map<String, dynamic> json) {
    id = json['walletId'].toString();
    name = json['description'].toString();
    value = json['currentTotalPrice'].toString();
    valueChange = json['unrealisedReturnValue'].toString();
    percent = json['unrealisedReturnPercentage'].toString();
    img = json['img'].toString();
    currentTotalAmount = json['currentTotalAmount'].toString();
  }

  Future<List<ProductsCards>> getListDataItem(url, context) async {
    var response = await HttpService.getMicroService(url, context);
    var products = List<ProductsCards>.from(response.map((e) => ProductsCards(productsView: ProductsView.fromJson(e))).toList());
    return products;
  }
}
