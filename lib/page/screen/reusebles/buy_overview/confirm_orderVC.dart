import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../helpers/cliper.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../sheet/payment_method.dart';

class ComfirmOrderVC extends StatelessWidget {
  const ComfirmOrderVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        headers(),
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
                                offset: Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [list(), list(), list(), list(), list()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
            child: Column(
              children: [
                const UILabels(
                  text: "Cryptocurrency prices are volatile. The value of your investment may go up, or down very quickly and can even fall to zero.",
                  textLines: 0,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                    height: 50,
                    width: Get.width,
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'Confirm order',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList: const [],
                        cb: (v) {
                          PaymentMethodSheet().successful(context, "You Exchanged", 'BTC 0,00023454 from \$10', btnSuccessfulSheet(context));
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headers() {
    return SizedBox(
      width: Get.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              UILabels(
                text: "-\$10",
                textLines: 1,
                color: AppColors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              UILabels(
                text: "Buy BTC 0,0000234467",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ],
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
        ),
      ]),
    );
  }

  Widget list() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: const [
          Expanded(
            child: UILabels(
              text: "Market Cap",
              textLines: 1,
              color: AppColors.purpura,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          UILabels(
            text: "\$12,3444.09",
            textLines: 1,
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Widget btnSuccessfulSheet(context) {
    return SizedBox(
        height: 50,
        width: Get.width,
        child: UIBottons(
            labels: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.camera_indoor),
                SizedBox(
                  width: 16,
                ),
                UILabels(
                  text: 'Set a recurring buy',
                  textLines: 0,
                  color: AppColors.purpura,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            colorList: const [],
            cb: (v) {
              Navigator.pushNamed(context, "/schedule");
            }).out(AppColors.white));
  }
}
