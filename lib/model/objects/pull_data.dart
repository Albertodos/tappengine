import 'package:flutter/material.dart';

class PullData {
  String? title;
  dynamic data;
  String? more;
  dynamic type;
  Axis? position;

  PullData({
    this.data,
    this.more,
    this.type,
    this.title,
    this.position,
  });
}
