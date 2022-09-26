import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/model/objects/user/user.dart';
import '../../../helpers/globals.dart' as globals;
import '../../../constants/app_colors.dart';
import 'controller/user_personalC.dart';

class UserPersonal extends User {
  Map<String, dynamic> toJsonUserPersonal() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = {
      "leading": leading("assets/icons/call.svg"),
      "title": "Phone",
      "subtitle": phone ?? 'kinkas',
      "trailing": trailingArrowRight(),
      "color": AppColors.black
    };
    data['emial'] = {
      "leading": leading("assets/icons/sms.svg"),
      "title": "Email",
      "subtitle": email ?? '',
      "trailing": trailingArrowRight(),
      "color": AppColors.black
    };
    data['address'] = {
      "leading": leading("assets/icons/location.svg"),
      "title": "Address",
      "subtitle": andress ?? '',
      "trailing": trailingArrowRight(),
      "color": AppColors.black
    };
    data['notification'] = {
      "leading": leading("assets/icons/notification.svg"),
      "title": "Notification Settings",
      "subtitle": 'Last Update 09/16/2022',
      "trailing": trailingArrowRight(),
      "color": AppColors.black
    };
    data['moon'] = {
      "leading": leading("assets/icons/security-user.svg"),
      "title": "Identity Verification Status",
      "subtitle": (identityStatus ?? false) == true ? "Verified" : "Nao Verificada",
      "trailing": trailingArrowRight(),
      "color": (identityStatus ?? false) == true ? AppColors.green : AppColors.red
    };
    data['bank'] = {
      "leading": leading("assets/icons/bank.svg"),
      "title": "Bank Account Status",
      "subtitle": (bankStatus ?? false) == true ? "Verified" : "Nao Verificada",
      "trailing": trailingArrowRight(),
      "color": (bankStatus ?? false) == true ? AppColors.green : AppColors.red
    };

    data['themeMode'] = {
      "leading": leading("assets/icons/moon.svg"),
      "title": themaMode.toString(),
      "subtitle": (themaMode ?? false) == true ? "Light" : "Dark",
      "trailing": globals.userPersonal.switchBotton(),
      "color": AppColors.black
    };
    data['help'] = {
      "leading": leading("assets/icons/lifebuoy.svg"),
      "title": "Help",
      "subtitle": 'FAQs',
      "trailing": trailingArrowRight(),
      "color": AppColors.black
    };

    return data;
  }

  Map<String, dynamic> toJsonInfo() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userInfo'] = {
      "name": username ?? "",
    };
    return data;
  }

  Widget leading(icon) {
    return SizedBox(
      height: Get.height,
      child: GestureDetector(
        child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.purpura.withAlpha(25),
            child: ClipOval(
              child: SvgPicture.asset(icon, color: AppColors.purpura),
            )),
      ),
    );
  }

  Widget trailingArrowRight() {
    return SizedBox(height: Get.height, child: SvgPicture.asset("assets/icons/arrow-right.svg", color: AppColors.purpura));
  }

  Widget switchBotton() {
    return CupertinoSwitch(
      value: globals.userPersonal.userPersonal.value.themaMode ?? false,
      activeColor: AppColors.purpura,
      onChanged: (value) {
        globals.userPersonal.userPersonal.value.themaMode = value;
        globals.userPersonal.userPersonal.value.bankStatus = value;
        globals.userPersonal.userPersonal.value = globals.userPersonal.userPersonal.value;
      },
    );
  }
}
