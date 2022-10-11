import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../sheetview.dart';
import '../../../helpers/globals.dart' as globals;

class EventsSheet extends SheetView {
  void infoEntity(context) {
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
                header("Events", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    color: AppColors.red,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const UILabels(
                  text: 'McDonald s - Dividend',
                  textLines: 0,
                  color: AppColors.purpura,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                  textLines: 0,
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
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
                    children: [list()],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                    height: 50,
                    width: Get.width,
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'View Stock Details',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList: const [],
                        cb: (v) {
                          Navigator.pop(globals.hometabContext);
                        })),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        }).whenComplete(() {
      Navigator.pushNamed(
        context,
        "/buyOverview",
      );
    });
  }

  void infoEvents() {
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
                header("Events", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    color: AppColors.purpura.withAlpha(25),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const UILabels(
                  text: 'Market Early Close - Holiday',
                  textLines: 0,
                  color: AppColors.purpura,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                  textLines: 0,
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
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
                    children: [list()],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          );
        }).whenComplete(() {
      // Navigator.pushNamed(
      //   context,
      //   "/buyOverview",
      // );
    });
  }

  Widget list() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: UILabels(
                  text: "Type",
                  textLines: 1,
                  color: AppColors.gray2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.blue,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  UILabels(
                    text: "Cash Dividend",
                    textLines: 1,
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: UILabels(
                  text: "Payment date",
                  textLines: 1,
                  color: AppColors.gray2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              UILabels(
                text: "7 October 2022",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: UILabels(
                  text: "Ex-Dividend Date",
                  textLines: 1,
                  color: AppColors.gray2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              UILabels(
                text: "14 September 2022",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: UILabels(
                  text: "Amount",
                  textLines: 1,
                  color: AppColors.gray2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              UILabels(
                text: "0.68 USD Per Share",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
