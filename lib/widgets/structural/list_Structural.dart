import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../model/objects/pull_data.dart';

class ListStrutural extends StatelessWidget {
  final PullData data;
  final dynamic height;
  final Color colorTitle;
  const ListStrutural({super.key, required this.data, required this.colorTitle, required this.height});

  @override
  Widget build(BuildContext context) {
    return height == null ? listVertical() : listHorizontal();
  }

  Widget listVertical() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        children: [
          if (data.title != "")
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: UILabels(
                  text: data.title ?? "",
                  textLines: 1,
                  color: colorTitle,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
                if (data.more != "")
                  UILabels(
                    text: data.more ?? "",
                    textLines: 1,
                    color: AppColors.purpura,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
              ],
            ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: data.position ?? Axis.horizontal,
            itemCount: data.data.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return data.data[index];
            },
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  Widget listHorizontal() {
    return Column(
      children: [
        if (data.title != "")
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: UILabels(
                  text: data.title ?? "",
                  textLines: 1,
                  color: colorTitle,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
                if (data.more != "")
                  UILabels(
                    text: data.more ?? "",
                    textLines: 1,
                    color: AppColors.purpura,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
              ],
            ),
          ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: height,
          width: Get.width,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: data.position ?? Axis.horizontal,
            itemCount: data.data.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  data.data[index],
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
