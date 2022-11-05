import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tappengine/page/sheet/payment_method/payment_method.dart';
import 'package:tappengine/widgets/ui_kits/button_ui/button_ui.dart';

import '../../constants/app_colors.dart';
import '../../widgets/ui_kits/labels_ui/label_ui.dart';

class SheetView {
  Widget header(String title, context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Expanded(
            child: UILabels(
              text: title,
              textLines: 1,
              color: AppColors.gray2,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.gray2),
            child: const Icon(
              Icons.close_rounded,
              color: AppColors.white,
              size: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget view01(Color bg) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32, top: 16, bottom: 16),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              // Container(
              //   height: 50,
              //   width: 50,
              //   decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //     color: AppColors.gray,
              //   ),
              // ),
              // const SizedBox(
              //   width: 16,
              // ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UILabels(
                      text: "Debit Card",
                      textLines: 1,
                      color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    UILabels(
                      text: "xxx xxxx 5642",
                      textLines: 1,
                      color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              if (bg == AppColors.purpura)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.white,
                )
            ]),

          ],
        ),
      ),
    );
  }

  Widget view02(title, subtitle, Widget btn) {
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: AppColors.green),
              child: const Icon(
                Icons.check,
                color: AppColors.white,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            UILabels(
              text: title,
              textLines: 1,
              color: AppColors.purpura,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            UILabels(
              text: subtitle,
              textLines: 1,
              color: AppColors.purpura,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 64,
            ),
            btn
          ],
        ),
      ),
    );
  }

  Widget view03(Color bg, value) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                child: UILabels(
                  text: value,
                  textLines: 1,
                  color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (bg == AppColors.purpura)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.white,
                )
            ]),
          ],
        ),
      ),
    );
  }

  Widget view04(Color bg, title) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.gray,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: UILabels(
                  text: title,
                  textLines: 1,
                  color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (bg == AppColors.purpura)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.white,
                )
            ]),
          ],
        ),
      ),
    );
  }

  Widget view05(Color bg, value) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: bg == AppColors.purpura ? AppColors.gray : AppColors.purpura,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              UILabels(
                text: value,
                textLines: 1,
                color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),

            ]),
          ],
        ),
      ),
    );
  }

  Widget view06(Color bg, title) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32, top: 16, bottom: 16),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UILabels(
                      text: title,
                      textLines: 1,
                      color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    UILabels(
                      text: "xxx xxxx 5642",
                      textLines: 1,
                      color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
                Row(
                  children:  [
                    GestureDetector(
                      child: CircleAvatar(
                          backgroundColor: bg == AppColors.purpura ? AppColors.purpura8 : AppColors.gray3,
                          radius: 14,
                          child: Icon(Icons.edit, color: bg == AppColors.purpura ? AppColors.white : AppColors.purpura, size: 17)
                      ),
                      onTap: (){
                        //TODO
                      },
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      child: CircleAvatar(
                          backgroundColor: bg == AppColors.purpura ? AppColors.purpura8 : AppColors.gray3,
                          radius: 14,
                          child: Icon(Icons.delete_outlined, color: bg == AppColors.purpura ? AppColors.white : AppColors.purpura, size: 17,)
                      ),
                      onTap: (){
                        PaymentMethodSheet().deletePaymentMethod();
                      },
                    ),
                  ],
                )
            ]),

          ],
        ),
      ),
    );
  }

  Widget view07(Color bg, title) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32, top: 16, bottom: 16),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                child: UILabels(
                  text: title,
                  textLines: 1,
                  color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (bg == AppColors.purpura)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.white,
                )
            ]),

          ],
        ),
      ),
    );
  }

  Widget selectIDType(Color bg, title) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: bg == AppColors.purpura ? AppColors.gray : AppColors.purpura,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            UILabels(
              text: title,
              textLines: 0,
              color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
              fontSize: 16,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }

  Widget policy() {
    return Text.rich(
      TextSpan(
          text: "Your photo ID and actions captured during theID verification process may constitute biometric data. please see our",
          style: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: " privacy policy ",
                style: const TextStyle(fontSize: 16, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch privacy policy link here
                  }),
            const TextSpan(
              text: " for more information about how we store and use your biometric data. select ID type to proceed ",
              style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          ]),
      textAlign: TextAlign.left,
    );
  }

  Widget verify() {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
          text: "Financial regulations require us to verify",
          style: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: " verify ",
                style: const TextStyle(fontSize: 16, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch privacy policy link here
                  }),
            const TextSpan(
              text: " your identify. ",
              style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          ]),
    );
  }

  Widget license(imageUrl,desc) {
    return Stack(
      children: <Widget>[
        Container(
          width: Get.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black,
                width: 1,
              )
          ),
          child: Stack(children: [
            SvgPicture.network(
              imageUrl,
              alignment: Alignment.center,
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    ClipOval(
                      child: Material(
                        color: Colors.white,
                        shape: CircleBorder(
                            side: BorderSide(color: AppColors.white)),
                        child: SizedBox(
                            width: 25,
                            height: 25,
                            child: Icon(
                              Icons.credit_card,
                              size: 12,
                              color: AppColors.purpura,
                            )),
                      ),
                    ),
                    SizedBox(width: 10),
                     ClipOval(
                      child: Material(
                        color: AppColors.purpura,
                        shape: CircleBorder(
                            side: BorderSide(color: AppColors.purpura)),
                        child: SizedBox(
                            width: 25,
                            height: 25,
                            child: Icon(
                              Icons.wallet_giftcard,
                              size: 12,
                              color: AppColors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 40, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UILabels(text: desc, textLines: 0, fontWeight: FontWeight.w400, fontSize: 14, textAlign: TextAlign.center),
                  const SizedBox(height: 15),
                 SizedBox(width: Get.width,
                     child: UIBottons(
                         labels: const UILabels(
                           text: 'I’m Ready',
                           textLines: 0,
                           color: AppColors.white,
                           fontSize: 16,
                           fontWeight: FontWeight.w700,
                         ),
                         borderColor: AppColors.white,
                         colorList: const [],
                         cb: (v) {
                         }).out(Colors.transparent))
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
  Widget exampleDesc(desc) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: AppColors.purpura,size: 15),
        const SizedBox(width: 10),
        UILabels(text: desc, textLines: 0, fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black)
      ],
    );
  }
  Widget licenseBack(imageUrl) {
    return Stack(
      children: <Widget>[
        Container(
          width: Get.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black,
                width: 1,
              )
          ),
          child: Stack(children: [
            SvgPicture.network(
              imageUrl,
              alignment: Alignment.center,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: Get.width, child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: UIBottons(
                          labels: const UILabels(
                            text: 'Retake',
                            textLines: 0,
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          borderColor: AppColors.white,
                          colorList: const [],
                          cb: (v) {
                          }).out(Colors.transparent)),
                      const SizedBox(width: 10),
                      Expanded(child: UIBottons(
                          labels: const UILabels(
                            text: 'Next',
                            textLines: 0,
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          borderColor: AppColors.white,
                          colorList: const [],
                          cb: (v) {
                          })),
                    ],
                  ))
                ],
              ),
            )
          ]),
        ),
        // Container(
        //   child: Column(
        //     children: <Widget>[Expanded(child: Text(""))],
        //   ),
        // ),
      ],
    );
  }

  Widget circularProgress(){
    return const Center(
      child:  SizedBox(
        width: 60,
        height: 60,
        child: CircularStepProgressIndicator(
          totalSteps: 15,
          currentStep: 6,
          //padding: math.pi / 15,
          selectedColor: AppColors.purpura,
          unselectedColor: AppColors.gray,
          selectedStepSize: 12.0,
          unselectedStepSize: 12.0,
          width: 100,
        ),
      ),
    );
  }

  Widget infPlaid() {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
          text: "By selecting ”Contine” you agree to the",
          style: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: " Plaid End User Privacy Policy.",
                style: const TextStyle(fontSize: 16, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch privacy policy link here
                  }),
          ]),
    );
  }

  Widget verifyIdentily(title){
    return Container(
      margin: const EdgeInsets.only( bottom: 5),
      padding: const EdgeInsets.only(right: 30, left: 30, bottom: 15,top: 15),
      height: 85.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.purpura,
        border: Border.all(
          color: AppColors.purpura,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.purpura4),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UILabels(text: title, textLines: 0, fontSize: 16, fontWeight: FontWeight.w400),
                  const SizedBox(height: 5),
                  UILabels(text: "(...) ... 1557", textLines: 0, fontSize: 16, fontWeight: FontWeight.w400),
                ],
              )
            ],
          ),
          Icon(Icons.check_circle, color: AppColors.white, size: 40),
        ],
      ),
    );
  }
}
