import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              fontSize: 18,
              fontWeight: FontWeight.w400,
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
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: bg,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.gray,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UILabels(
                      text: "Affinity Plus (Premier)",
                      textLines: 1,
                      color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    UILabels(
                      text: "xxxx 5642",
                      textLines: 1,
                      color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
                      fontSize: 16,
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
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
            UILabels(
              text: subtitle,
              textLines: 1,
              color: AppColors.black,
              fontSize: 18,
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
              textLines: 1,
              color: bg == AppColors.purpura ? AppColors.gray : AppColors.black,
              fontSize: 18,
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
          style: const TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: " privacy policy ",
                style: const TextStyle(fontSize: 18, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch privacy policy link here
                  }),
            const TextSpan(
              text: " for more information about how we store and use your biometric data. select ID type to proceed ",
              style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          ]),
      textAlign: TextAlign.left,
    );
  }

  Widget verify() {
    return Text.rich(
      TextSpan(
          text: "Financial regulations require us to verify",
          style: const TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: " verify ",
                style: const TextStyle(fontSize: 18, color: AppColors.blue, fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch privacy policy link here
                  }),
            const TextSpan(
              text: " your identify. ",
              style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w400),
            ),
          ]),
      textAlign: TextAlign.left,
    );
  }
}
