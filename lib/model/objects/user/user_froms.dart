// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/model/objects/user/user.dart';
import '../../../constants/app_colors.dart';

class UserFroms extends User {
  final _passwordVisible = false.obs;

  Map<String, dynamic> froms(List<dynamic> keys) {
    final Map<String, dynamic> data = <String, dynamic>{};
    var nextFocus = true;
    for (var key in keys) {
      if (keys.indexOf(key) == keys.length - 1) {
        nextFocus = false;
      }
      if (key.runtimeType == String) {
        data[key] = [toJsonFroms(nextFocus)[key]].toList();
      } else {
        data[key.first + key.last] = key.map((e) => toJsonFroms(nextFocus)[e]).toList();
      }
    }
    return data;
  }

  Map<String, dynamic> toJsonFroms(nextFocus) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = {
      "value": "",
      "name": "Email and username",
      "key": 'email',
      "hintText": "Email",
      "keyboardType": TextInputType.emailAddress,
      "sufix": null,
      "prefix": null,
      "passVisible": null,
      "nextFocus": nextFocus
    };

    data['password'] = {
      "value": password ?? "",
      "key": 'password',
      "name": "Password",
      "hintText": "Password",
      "keyboardType": TextInputType.visiblePassword,
      "sufix": _seePassword(),
      "prefix": null,
      "passVisible": _passwordVisible.value,
      "nextFocus": nextFocus
    };
    data['name'] = {
      "value": username ?? "",
      "key": 'name',
      "name": "",
      "hintText": "Nome",
      "keyboardType": TextInputType.name,
      "sufix": null,
      "prefix": null,
      "passVisible": null,
      "nextFocus": nextFocus
    };
    data['phone'] = {
      "value": phone ?? "",
      "key": 'phone',
      "name": "",
      "hintText": "Assunto",
      "keyboardType": TextInputType.phone,
      "sufix": null,
      "prefix": null,
      "passVisible": null,
      "nextFocus": nextFocus
    };
    data['name'] = {
      "value": "",
      "name": "Full Name",
      "hintText": "Full Name",
      "keyboardType": TextInputType.phone,
      "sufix": null,
      "prefix": null,
      "passVisible": null,
      "nextFocus": nextFocus
    };
    data['coutryResidence'] = {
      "value": "",
      "name": "Crountry of Residence",
      "hintText": "Country of Residence",
      "keyboardType": TextInputType.name,
      "sufix": _dropDown(),
      "prefix": null,
      "passVisible": null,
      "nextFocus": nextFocus
    };
    data['coutry'] = {
      "value": "",
      "name": "Crountry",
      "hintText": "Country",
      "keyboardType": TextInputType.name,
      "sufix": _dropDown(),
      "prefix": preFixImage(),
      "passVisible": null,
      "nextFocus": nextFocus
    };
    data['citizenship'] = {
      "value": "",
      "name": "Citizenship",
      "hintText": "Citizenship",
      "keyboardType": TextInputType.name,
      "sufix": _dropDown(),
      "prefix": preFixImage(),
      "passVisible": null,
      "nextFocus": nextFocus
    };
    data['number'] = {
      "value": "",
      "name": "Phone Number",
      "hintText": "Phone Number",
      "keyboardType": TextInputType.number,
      "sufix": null,
      "prefix": preFixNumber(),
      "passVisible": null,
      "nextFocus": nextFocus
    };

    return data;
  }

  IconButton _seePassword() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        _passwordVisible.value ? Icons.visibility : Icons.visibility_off,
        color: AppColors.purpura.withAlpha(60),
      ),
      onPressed: () {
        // Update the state i.e. toogle the state of passwordVisible variable

        _passwordVisible.value = !_passwordVisible.value;
      },
    );
  }

  IconButton _dropDown() {
    return IconButton(
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.purpura.withAlpha(60),
      ),
      onPressed: () {},
    );
  }
}
