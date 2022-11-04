library globals;

import 'package:get/get.dart';

import '../model/objects/user/controller/user_personalC.dart';
import '../widgets/views/cards/cms/model/cms.dart';

final UserPersonalC userPersonal = Get.put(UserPersonalC());
List<CryptoImage> cryptoImage = <CryptoImage>[];

String rootName = "";
dynamic hometabContext;
