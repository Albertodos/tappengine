import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/page/tab/model/products.dart';
import '../../../../helpers/globals.dart' as globals;
import '../../../../constants/api_path.dart';
import '../../../../page/nav/productsNav.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';
import 'model/publicity.dart';

class PublicityCards extends StatelessWidget {
  final Publicity publicity;
  const PublicityCards({super.key, required this.publicity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.purpura, borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(children: [
          SizedBox(
            width: 100,
            height: 75,
            child: SvgPicture.network(
              ApiPath.imgBaseUrl + (publicity.icon.toString()),
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: UILabels(
              text: publicity.name ?? "",
              textLines: 0,
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 36,
            height: 36,
            child: SvgPicture.asset(
              'assets/icons/ic_advice-arrow.svg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ]),
      ),
    );
  }

  Widget pubCrypto(context) {
    return InkWell(
      onTap: () {
        // globals.rootName = publicity.name ?? "";
        // ProductsNav(key: Key(publicity.name.toString()), data: Products(dataUrl: publicity.dataUrl, name: publicity.name.toString()));
      },
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UILabels(
                    text: publicity.name ?? "",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  UILabels(
                    text: publicity.description ?? "",
                    textLines: 1,
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const CircleAvatar(backgroundColor: AppColors.gray3, radius: 20, child: Icon(Icons.arrow_forward, color: AppColors.black)),
          ]),
        ),
      ),
    );
  }

  Widget card03() {
    return Container(
      height: 414,
      decoration: BoxDecoration(
        color: AppColors.green,
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
    );
  }
}
