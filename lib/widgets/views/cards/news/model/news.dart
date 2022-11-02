import '../../../../../dependencies/http/http.dart';
import '../news.dart';

class News {
  String? id;
  String? title;
  String? body;
  String? publishedOn;
  String? categories;
  String? img;
  String? url;

  News({this.id, this.title, this.body, this.publishedOn, this.categories, this.img});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'].toString();
    body = json['body'].toString();
    publishedOn = json['published_on'].toString();
    categories = json['categories'].toString();
    url = json['url'].toString();
    img = json['imageUrl'].toString();
  }

  Future<List<NewsCards>> getListDataItem(url, context) async {
    var response = await HttpService.getMicroService(url, context);
    print(response);
    var crypto = List<NewsCards>.from(response['data']
        .map((e) => NewsCards(
              news: News.fromJson(e),
            ))
        .toList());
    return crypto;
  }
}
