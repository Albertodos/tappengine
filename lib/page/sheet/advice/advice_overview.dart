import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tappengine/page/sheet/sheetview.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../helpers/globals.dart' as globals;

class AdviceOverview extends SheetView{

  final positionMethod = 0.obs;

  void adviceOverview(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header("Choose options", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                const UILabels(
                  text: "Manage Invesment",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 64,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        positionMethod.value = index;
                      },
                      child: Column(
                        children: [
                          Obx(() => view05((positionMethod.value == index) ? AppColors.purpura : AppColors.white, "Invest")),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        }).whenComplete(() {
      // Navigator.pushNamed(
      //   context,
      //   "/comfirmOrder",
      // );
    });
  }
}