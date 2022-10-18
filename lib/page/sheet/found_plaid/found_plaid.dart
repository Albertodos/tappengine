import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/sheet/sheetview.dart';
import 'package:tappengine/widgets/views/form/form.dart';
import '../../../constants/app_colors.dart';
import '../../../helpers/globals.dart' as globals;
import '../../../model/objects/user/user.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';

class FoundPlaid extends SheetView {
  var userLogin = User();

  void linkYourBank(context) {
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
                header("Link to your bank account ", globals.hometabContext),
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
                        FoundPlaid().plaid(context);
                      }),
                )
              ],
            ),
          );
        }).whenComplete(() {
      ;
    });
  }

  void plaid(context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header("Plaid", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.purpura4),
                ),
                const SizedBox(
                  height: 16,
                ),
                const UILabels(
                  text: 'Affinity Plus uses Plaid to link your bank',
                  textLines: 2,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const UILabels(text: "Secure", textLines: 1, color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 18),
                  subtitle: const UILabels(
                      text: "Encryption helps protect your personal finanical data",
                      textLines: 2,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.purpura4),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const UILabels(text: "Private", textLines: 1, color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 18),
                  subtitle: const UILabels(
                      text: "Your credentials will never be made accessible to Affinity Plus",
                      textLines: 2,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.purpura4),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 32),
                infPlaid(),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  width: Get.width,
                  child: UIBottons(
                      labels: const UILabels(
                        text: 'Continue',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      colorList: const [],
                      cb: (v) {
                        FoundPlaid().plaidAccount(context);
                      }),
                )
              ],
            ),
          );
        }).whenComplete(() {
      ;
    });
  }

  void plaidAccount(context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header("Plaid", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.purpura4),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.purpura4),
                ),
                const SizedBox(height: 16),
                const UILabels(
                  text: 'Enter your credentials',
                  textLines: 2,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 16),
                Column(
                  children: globals.userPersonal.userFroms.value
                      .froms([
                        "email",
                        "password",
                      ])
                      .values
                      .map((e) => FromView(
                            user: e,
                            onSubmitted: (k) {
                              // k == 'password'
                              //     ? globals.userPersonal.validateLogin()
                              //         ? login()
                              //         : loginError()
                              //     : null;
                            },
                          ))
                      .toList(),
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  child: Center(
                    child: const UILabels(
                      text: 'Reset Password',
                      textLines: 2,
                      color: AppColors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  width: Get.width,
                  child: UIBottons(
                      labels: const UILabels(
                        text: 'Submit',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      colorList: const [],
                      cb: (v) {
                        FoundPlaid().verifyIdentity(context);
                      }),
                )
              ],
            ),
          );
        }).whenComplete(() {});
  }

  void verifyIdentity(context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header("Verify your identity", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                const UILabels(
                  text: 'Verify your identity',
                  textLines: 2,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 16),
                const UILabels(
                  text: 'Where would you like to send your security code?',
                  textLines: 2,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 32),
                verifyIdentily("Text"),
                const SizedBox(height: 32),
                GestureDetector(
                  child: const Center(
                    child: UILabels(
                      text: 'Reset password',
                      textLines: 1,
                      color: AppColors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  width: Get.width,
                  child: UIBottons(
                      labels: const UILabels(
                        text: 'Submit',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      colorList: const [],
                      cb: (v) {
                        FoundPlaid().verifyAccount(context);
                      }),
                )
              ],
            ),
          );
        }).whenComplete(() {
      ;
    });
  }

  void verifyAccount(context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header("Verify your identity", globals.hometabContext),
                const SizedBox(
                  height: 64,
                ),
                const UILabels(
                  text: 'Your accounts',
                  textLines: 2,
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 16),
                const UILabels(
                  text: 'Let Affinity Plus know your primary account',
                  textLines: 2,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 32),
                verifyIdentily("Individual"),
                const SizedBox(height: 32),
                SizedBox(
                  height: 50,
                  width: Get.width,
                  child: UIBottons(
                      labels: const UILabels(
                        text: 'Submit',
                        textLines: 0,
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      colorList: const [],
                      cb: (v) {}),
                )
              ],
            ),
          );
        }).whenComplete(() {
      ;
    });
  }
}
