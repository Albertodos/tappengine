import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/api_path.dart';
import '../../constants/app_colors.dart';
import '../../helpers/globals.dart' as globals;
import '../../widgets/ui_kits/labels_ui/label_ui.dart';
import 'model/products.dart';

class MoreSheet {
  void choosePaymentMethod(List<Products> item, context) {
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
                header("More", context),
                const SizedBox(
                  height: 32,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          moreBar(
                            item[index].icon,
                            item[index].name,
                          ),
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
        }).whenComplete(() {
      // Navigator.pushNamed(
      //   context,
      //   "/comfirmOrder",
      // );
    });
  }

  Widget header(String title, context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Expanded(
            child: UILabels(
              text: title,
              textLines: 1,
              color: AppColors.gray2,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.gray2),
            child: const Icon(
              Icons.close_rounded,
              color: AppColors.white,
              size: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget moreBar(icon, title) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            child: SvgPicture.network(ApiPath.imgBaseUrl + icon, height: 19, width: 19, color: AppColors.gray2),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: UILabels(
              text: title,
              textLines: 1,
              color: AppColors.gray2,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
