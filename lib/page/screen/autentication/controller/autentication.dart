import 'package:tappengine/widgets/views/cards/cms/model/cms.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../../dependencies/http/http.dart';
import '../../../../model/objects/user/user.dart';

class Autentication extends User {
  Future login(context, String name) async {
    var response = await HttpService.getService("1hSxe1Xy9ioZU3usI_b7lCxk31MG_x7Hc", context);

    if (response is Map<String, dynamic>) {
      for (var item in response['user']) {
        if (item['email'] == name) {
          getUser(item);
          return item;
        }
      }
      return "User Is not existe";
    }
    return "error tto login";
  }

  getUser(user) {
    username = user['name'];
    email = user['email'];
    phone = user['phone'];
    andress = user['andress'];
    image = user['image'];
  }

  getCryptoImage(context) {
    CryptoImage().getListDataItem("crypto-icons?populate%5B0%5D=icon", context).then((value) {
      globals.cryptoImage = value;
    });
  }
}
