import 'package:get/get.dart';
import 'package:tappengine/helpers/utils.dart';

import '../../../../../dependencies/http/http.dart';
import '../../../../../widgets/views/cards/crypto/controller/controller.dart';

class BuyC extends GetxController {
  final amoutSelect = '10'.obs;
  final offerPrice = '0'.obs;
  final offerPriceQuantity = '0'.obs;
  var quoteId = "";
  final CryptoC cryptoC = Get.find();
  Future postQuote(url, symbol, side, context) async {
    Map<String, dynamic> body = {"tradingPair": "$symbol-USD", "quantity": amoutSelect.value, "currency": symbol, "side": side};
    var response = await HttpService.postBodyMicroService(url, body, context);
    print(response);

    quoteId = response?['quoteId'] ?? "0";
    offerPrice.value = Utlis().getNumberFormat(response?['offerPrice'] ?? "0", "#,###.##");
    // offerPriceQuantity.value = Utlis().getNumberFormat(response?['offerPrice_Quantity'] ?? "0", "#,########.##");

    return "error tto login";
  }

  String currentValue() {
    var price = double.parse(cryptoC.selectCrypto.value.value?.replaceAll(',', '.') ?? "0");
    var many = double.parse(amoutSelect.value);
    offerPriceQuantity.value = Utlis().getNumberFormat((many / price).toString(), "#,########.##");
    return offerPriceQuantity.value;
  }
}
