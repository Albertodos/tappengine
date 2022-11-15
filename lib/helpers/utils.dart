// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tappengine/constants/api_path.dart';
import 'package:intl/intl.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'globals.dart' as globals;

class Utlis {
  DateTime getDataTime(String data) {
    var dateTime = DateTime.parse(data);

    return dateTime;
  }

  Widget selectStar(position) {
    return position == false
        ? SvgPicture.asset(
            'assets/icons/ic_star.svg',
            fit: BoxFit.cover,
          )
        : SvgPicture.asset(
            'assets/icons/ic_star_fill.svg',
            fit: BoxFit.cover,
          );
  }

  String getCryptoImage(name, url) {
    for (var item in globals.cryptoImage) {
      if (item.symbol == name) {
        return ApiPath.baseUrlImgCMS + item.icon.toString();
      }
    }
    return url;
  }

  String getBalanceImage(name, url) {
    for (var item in globals.balanceImage) {
      print(item.symbol);
      print(name);
      print(item.icon);
      if (item.symbol == name) {
        return ApiPath.baseUrlImgCMS + item.icon.toString();
      }
    }
    return url;
  }

  String getBaseUrl(url) {
    return url.substring(0, 4) == 'http' ? url : (ApiPath.baseUrl + url);
  }

  String getNumberFormat(value, valueFormat) {
    final format = NumberFormat(valueFormat.toString(), "en");

    var isNumber = num.tryParse(value.toString()) != null ? num.parse(value.toString()) : 000;
    return format.format(isNumber).toString();
  }

  dynamic getPercent(value) {
    var color = num.parse(value.toString()).isNegative ? AppColors.purpura1 : AppColors.green;
    var arrow = num.parse(value.toString()).isNegative
        ? const Icon(Icons.keyboard_arrow_down, color: AppColors.purpura1)
        : const Icon(Icons.keyboard_arrow_up, color: AppColors.green);
    return [color, arrow];
  }
}
