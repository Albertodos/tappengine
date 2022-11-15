library globals;

import 'package:get/get.dart';

import '../model/objects/user/controller/user_personalC.dart';
import '../page/screen/autentication/model/auto_cms.dart';
import '../widgets/views/cards/cms/model/cms.dart';

final UserPersonalC userPersonal = Get.put(UserPersonalC());
List<CryptoImage> cryptoImage = <CryptoImage>[];
List<CryptoImage> balanceImage = <CryptoImage>[];
List<AutenticationCMS> autenticationCMS = <AutenticationCMS>[];

String rootName = "";
dynamic hometabContext;
