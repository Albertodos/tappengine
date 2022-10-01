import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../sheetview.dart';
import '../../../helpers/globals.dart' as globals;

class IdentifyVerication extends SheetView {
  var uploadDate = ['WebCam', 'Mobile Camera', 'File Upload'];
  final selectUpload = "WebCam".obs;

  void selectIdType(context) {
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
                header("Identity Verification Required", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                const UILabels(
                  text: 'Select ID Type',
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 16,
                ),
                verify(),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(globals.hometabContext);
                            },
                            child: selectIDType(AppColors.purpura, "Driver’s License"))),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(globals.hometabContext);
                            },
                            child: selectIDType(AppColors.white, "Driver’s License"))),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                policy(),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.centerLeft,
                  child: const UILabels(
                    text: 'I don’t have one of these IDs ',
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          );
        }).whenComplete(() {
      chooseUpload(globals.hometabContext, (v) {});
    });
  }

  void chooseUpload(context, Function(String) cb) {
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
                header("Identity Verification Required Method", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                const UILabels(
                  text: 'Choose an Upload Method',
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: uploadDate.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        selectUpload.value = uploadDate[index];
                        cb(selectUpload.value);

                        // Navigator.pushNamed(context, '/addMoney');
                      },
                      child: Column(
                        children: [
                          Obx(() => view04(uploadDate[index] == selectUpload.value ? AppColors.purpura : AppColors.white, uploadDate[index])),
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

  void example(context) {
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
                header("Identity Verification Required", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                const UILabels(
                  text: 'Select ID Type',
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 16,
                ),
                verify(),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(globals.hometabContext);
                            },
                            child: selectIDType(AppColors.purpura, "Driver’s License"))),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(globals.hometabContext);
                            },
                            child: selectIDType(AppColors.white, "Driver’s License"))),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                policy(),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.centerLeft,
                  child: const UILabels(
                    text: 'I don’t have one of these IDs ',
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          );
        }).whenComplete(() {
      chooseUpload(globals.hometabContext, (v) {});
    });
  }
}
