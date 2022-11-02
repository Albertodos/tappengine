import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/sheet/sheetview.dart';
import '../../../constants/app_colors.dart';
import '../../../helpers/globals.dart' as globals;
import '../../../model/objects/user/user.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';

class WebView extends SheetView {
  var userLogin = User();

  void linkYourBank(context, value, link) {
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
              children: [
                header(value, globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.purpura4),
                ),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text: 'Bank Account',
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 8),
                const UILabels(
                  text: 'Invest large amounts',
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const UILabels(
                  text: 'Your identify is being verified. We will email you once your verification has completed.',
                  textLines: 2,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const UILabels(
                  text: 'Recommended',
                  textLines: 2,
                  color: AppColors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                const UILabels(
                  text: 'Watch Video for Buy/Cell Crypto',
                  textLines: 2,
                  color: AppColors.purpura,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  width: Get.width,
                  child: UIBottons(
                      labels: const UILabels(
                        text: 'Next',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      colorList: const [],
                      cb: (v) {
                        // FoundPlaid().plaid(context);
                      }),
                )
              ],
            ),
          );
        }).whenComplete(() {
      ;
    });
  }
}
