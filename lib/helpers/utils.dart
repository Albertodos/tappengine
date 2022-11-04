import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tappengine/constants/api_path.dart';
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

  String getBaseUrl(url) {
    return url.substring(0, 4) == 'http' ? url : (ApiPath.baseUrl + url);
  }
}
