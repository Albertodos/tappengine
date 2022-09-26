import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/dropdown_ui/dropdown_ui.dart';
import 'package:tappengine/widgets/ui_kits/textFields/textFields_ui.dart';

class Dropdowns extends StatefulWidget {
  const Dropdowns({super.key});

  @override
  State<Dropdowns> createState() => _DropdownsState();
}

class _DropdownsState extends State<Dropdowns> {

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

              UIDropdown(cb: (value ) { expanded.value = value ; },),
              Obx(
                    ()=> SizedBox(
                  height: expanded.value == 0? 32:230,
                ),
              ),
              
              Container(
                width: Get.width,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
