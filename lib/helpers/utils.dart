import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
}
