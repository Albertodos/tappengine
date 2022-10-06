import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../rewards.dart';
import '../user_personal.dart';

class UserPersonalC extends GetxController {
  final userPersonal = UserPersonal().obs;
  final userRewards = UserRewards().obs;

  var switchStatus = false.obs;

  Future changeUser() async {
    userPersonal.value.email = "maite.medina@gmail.com";
    userPersonal.value.phone = "+238 - 9156787";
    userPersonal.value.andress = 'Praia, Cabo Verde';
    userPersonal.value.username = 'Maite Medina';
    userPersonal.value.identityStatus = true;
    userPersonal.value.bankStatus = true;
    userPersonal.value.notification = true;
    userPersonal.value.themaMode = false;
    userPersonal.value = userPersonal.value;
  }

  chengeThema(value) {
    userPersonal.value.themaMode = value;
    userPersonal.value = userPersonal.value;
  }

  Widget switchBotton() {
    return CupertinoSwitch(
      value: switchStatus.value,
      activeColor: AppColors.purpura,
      onChanged: (value) {
        switchStatus.value = value;
        userPersonal.value.themaMode = value;
        userPersonal.value = userPersonal.value;
      },
    );
  }
}
