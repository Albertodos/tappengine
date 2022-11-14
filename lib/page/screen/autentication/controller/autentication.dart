import 'package:get/get.dart';
import 'package:tappengine/widgets/views/cards/cms/model/cms.dart';
import '../../../../dependencies/shared_preference/interface_shared_preference.dart';
import '../../../../dependencies/shared_preference/shared_preference_service.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../../dependencies/http/http.dart';
import '../../../../model/objects/user/user.dart';

class Autentication extends User {
  ILocalStorage localStorage = PrefsLocalStorageService();
  final _user = User().obs;

  Future login(context, body) async {
    var response = await HttpService.postBodyMicroService("v2/auth/authenticate", body, context);

    if (response is Map<String, dynamic>) {
      _user.value = User.fromJson(response);

      await setUser(_user.value).then((value) {
        return "User Is not existe";
      });
    }
    return "error tto login";
  }

  Future setUser(User user) async {
    await localStorage.put("token", user.token);
    await localStorage.put("refresh", user.refreshToken);

    return "dataSave";
  }

  getCryptoImage(context) {
    CryptoImage().getListDataItem("crypto-icons?populate%5B0%5D=icon", context).then((value) {
      globals.cryptoImage = value;
    });
  }

  getBalanceImage(context) {
    CryptoImage().getListDataItem("balance-icons?populate[0]=icon", context).then((value) {
      globals.balanceImage = value;
    });
  }
}
