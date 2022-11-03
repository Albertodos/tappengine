import 'package:tappengine/helpers/utils.dart';

import '../../../../../dependencies/http/http.dart';
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
    description = json['description'].toString();
    icon = json['icon'].toString();
    dataUrl = json['dataUrl'].toString();
  }

  Future<PublicityCards> getListDataItem(url, context) async {
    var response = await HttpService.getService(url, context);

    var crypto = PublicityCards(
      publicity: Publicity.fromJson(response),
    );

    return crypto;
  }
}
