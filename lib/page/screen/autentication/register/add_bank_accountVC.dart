import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/sheet/found_plaid/found_plaid.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';

class AddBankAccountVC extends StatefulWidget {
  const AddBankAccountVC({Key? key}) : super(key: key);

  @override
  _AddBankAccountVCState createState() => _AddBankAccountVCState();
}

class _AddBankAccountVCState extends State<AddBankAccountVC> {
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        selected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray0,
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 64,
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
              height: 32,
            ),
            GestureDetector(
              child: Container(
                    width: Get.width,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 60),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.white),
                    child: Column(children: [
                      SvgPicture.asset(
                        'assets/icons/bank.svg',
                        fit: BoxFit.fitHeight,width: 40,height: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const UILabels(
                        text: "Link to your Bank Account",
                        textLines: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.purpura,
                      ),
                    ],)),
              onTap: (){
                FoundPlaid().linkYourBank(context);
              },
            ),

            const Expanded(
              child: SizedBox(),
            ),
            resend()
          ],
        ),
      ),
    );
  }

  Widget resend() {
    return Text.rich(
      TextSpan(
          text: "Email didn't arrive? ",
          style: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: "Resend",
                style: const TextStyle(fontSize: 16, color: AppColors.blue, fontWeight: FontWeight.w700),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                  //TODO
                    // code to open / launch privacy policy link here
                  }),
          ]),
      textAlign: TextAlign.center,
    );
  }

}
