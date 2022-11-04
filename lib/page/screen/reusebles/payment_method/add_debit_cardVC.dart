import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/app_colors.dart';
import '../../../../helpers/cliper.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../../widgets/ui_kits/textFields/textFields_ui.dart';

class AddDebitCardVC extends StatefulWidget {
  const AddDebitCardVC({Key? key}) : super(key: key);

  @override
  _AddDebitCardVCState createState() => _AddDebitCardVCState();
}

class _AddDebitCardVCState extends State<AddDebitCardVC> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 100,
                  collapsedHeight: 100,
                  backgroundColor: AppColors.purpura.withAlpha(0),
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    // title: Obx(
                    //   () => Padding(
                    //     padding: const EdgeInsets.only(bottom: 20),
                    //     child: UserCards(
                    //       user: globals.userPersonal.userPersonal.value.toJsonInfo(),
                    //     ).userWelcome(context),
                    //   ),
                    // ),
                    background: ClipPath(
                      clipper: InBorderBotton(),
                      child: ClipPath(
                        clipper: InBorderBotton(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          color: AppColors.purpura,
                        ),
                      ),
                    ),
                    expandedTitleScale: 1,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        header(),
                        const SizedBox(
                          height: 32,
                        ),
                        card(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 50,
                      child: UIBottons(
                          labels: const UILabels(
                            text: 'Cancel',
                            textLines: 0,
                            color: AppColors.purpura,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          colorList: const [],
                          cb: (v) {})
                          .out(Colors.transparent)),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                      height: 50,
                      child: UIBottons(
                          labels: const UILabels(
                            text: 'Save',
                            textLines: 0,
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          colorList: const [],
                          cb: (v) {})),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget card(){
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 32, top: 32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.purpura.withAlpha(25),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        children:  [
          const UILabels(
            text: 'Card Number',
            textLines: 0,
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 8),
          UITextFields(text: "number",
          suffixIcon: Icon(Icons.credit_card)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  const UILabels(
                    text: 'Expiry Date',
                    textLines: 0,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  UITextFields(text: "Jan 2023"),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  const UILabels(
                    text: 'CVV',
                    textLines: 0,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  UITextFields(text: "...",passwordVisible: false),
                ],
              ),
            ),
          ],
        ),
          const SizedBox(height: 16),
          const UILabels(
            text: 'Name',
            textLines: 0,
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 8),
          UITextFields(text: "Name"),
          const SizedBox(height: 16),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              side: BorderSide(color: AppColors.purpura2,width: 1),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const UILabels(
              text: 'Save card for future transaction',
              textLines: 0,
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ],
        )
        ],
      ),
    );
  }

  Widget header() {
    return SizedBox(
      width: Get.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Expanded(
          child:
              UILabels(
                text: "Debit Card",
                textLines: 1,
                color: AppColors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,

          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColors.purpura.withAlpha(25),
          ),
          child: SvgPicture.asset(
            'assets/icons/ic_coin.svg',
          ),
        ),
      ]),
    );
  }
}
