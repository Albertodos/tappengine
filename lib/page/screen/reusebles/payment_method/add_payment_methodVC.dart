import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tappengine/page/screen/reusebles/payment_method/add_debit_cardVC.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../../widgets/views/reusebles/reusables.dart';

class AddPaymentMethodVC extends StatefulWidget {
  const AddPaymentMethodVC({Key? key}) : super(key: key);

  @override
  _AddPaymentMethodVCState createState() => _AddPaymentMethodVCState();
}

class _AddPaymentMethodVCState extends State<AddPaymentMethodVC> {

  var moreAdd = ['Debit Card', 'Bank Account'];
  var iconlist = ['assets/icons/bank.svg', 'assets/icons/sms.svg'];
  var selectMoreAdd = "Add money".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const ReusablesView().isBack(),
            Container(
              width: Get.width,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 44,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.purpura.withAlpha(25),
                    radius: 40,
                    child: SizedBox(
                      width: 32,
                      child: SvgPicture.asset(
                        'assets/icons/ic_coin.svg',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const UILabels(
                    text: "Add Payment Method",
                    textLines: 1,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.purpura,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: moreAdd.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          selectMoreAdd.value = moreAdd[index];
                          Get.to(AddDebitCardVC());
                        },
                        child: Column(
                          children: [
                            Obx(() => card(
                                moreAdd[index] == selectMoreAdd.value
                                    ? AppColors.purpura
                                    : AppColors.white,
                                moreAdd[index],
                              iconlist[index]
                            )),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget card(Color bg, title, icon) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16),),
        border: Border.all(color: AppColors.gray3),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(icon, color: bg == AppColors.purpura
                      ? AppColors.white
                      : AppColors.purpura),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: UILabels(
                    text: title,
                    textLines: 1,
                    color: bg == AppColors.purpura
                        ? AppColors.white
                        : AppColors.purpura,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                    Container(
                      //color: AppColors.white,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: AppColors.white,
                        border: Border.all(color: AppColors.purpura, width: 2)
                      ),
                      child: const  Icon(
                      Icons.add,
                      color:  AppColors.purpura,
                       size: 30,
                  ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
