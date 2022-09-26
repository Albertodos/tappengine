import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../ui_kits/labels_ui/label_ui.dart';

class WatchlistsCards extends StatelessWidget {
  const WatchlistsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget tabMenu() {
    return SizedBox(
      height: 50,
      child: Column(children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: const [
                UILabels(
                  text: "Crypto",
                  textLines: 1,
                  color: AppColors.purpura,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: 16,
                )
              ],
            );
          },
        )
      ]),
    );
  }
}
