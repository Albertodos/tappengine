import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/api_path.dart';
import '../../model/enum/enum.dart';

class HttpService {
  //static CustomAlertC customAlertC = Get.find();

  static Future statusError(request) async {
    try {
      final response = await request.timeout(const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('The connection has timed out , Please try again!');
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        return result;
      } else {
        return ErrorRequest.serverError;
      }
    } on SocketException {
      return ErrorRequest.internet;
    } on TimeoutException {
      return ErrorRequest.timeOut;
    } on Exception {
      return ErrorRequest.serverError;
    }
  }

  static Future getCMSService(url, context) async {
    var response = await statusError(http.get(Uri.parse(ApiPath.baseUrlCMS + url), headers: {
      // 'Authorization': 'Bearer ${globals.user.token}',
      // "Content-Type": "application/json",
      //
      // 'Content-type': 'text/plain',
    }));

    if (response.runtimeType == ErrorRequest) {
      // requestAlertError(context, response);

      return null;
    }
    return response;
  }

  static Future getService(url, context) async {
    var response = await statusError(http.get(Uri.parse(ApiPath.baseUrlMicro + url), headers: {
      // 'Authorization': 'Bearer ${globals.user.token}',
      // "Content-Type": "application/json",
      //
      // 'Content-type': 'text/plain',
    }));

    if (response.runtimeType == ErrorRequest) {
      // requestAlertError(context, response);

      return null;
    }
    return response;
  }

  static Future postMicroService(url, context) async {
    final response = await statusError(http.post(
      Uri.parse(ApiPath.baseUrlMicro + url),

      // body: jsonEncode(body),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${ApiPath.token}',
      },
    ));
    if (response.runtimeType == ErrorRequest) {
      // requestAlertError(context, response);

      return [];
    }
    return response;
  }

  static Future postBodyMicroService(url, body, context) async {
    final response = await statusError(http.post(
      Uri.parse(ApiPath.baseUrlMicro + url),
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
        "X-Tenant-Id": "master"
        // 'Authorization': 'Bearer ${ApiPath.token}',
      },
    ));
    if (response.runtimeType == ErrorRequest) {
      // requestAlertError(context, response);

      return [];
    }
    return response;
  }

  static Future getMicroService(url, context) async {
    var response = await statusError(http.get(Uri.parse(ApiPath.baseUrlMicro + url), headers: {
      'Authorization': 'Bearer ${ApiPath.token}',
      // "Content-Type": "application/json",
      //
      // 'Content-type': 'text/plain',
    }));

    if (response.runtimeType == ErrorRequest) {
      // requestAlertError(context, response);

      return [];
    }
    return response;
  }

  static Future putService(Map<String, dynamic> body, url) async {
    final response = await http.put(Uri.parse(ApiPath.baseUrl + url), headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode;
    }
  }

  static Future postService(Map<String, dynamic> body, url, context) async {
    final response = await statusError(http.post(
      Uri.parse(ApiPath.baseUrl + url),
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
      },
    ));

    return response;
  }

  static Future deleteService(Map<String, dynamic> body, action) async {
    final response = await statusError(
        http.delete(Uri.parse("${ApiPath.baseUrl}user/delete"), headers: {"Content-Type": "application/json"}, body: jsonEncode(body)));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode;
    }
  }

  static Future uploadImageService(myId, File foto) async {
    final request = http.MultipartRequest('POST', Uri.parse("${ApiPath.baseUrl}profile/upload"));
    request.files.add(await http.MultipartFile.fromPath('foto', foto.path));
    request.fields['user_id'] = myId;

    var res = await request.send();
    return res;
  }

  static requestAlertError(BuildContext context, ErrorRequest errorRequest) async {
    switch (errorRequest) {
      case ErrorRequest.timeOut:
        Get.snackbar("Tapp Engine", "The connection has timed out, Please try again!");
        break;
      case ErrorRequest.internet:
        Get.snackbar("Tapp Engine", "No internet connection");
        break;
      case ErrorRequest.serverError:
        Get.snackbar("Tapp Engine", "Oops, unexpected error! Try again");
        break;
    }
  }
}
