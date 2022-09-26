import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../user_personal.dart';

class UserPersonalC extends GetxController {
  final userPersonal = UserPersonal().obs;

  var switchStatus = false.obs;

  Future chamgeUser() async {
    userPersonal.value.email = "Alberto@gmail.com";
    userPersonal.value.phone = "+238 - 9117673";
    userPersonal.value.andress = 'Praia, Cabo Verde';
    userPersonal.value.username = 'Alberto Dos Santos';
    userPersonal.value.identityStatus = true;
    userPersonal.value.bankStatus = false;
    userPersonal.value.notification = true;
    userPersonal.value.themaMode = false;
    userPersonal.value = userPersonal.value;
  }

  chegeThema(value) {
    userPersonal.value.themaMode = value;
    userPersonal.value = userPersonal.value;
  }

  Widget switchBotton() {
    return CupertinoSwitch(
      value: switchStatus.value,
      activeColor: AppColors.purpura,
      onChanged: (value) {
        chamgeUser();
        switchStatus.value = value;
        userPersonal.value.themaMode = value;
        userPersonal.value = userPersonal.value;
      },
    );
  }
}
