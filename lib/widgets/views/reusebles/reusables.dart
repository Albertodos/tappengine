import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constants/app_colors.dart';
import '../../ui_kits/button_ui/button_ui.dart';
import '../../ui_kits/labels_ui/label_ui.dart';

class ReusablesView extends StatelessWidget {
  const ReusablesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const UILabels(
          text:
              "Bitcoin is a decentralised payments system using permissionless peer to peer payments technology. transaction management and money issuance are carried out collectively by the  bitcoin network using public-key cryptography, peer-to-peer networking, and proof-of-work to process and verify payments.",
          textLines: 0,
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 2,
          color: AppColors.purpura.withAlpha(25),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget list01() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: const [
            Expanded(
              child: UILabels(
                text: "Market Cap",
                textLines: 1,
                color: AppColors.black,
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
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 2,
          color: AppColors.purpura.withAlpha(25),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget list02() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: AppColors.purpura.withAlpha(25),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Expanded(
              child: UILabels(
                text: "Official Website",
                textLines: 1,
                color: AppColors.purpura,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 2,
          color: AppColors.purpura.withAlpha(25),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget list03() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Expanded(
              child: UILabels(
                text: "Total Holdings",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Row(
              children: const [
                Icon(Icons.warning, color: AppColors.purpura2),
                UILabels(
                  text: "0.0733444.09",
                  textLines: 1,
                  color: AppColors.purpura2,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 2,
          color: AppColors.purpura.withAlpha(25),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: const [
            Expanded(
              child: UILabels(
                text: "Total Value",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            UILabels(
              text: "\$1,444.09",
              textLines: 1,
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 2,
          color: AppColors.purpura.withAlpha(25),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Expanded(
              child: UILabels(
                text: "Unrealised Return",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Row(
              children: const [
                UILabels(
                  text: "\$3444.09",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.red),
                UILabels(
                  text: "28.12%",
                  textLines: 1,
                  color: AppColors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget list04() {
    return Container(
      padding: EdgeInsets.all(32),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Current Value",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "\$0.00",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  const [
              Expanded(
                child: UILabels(
                  text: "Traget goal: \$100,000",
                  textLines: 1,
                  color: AppColors.gray2,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              UILabels(
                text: "0% Achieved",
                textLines: 1,
                color: AppColors.gray2,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Monthly contribution",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "\$0",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,)
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Net deposit",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "\$0",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,)
                ],
              ),
            ],
          ),const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Amount withdrawn",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "\$00",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget list05() {
    return Container(
      padding: EdgeInsets.all(32),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Target goal",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "\$100,000",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:   [
              const Expanded(
                child: UILabels(
                  text: "Time left",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "10y",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  UILabels(
                    text: "/10y",
                    textLines: 1,
                    color: AppColors.gray2,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              Expanded(
                child: Row(
                  children: const[
                    UILabels(
                      text: "Unrealised Return",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.info, color: AppColors.blue, size: 15),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  Icon(Icons.insights, color: AppColors.gray2),
                  SizedBox(width: 5),
                  UILabels(
                    text: "0.12%",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              Expanded(
                child: Row(
                  children: const[
                    UILabels(
                      text: "Risk profile",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.info, color: AppColors.blue, size: 15),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const UILabels(
                text: "Agressive",
                textLines: 1,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget list07(){
    return ExpansionTile(
      title: const UILabels(
        text: "iShares core U.S. Aggregate bond ETF",
        textLines: 1,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const[
          UILabels(
            text: "AAG",
            textLines: 1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          UILabels(
            text: "20%",
            textLines: 1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          UILabels(
            text: "\$0.00%",
            textLines: 1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          SizedBox()
        ],
      ),
      children: [
        Container(
            width: Get.width,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.gray3,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(color: AppColors.purpura, offset: Offset(-5, 0)),
              ],
            ),
            child: Column(
              children:  [
                const UILabels(
                  text: "iShares core U.S. Aggregate bond ETF has exhibited a sharpe ratio of 1.03 over the past 5 years. ",
                  textLines: 0,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                const SizedBox(height: 10),
                const UILabels(
                  text: "Sharpe ratio is equal to the average yearly return devided by return volatility.",
                  textLines: 0,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                const SizedBox(height: 10),
                SizedBox(
                    height: 50,
                    width: Get.width,
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'See Details',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList:  const [],
                        cb: (v) {
                        })
                ),
              ],
            )),
      ],
    );
  }
  Widget list06() {
    return Container(
      padding: EdgeInsets.all(32),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const UILabels(
            text: "Transaction history",
            textLines: 1,
            color: AppColors.gray2,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 32),
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Transaction Id",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "01111111",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              Expanded(
                child: Row(
                  children: const[
                    UILabels(
                      text: "Order date",
                      textLines: 1,
                      color: AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.info, color: AppColors.blue, size: 15),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const UILabels(
                text: "15/07/2020",
                textLines: 1,
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Remarks",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "Top up",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Gross amount",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "\$10,000.00",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              const Expanded(
                child: UILabels(
                  text: "Status",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  UILabels(
                    text: "Pending / Approval",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );}


  Widget isBack() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.purpura.withAlpha(25)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          'assets/icons/back-arrow.svg',
          color: AppColors.purpura,
        ),
      ),
    );
  }
}
