import 'package:flutter/material.dart';
import 'package:tappengine/helpers/utils.dart';

import '../../../../../dependencies/http/http.dart';
import '../../../alert/alerts.dart';
import '../publicity.dart';

class Publicity {
  String? id;
  String? name;
  String? description;
  String? icon;
  String? dataUrl;

  Publicity({this.id, this.name, this.description, this.icon, this.dataUrl});

  Publicity.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    description = json['subtitle'].toString();
    icon = json['image']?['data']?['attributes']?['url'].toString();
    dataUrl = json['dataUrl'].toString();
  }

  Future<List<Widget>> getListDataItem(url, context) async {
    var response = await HttpService.getCMSService(url, context);

    var pub = <Widget>[];
    if (response.isNotEmpty) {
      pub = [
        PublicityCards(
          publicity: Publicity.fromJson(response['data']['attributes']),
        )
      ];
    } else {
      pub = [AlertsCards().tryAgain((p0) => getListDataItem(url, context))];
    }

    return pub;
  }
}
