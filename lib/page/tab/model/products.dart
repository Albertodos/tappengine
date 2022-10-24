class Products {
  String? id;
  String? name;
  String? icon;
  String? dataUrl;

  Products({
    this.id,
    this.name,
    this.icon,
    this.dataUrl,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    icon = json['icon'].toString();
    dataUrl = json['dataUrl'].toString();
  }
}
