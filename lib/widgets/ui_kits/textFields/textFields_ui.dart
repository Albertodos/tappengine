// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class UITextFields extends StatelessWidget {
  final String text;
  final String? cname;
  final Color color;
  final int maxLines;
  final void Function()? cb;
  final void Function(String, String)? cbChenge;
  final bool? textImput;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool passwordVisible;
  final bool enable;
  final TextInputType type;
  final TextEditingController? inputText = TextEditingController();
  var textSelect = false.obs;
  UITextFields(
      {super.key,
      this.maxLines = 1,
      this.type = TextInputType.emailAddress,
      this.enable = true,
      required this.text,
      this.color = AppColors.blue,
      this.cb,
      this.textImput = false,
      this.cbChenge,
      this.cname,
      this.suffixIcon,
      this.prefixIcon,
      this.passwordVisible = true});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            boxShadow: textSelect.value
                ? [
                    BoxShadow(blurRadius: 13, offset: const Offset(3, 3), color: AppColors.blue.withOpacity(0.33)),
                  ]
                : [],
            borderRadius: BorderRadius.circular(
              7.0,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(
                7.0,
              ),
            ),
            child: Focus(
              onFocusChange: (focus) {
                if (focus) {
                  textSelect.value = true;
                } else {
                  textSelect.value = false;
                }
              },
              child: TextField(
                // expands: true,
                maxLines: maxLines,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: type,
                onTap: () {
                  textSelect.value = true;
                },
                onSubmitted: (v) {
                  textSelect.value = false;
                },
                onEditingComplete: () {
                  textSelect.value = false;
                },
                onTapOutside: (v) {
                  textSelect.value = false;
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },

                controller: inputText,
                obscureText: !passwordVisible,
                onChanged: (text) {
                  cbChenge!(text, cname!);
                },
                enabled: enable,
                cursorColor: Colors.black26,
                style: TextStyle(
                  color: color,
                  fontFamily: 'Jaldi',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.gray1, width: 1),
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.gray1, width: 1.0),
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.blue, width: 1),
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                  ),

                  contentPadding: const EdgeInsets.only(left: 14),
                  // labelText: text,
                  hintText: text,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  alignLabelWithHint: false,
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                    fontFamily: 'Jaldi',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
