import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/screen/reusebles/payment_method/add_payment_methodVC.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
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
                  fontWeight: FontWeight.w600,
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
                        IdentifyVerication().requiredLicense(context);
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

  void requiredLicense(context) {
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
                GestureDetector(
                  onTap: (){IdentifyVerication().requiredLicenseBack(context);},
                    child: license("https://ey5me.csb.app/happy.svg", "First, we need a picture of the front of your driver’s license")),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text: 'Example',
                  textLines: 1,
                  color: AppColors.gray2,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 16,
                ),
                Icon(Icons.account_circle, size: 55,color: AppColors.purpura),
                const SizedBox(
                  height: 32,
                ),
                exampleDesc("Turn up your brightness If and avoid glare"),
                exampleDesc("First name and Last name clearly visible"),
                exampleDesc("Date of Birth clearly visible"),
                exampleDesc("ID Number clearly visible"),
              ],
            ),
          );
        }).whenComplete(() {
      chooseUpload(globals.hometabContext, (v) {});
    });
  }
  void requiredLicenseBack(context) {
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
                GestureDetector(
                  onTap: (){
                    IdentifyVerication().verifyingID(context);
                  },
                    child: licenseBack("https://ey5me.csb.app/happy.svg")),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text: 'Example',
                  textLines: 1,
                  color: AppColors.gray2,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 16,
                ),
                Icon(Icons.account_circle, size: 55,color: AppColors.purpura),
                const SizedBox(
                  height: 32,
                ),
                exampleDesc("Fully in frame not cut off on any side"),
                exampleDesc("Turn up your brightness If and avoid glare"),
              ],
            ),
          );
        }).whenComplete(() {
      chooseUpload(globals.hometabContext, (v) {});
    });
  }
  void verifyingID(context) {
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
                GestureDetector(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.purpura4
                    ),
                  ),
                  onTap: (){IdentifyVerication().verifySuccessful(context);},
                ),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text: 'We’re verifying your ID',
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text: 'Your identify is being verified. We will email you once your verification has completed.',
                  textLines: 2,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                circularProgress(),
              ],
            ),
          );
        }).whenComplete(() {
      chooseUpload(globals.hometabContext, (v) {});
    });
  }

  void verifySuccessful(context) {
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
                header("Verify Successful", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.green,
                  radius: 40,
                  child: Icon(Icons.done, color: AppColors.white, size: 40),
                ),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text: 'Congratulations',
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 10,
                ),
                const UILabels(
                  text: 'Your identity is verified successfully.',
                  textLines: 0,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 64,
                ),
                const UILabels(
                  text: 'Kindly, Link to your bank account',
                  textLines: 0,
                  color: AppColors.gray2,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  width: Get.width,
                  child: Expanded(
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'Add your bank account',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList: const [],
                        cb: (v) {
                          Get.to(AddPaymentMethodVC());
                        }),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: const UILabels(
                    text: 'Skip',
                    textLines: 0,
                    color: AppColors.purpura2,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  onTap: (){
                    //TODO
                  },
                ),
              ],
            ),
          );
        }).whenComplete(() {
      chooseUpload(globals.hometabContext, (v) {});
    });
  }
}
