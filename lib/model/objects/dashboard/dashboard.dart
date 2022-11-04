class DashboardModel {
  DateTime? x;
  double? y;
  DashboardModel({this.x, this.y});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    x = getDataTime(json['x']);
    y =  double.parse(json['y']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }

  static DateTime getDataTime(String data) {

    var dateTime = DateTime.parse(data);
    print(data);
    print(data);
    print(dateTime.toString());
    print(dateTime.toString());



    return dateTime;

  }
}