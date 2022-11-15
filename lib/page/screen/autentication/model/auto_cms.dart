import '../../../../dependencies/http/http.dart';

class AutenticationCMS {
  String? id;
  Attributes? attributes;

  AutenticationCMS({this.id, this.attributes});

  AutenticationCMS.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }

  Future<List<AutenticationCMS>> getListDataItem(url, context) async {
    var response = await HttpService.getCMSService(url, context);
    var mobileScren = List<AutenticationCMS>.from(response['data'].map((e) => AutenticationCMS.fromJson(e)).toList());

    return mobileScren;
  }
}

class Attributes {
  String? title;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  List<MobileContent>? mobileContent;

  Attributes({this.title, this.createdAt, this.updatedAt, this.publishedAt, this.mobileContent});

  Attributes.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    publishedAt = json['publishedAt'] ?? "";
    if (json['mobileContent'] != null) {
      mobileContent = List<MobileContent>.from(json['mobileContent'].map((e) => MobileContent.fromJson(e)).toList());
    }
  }
}

class MobileContent {
  String? id;
  String? title;
  String? content;
  String? subtitle;
  List<String>? imageContent;

  MobileContent({this.id, this.title, this.content, this.subtitle, this.imageContent});

  MobileContent.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['Title'].toString();
    content = json['content'].toString();
    subtitle = json['subtitle'].toString();

    if (json['imageContent']['data'] != null) {
      imageContent = List<String>.from(json['imageContent']['data'].map((e) => e['attributes']['url']).toList());
    }
  }
}
