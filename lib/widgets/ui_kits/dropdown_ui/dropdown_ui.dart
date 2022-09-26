
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constants/app_colors.dart';
import '../labels_ui/label_ui.dart';
import '../textFields/textFields_ui.dart';

class UIDropdown extends StatelessWidget {
  final void Function(int) cb;

  const UIDropdown({
    super.key,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return _buildAppBar();
  }

  _buildAppBar() {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
      color: AppColors.blue.withOpacity(0),
      elevation: 0,
      enableFeedback: true,
      onOpened: () {
        cb(1);
      },
      onCanceled: () {
        cb(0);
      },
      constraints: BoxConstraints.expand(width: Get.width,height: 300),
      offset: const Offset(0.0, 50.0),
      itemBuilder: (ctx) => [
        _buildPopupMenuItem('', "Minha Conta", 3),
      ],
      child: Container(
        // height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: AppColors.gray),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            7.0,
          ),
        ),
        child: UITextFields(text: "Dropdown",cname: "Email",cbChenge: (v,k){},enable: false,suffixIcon: const IconButton(onPressed: null, icon: Icon(Icons.arrow_drop_down_rounded)),),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, String iconData, value) {
    return PopupMenuItem(
      // value: position,
      onTap: () {

      },
      

      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 0),
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: outTranparentMenu(title, iconData, AppColors.green),
    );
  }

  Widget outTranparentMenu(icon, value, color) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray,
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 35), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: UILabels.extraBold(
                text: value,
                textLines: 0,
                color: color,
              )),
        ],
      ),
    );
  }
}