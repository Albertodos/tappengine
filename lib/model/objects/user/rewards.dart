import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/model/objects/user/user.dart';

import '../../../constants/app_colors.dart';

class UserRewards extends User {
  Map<String, dynamic> toJsonUserRewards() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = {
      "leading": leading("assets/icons/rewards.svg"),
      "title": "Buy Bitcoin (BTC)",
      "subtitle": 'k27 July, 06:42 pm',
      "trailing": "+\$10",
      "root": ''
    };
    data['2'] = {
      "leading": leading("assets/icons/rewards.svg"),
      "title": "Buy Bitcoin (BTC)",
      "subtitle": 'k27 July, 06:42 pm',
      "trailing": "+\$10",
      "root": ''
    };
    data['3'] = {
      "leading": leading("assets/icons/rewards.svg"),
      "title": "Buy Bitcoin (BTC)",
      "subtitle": 'k27 July, 06:42 pm',
      "trailing": "+\$10",
      "root": ''
    };
    data['4'] = {
      "leading": leading("assets/icons/rewards.svg"),
      "title": "Buy Bitcoin (BTC)",
      "subtitle": 'k27 July, 06:42 pm',
      "trailing": "+\$10",
      "root": ''
    };
    data['5'] = {
      "leading": leading("assets/icons/rewards.svg"),
      "title": "Buy Bitcoin (BTC)",
      "subtitle": 'k27 July, 06:42 pm',
      "trailing": "+\$10",
      "root": ''
    };
    data['6'] = {
      "leading": leading("assets/icons/rewards.svg"),
      "title": "Buy Bitcoin (BTC)",
      "subtitle": 'k27 July, 06:42 pm',
      "trailing": "+\$10",
      "root": ''
    };

    return data;
  }

  Widget leading(icon) {
    return SizedBox(
      height: Get.height,
      child: GestureDetector(
        child: CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.purpura.withAlpha(25),
            child: ClipOval(
              child: SvgPicture.asset(icon, color: AppColors.purpura),
            )),
      ),
    );
  }
}
