import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

import '../../model/objects/pull_data.dart';

class ListStrutural extends StatelessWidget {
  final PullData data;
  final Color colorTitle;
  const ListStrutural({super.key, required this.data, required this.colorTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (data.title != "")
          Column(
            children: [
              Row(
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
                    Expanded(
                        child: UILabels(
                      text: data.title ?? "",
                      textLines: 1,
                      color: AppColors.purpura,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ))
                ],
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: data.position ?? Axis.horizontal,
          itemCount: data.data.length,
          padding: EdgeInsets.zero,
          
          itemBuilder: (BuildContext context, int index) {
            return data.data[index];
          },
        ),
      ],
    );
  }
}
