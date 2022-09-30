import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/sheet/payment_method_view.dart';

import '../../constants/app_colors.dart';
import '../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../widgets/ui_kits/labels_ui/label_ui.dart';

class PaymentMethodSheet extends PaymenteMethodView {
  final positionMethod = 0.obs;
  var repeatsDate = ['Daily', 'Weekly', 'Monthly'];
  var moreAdd = ['Add money', 'Statements', 'Reports'];
  var selectMoreAdd = "Add money".obs;
  var seleteRepeatsDate = 'Weekly'.obs;

  void choosePaymentMethod(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(context).cardColor,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Choose Payment Method", context),
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
                          Obx(() => view01((positionMethod.value == index) ? AppColors.purpura : AppColors.white)),
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
                SizedBox(
                    height: 50,
                    width: Get.width,
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'Select payment method',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList: const [],
                        cb: (v) {
                          Navigator.pushNamed(
                            context,
                            "/comfirmOrder",
                          );
                        })),
              ],
            ),
          );
        });
  }

  void morePaymentMethod(context, Function(String) cb) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(context).cardColor,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Choose Payment Method", context),
                const SizedBox(
                  height: 64,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: repeatsDate.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        selectMoreAdd.value = moreAdd[index];
                        cb(selectMoreAdd.value);

                        Navigator.pushNamed(context, '/addMoney');
                      },
                      child: Column(
                        children: [
                          Obx(() => view04(moreAdd[index] == selectMoreAdd.value ? AppColors.purpura : AppColors.white, moreAdd[index])),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  void repeats(context, Function(String) cb) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(context).cardColor,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Repeats", context),
                const SizedBox(
                  height: 64,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: repeatsDate.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        seleteRepeatsDate.value = repeatsDate[index];
                        cb(seleteRepeatsDate.value);
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Obx(() => view03(repeatsDate[index] == seleteRepeatsDate.value ? AppColors.purpura : AppColors.white, repeatsDate[index])),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  void successful(context, title, subTitle, Widget btn) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(context).cardColor,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Successful", context),
                const SizedBox(
                  height: 64,
                ),
                view02(title, subTitle, btn),
              ],
            ),
          );
        });
  }
}
