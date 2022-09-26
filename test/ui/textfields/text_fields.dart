import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/dropdown_ui/dropdown_ui.dart';
import 'package:tappengine/widgets/ui_kits/textFields/textFields_ui.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {

  var expanded = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children:  [
              const SizedBox(
                height: 68,
              ),
              UITextFields(text: "Normal Input",cname: "Email",cbChenge: (v,k){},),
              const SizedBox(
                height: 32,
              ),
              UITextFields(text: "Normal Input",cname: "pass",cbChenge: (v,k){},),
              const SizedBox(
                height: 32,
              ),
              UIDropdown(cb: (value ) { expanded.value = value ; },),
              Obx(
                ()=> SizedBox(
                  height: expanded.value == 0? 32:230,
                ),
              ),
              UITextFields(text: "Normal Input",cname: "pass",cbChenge: (v,k){},),
              const SizedBox(
                height: 32,
              ),
              UITextFields(text: "Normal Input",cname: "pass",cbChenge: (v,k){},),
            ],
          ),
        ),
      ),
    );
  }
}
