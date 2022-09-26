import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../ui_kits/labels_ui/label_ui.dart';
import '../../ui_kits/textFields/textFields_ui.dart';

class FromView extends StatelessWidget {
  final Map<String, dynamic> user;
  const FromView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (user['name'].isNotEmpty)
          Column(
            children: [
              UILabels.semiBold(text: user['name'], textLines: 1, color: AppColors.black),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        UITextFields(
          text: user['hintText'],
          cname: user['hintText'],
          cbChenge: (v, k) {
            user['value'] = k;
          },
          type: user['keyboardType'],
          suffixIcon: user['sufix'],
          prefixIcon: user['prefix'],
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
