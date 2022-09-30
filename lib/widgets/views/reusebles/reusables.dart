import 'package:flutter/material.dart';
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
          fontSize: 18,
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
                fontSize: 18,
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
}
