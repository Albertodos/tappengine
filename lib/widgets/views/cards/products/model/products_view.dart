import 'package:tappengine/widgets/views/cards/products/Products.dart';
import '../../../../../dependencies/http/http.dart';
import '../../../../../helpers/utils.dart';

class ProductsView {
  String? id;
  String? name;
  String? value;
  String? valueChange;
  String? currentTotalAmount;
  String? percent;
  String? img;

  ProductsView({this.id, this.name, this.value, this.valueChange, this.percent, this.img});

  ProductsView.fromJson(Map<String, dynamic> json) {
    id = json['walletId'].toString();
    name = json['description'].toString();
    value = Utlis().getNumberFormat(json['currentTotalPrice'].toString(), "#,###.##");
    valueChange = Utlis().getNumberFormat(json['unrealisedReturnValue'].toString(), "#,########.##");
    percent = json['unrealisedReturnPercentage'].toString();
    img = Utlis().getCryptoImage(name?.toLowerCase().toString(), json['image'].toString());
    currentTotalAmount = json['currentTotalAmount'].toString();
  }

  Future<List<ProductsCards>> getListDataItem(url, context) async {
    var response = await HttpService.getMicroService(url, context);
    var products = List<ProductsCards>.from(response.map((e) => ProductsCards(productsView: ProductsView.fromJson(e))).toList());
    return products;
  }
}
