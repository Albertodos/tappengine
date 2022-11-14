// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../../constants/app_colors.dart';

class User {
  String? id;
  String? username;
  String? email;
  String? code;
  String? phone;
  String? andress;
  String? image;
  String? emailVerified;
  String? token;
  String? refreshToken;
  String? tokenType;
  String? password;
  bool? notification;
  bool? identityStatus;
  bool? bankStatus;
  bool? themaMode;

  var _passwordVisible = false;

  User({this.id, this.username, this.email, this.code, this.image, this.emailVerified, this.token, this.refreshToken, this.tokenType});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'].toString();
    refreshToken = json['refreshToken'].toString();
    tokenType = json['tokenType'].toString();
    decodeToken(token ?? "");
  }
  decodeToken(String token) {
    Map<String, dynamic> payload = Jwt.parseJwt(token);

    id = payload['sub'].toString();
    username = payload["name"].toString();
    email = payload["email"].toString();
    // code = payload["data"]['business_id'].toString();
    // image = payload["data"]['foto'].toString();
    emailVerified = payload["email_verified"].toString();
  }

  Map<String, dynamic> toJsonStatements() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startData'] = {
      "value": "",
      "name": "Start date",
      "hintText": "Seloect",
      "keyboardType": TextInputType.emailAddress,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['endDate'] = {
      "value": "",
      "name": "End date",
      "hintText": "Select",
      "keyboardType": TextInputType.visiblePassword,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    return data;
  }

  Map<String, dynamic> toJsonEditProfile() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = {"value": "", "name": "First Name", "hintText": "First Name", "keyboardType": TextInputType.text, "sufix": null};
    data['lastName'] = {"value": "", "name": "Last Name", "hintText": "Last Name", "keyboardType": TextInputType.text, "sufix": null};
    return data;
  }

  Map<String, dynamic> toJsonEditPhoneNumber() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = {
      "value": "",
      "name": "Phone Number",
      "hintText": "Phone Number",
      "keyboardType": TextInputType.number,
      "sufix": null,
      "prefix": preFixNumber()
    };
    return data;
  }

  Map<String, dynamic> toJsonEditEmail() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emailAddress'] = {
      "value": "",
      "name": "Email Address",
      "hintText": "Email Addresss",
      "keyboardType": TextInputType.emailAddress,
      "sufix": null
    };
    return data;
  }

  Map<String, dynamic> toJsonStatementPDF() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startDate'] = {
      "value": "",
      "name": "Start date",
      "hintText": "Select",
      "keyboardType": TextInputType.text,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['endDate'] = {
      "value": "",
      "name": "End date",
      "hintText": "Select",
      "keyboardType": TextInputType.text,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    return data;
  }

  Map<String, dynamic> toJsonEditAddresss() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['streetAddress'] = {"value": "", "name": "Street Address", "hintText": "Street Address", "keyboardType": TextInputType.text, "sufix": null};
    data['aptSuit'] = {"value": "", "name": "Apt, Suit, etc", "hintText": "Enter Apt, Suit, etc", "keyboardType": TextInputType.text, "sufix": null};
    data['city'] = {"value": "", "name": "City", "hintText": "Texas", "keyboardType": TextInputType.text, "sufix": null};
    data['country'] = {
      "value": "",
      "name": "Country",
      "hintText": "USA",
      "keyboardType": TextInputType.text,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['zipCode'] = {"value": "", "name": "Zip Code", "hintText": "99950", "keyboardType": TextInputType.number, "sufix": null};
    return data;
  }

  Map<String, dynamic> toJsonVerifyNumber() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = {
      "value": "",
      "name": "Country",
      "hintText": "United States",
      "keyboardType": TextInputType.emailAddress,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
      "prefix": preFixImage()
    };
    data['number'] = {
      "value": "",
      "name": "Phone Number",
      "hintText": "Phone Number",
      "keyboardType": TextInputType.visiblePassword,
      "sufix": null,
      "prefix": preFixNumber()
    };
    return data;
  }

  Map<String, dynamic> toJsonVerifyIdentity() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = {"value": "", "name": "Full Name", "hintText": "Full Name", "keyboardType": TextInputType.name, "sufix": null};
    data['data'] = {"value": "", "name": "Birthday", "hintText": "DD/MM/YYYY", "keyboardType": TextInputType.datetime, "sufix": null};
    data['address1'] = {
      "value": "",
      "name": "Address line 1",
      "hintText": "Address line 1",
      "keyboardType": TextInputType.streetAddress,
      "sufix": null
    };
    data['address2'] = {
      "value": "",
      "name": "Address line 2",
      "hintText": "Address line 2",
      "keyboardType": TextInputType.streetAddress,
      "sufix": null
    };

    data['country'] = {
      "value": "",
      "name": "Texas",
      "hintText": "Texas",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    return data;
  }

  Map<String, dynamic> toJsonVerifyIdentityBusiness() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['willUse'] = {
      "value": "",
      "name": "What will you use",
      "hintText": "Select",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['sourceOfFunds'] = {
      "value": "",
      "name": "What is your source of funds?",
      "hintText": "Select",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['otherDetails'] = {
      "value": "",
      "name": "Other Details",
      "hintText": "Select",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };

    data['LastSSN'] = {
      "value": "",
      "name": "Last 4 Digits of SSN",
      "hintText": "Select",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    return data;
  }

  Map<String, dynamic> toJsonVerifyIdentity2() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question1'] = {
      "value": "",
      "name": "",
      "hintText": "What will you use Tappengine for?",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['question2'] = {
      "value": "",
      "name": "",
      "hintText": "What is your source of funds?",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['question'] = {
      "value": "",
      "name": "",
      "hintText": "Employment status",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['lastDigits'] = {"value": "", "name": "", "hintText": "Last 4 digits of SSN", "keyboardType": TextInputType.name, "sufix": null};

    return data;
  }

  Map<String, dynamic> toJsonVerifyIdentity3() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question1'] = {
      "value": "",
      "name": "",
      "hintText": "How much crypto do you expect to...",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };
    data['question2'] = {
      "value": "",
      "name": "",
      "hintText": "What industry do you work in?",
      "keyboardType": TextInputType.name,
      "sufix": IconButton(
        icon: const Icon(Icons.arrow_drop_down),
        onPressed: () {},
      ),
    };

    return data;
  }

  IconButton _seePassword() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        _passwordVisible ? Icons.visibility : Icons.visibility_off,
        color: AppColors.blue.withAlpha(60),
      ),
      onPressed: () {
        // Update the state i.e. toogle the state of passwordVisible variable
        // setState(() {
        //   _passwordVisible = !_passwordVisible;
        // });
      },
    );
  }

  Widget preFixNumber() {
    return Container(
      height: 50,
      width: 70,
      alignment: Alignment.center,
      child: Row(
        children: [
          const Expanded(
            child: UILabels(
              text: "+1",
              textLines: 1,
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 50,
            width: 1,
            color: AppColors.gray1,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  Widget preFixImage() {
    return Container(
      height: 50,
      width: 70,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 30,
              width: 30,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
