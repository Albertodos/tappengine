import 'package:tappengine/helpers/utils.dart';
import 'package:tappengine/widgets/views/cards/cms/cms.dart';

import '../../../../../dependencies/http/http.dart';

class CMS {
  String? id;
  String? textContent;
  String? title;
  bool? hasEmbebedLink;
  String? link;
  ImageContent? imageContent;

  CMS({this.id, this.textContent, this.title, this.hasEmbebedLink, this.link, this.imageContent});

  CMS.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    textContent = json['textContent'];
    title = json['title'];
    hasEmbebedLink = json['hasEmbebedLink'];
    link = json['link'];
    // imageContent = json['imageContent'] != null
    //     ? ImageContent.fromJson(json['imageContent'])
    //     : null;
  }
  Future<List<CMSCards>> getListDataItem(url, context) async {
    print(url);
    var response = await HttpService.getCMSService(url, context);
    var crypto = List<CMSCards>.from(response['data']['attributes']['insights']
        .map((e) => CMSCards(
              cms: CMS.fromJson(e),
            ))
        .toList());

    return crypto;
  }
}

class CryptoImage {
  String? icon;
  String? symbol;

  CryptoImage({
    this.icon,
    this.symbol,
  });

  CryptoImage.fromJson(Map<String, dynamic> json) {
    symbol = json['attributes']?['symbol'] ?? json['attributes']?['name'] ?? "";
    icon = json['attributes']['icon']['data']['attributes']['url'];
  }

  Future<List<CryptoImage>> getListDataItem(url, context) async {
    var response = await HttpService.getCMSService(url, context);
    var crypto = List<CryptoImage>.from(response['data'].map((e) => CryptoImage.fromJson(e)).toList());

    return crypto;
  }
}

class ImageContent {
  String? data;

  ImageContent({this.data});

  ImageContent.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }
}
