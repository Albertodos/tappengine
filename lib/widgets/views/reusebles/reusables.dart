import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_colors.dart';
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
