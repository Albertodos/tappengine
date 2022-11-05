import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../sheetview.dart';
import '../../../helpers/globals.dart' as globals;

class PaymentMethodSheet extends SheetView {
  final positionMethod = 0.obs;
  var repeatsDate = ['Daily', 'Weekly', 'Monthly'];

  var moreAdd = ['Add money', 'Statements', 'Reports'];
  var debitList = ["Debit Card", 'Bank Account'];
  var selectMoreAdd = "Add money".obs;
  var seleteRepeatsDate = 'Weekly'.obs;

  void choosePaymentMethod(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Choose Payment Method", globals.hometabContext),
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
                          Obx(() => view01((positionMethod.value == index)
                              ? AppColors.purpura
                              : AppColors.white)),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: AppColors.gray3,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Row(
                      children: const[
                        Icon(Icons.add_circle, color: AppColors.purpura,),
                         SizedBox(width: 16),
                        Expanded(child: UILabels(
                          text: "Add Another Option",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                          Navigator.pop(globals.hometabContext);
                        })),
              ],
            ),
          );
        }).whenComplete(() {
      Navigator.pushNamed(
        context,
        "/comfirmOrder",
      );
    });
  }

  void anotherPaymentMethod(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Add Another Payment Options", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: debitList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        positionMethod.value = index;
                      },
                      child: Column(
                        children: [
                          Obx(() => view07((positionMethod.value == index)
                              ? AppColors.purpura
                              : AppColors.white, debitList[index])),
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
        }).whenComplete(() {
     //TODO
    });
  }

  void paymentMethod(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Payment Method", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: debitList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        positionMethod.value = index;
                      },
                      child: Column(
                        children: [
                          Obx(() => view06((positionMethod.value == index)
                              ? AppColors.purpura
                              : AppColors.white, debitList[index])),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Container(
                    width: Get.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: AppColors.gray3,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Row(
                        children: const[
                          Icon(Icons.add_circle, color: AppColors.purpura,),
                          SizedBox(width: 16),
                          Expanded(child: UILabels(
                            text: "Add Another Option",
                            textLines: 1,
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    PaymentMethodSheet().anotherPaymentMethod(context);
                  },
                ),
              ],
            ),
          );
        }).whenComplete(() {
      Navigator.pushNamed(
        context,
        "/comfirmOrder",
      );
    });
  }

  void morePaymentMethod(context, Function(String) cb) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Choose Payment Method", globals.hometabContext),
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
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Obx(() => view04(
                              moreAdd[index] == selectMoreAdd.value
                                  ? AppColors.purpura
                                  : AppColors.white,
                              moreAdd[index])),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }).whenComplete(() {
      Navigator.pushNamed(context, '/addMoney');
    });
    ;
  }

  void deletePaymentMethod() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.gray1,
                  radius: 40,
                  child: Icon(Icons.delete_outlined, color: AppColors.purpura),
                ),
                const SizedBox(height: 16),
                const UILabels(
                  text: "Are you sure you want to delete card?",
                  textLines: 0,
                  color: AppColors.purpura,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                    height: 50,
                    //width: Get.width,
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'Yep, Delete',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList: const [],
                        cb: (v) {
                        })),
                const SizedBox(height: 16),
                const UILabels(
                  text: "Cancel, keep the card",
                  textLines: 0,
                  color: AppColors.purpura2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          );
        }).whenComplete(() {
      //TODO
    });
    ;
  }

  void repeats(context, Function(String) cb) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Repeats", globals.hometabContext),
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
                          Obx(() => view03(
                              repeatsDate[index] == seleteRepeatsDate.value
                                  ? AppColors.purpura
                                  : AppColors.white,
                              repeatsDate[index])),
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
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header("Successful", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                view02(title, subTitle, btn),
              ],
            ),
          );
        }).whenComplete(() {
      // Navigator.pushNamed(context, '/addMoney');
    });
  }

  void MoneyAdded(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Theme.of(globals.hometabContext).cardColor,
        context: globals.hometabContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (BuildContext bc) {
          return SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(
                  start: 30, end: 30, bottom: 30, top: 30),
              child: Wrap(children: [
                Column(children: [
                  header("Money Added", globals.hometabContext),
                  const SizedBox(height: 30),
                  const CircleAvatar(
                    backgroundColor: AppColors.green,
                    radius: 40,
                    child: Icon(Icons.done, color: AppColors.white, size: 40),
                  ),
                  const SizedBox(height: 10),
                  UILabels(
                      text:
                          "You've funded your USD invesment account with \$1000 ",
                      textLines: 0,
                      color: AppColors.purpura,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSize: 24)
                ])
              ]));
        });
  }
}
