import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/model/objects/user/user_personal.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key, required this.user});
  final Map<String, dynamic> user;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget userWelcome(mycontext) {
    return ListTile(
      leading: GestureDetector(
        child: CircleAvatar(
            radius: 27.5,
            backgroundColor: Colors.amber,
            child: ClipOval(
              child: Image.asset(
                "assets/background/profile.png",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            )),
        onTap: () {
          print("/personalInfo");
          Navigator.pushNamed(
            mycontext,
            "/personalInfo",
          );
        },
      ),
      title: const UILabels(
        text: "Welcome",
        textLines: 1,
        color: AppColors.white,
        fontSize: 18,
      ),
      subtitle: UILabels(
        text: user['userInfo']['name'],
        textLines: 1,
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      trailing: SvgPicture.asset("assets/icons/notification.svg", color: AppColors.white),
    );
  }

  Widget userInfo(mycontext) {
    return ListTile(
      leading: SizedBox(
        height: Get.height,
        child: GestureDetector(
          child: CircleAvatar(
              radius: 27.5,
              backgroundColor: Colors.amber,
              child: ClipOval(
                child: Image.asset(
                  "assets/background/profile.png",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              )),
          // onTap: () {
          //   print("/personalInfo");
          //   Navigator.pushNamed(
          //     mycontext,
          //     "/personalInfo",
          //   );
          // },
        ),
      ),
      style: ListTileStyle.list,
      title: const UILabels(
        text: "Full Name",
        textLines: 1,
        color: AppColors.purpura,
        fontSize: 18,
      ),
      subtitle: UILabels(
        text: user['userInfo']['name'],
        textLines: 1,
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      trailing: SizedBox(height: Get.height, child: SvgPicture.asset("assets/icons/arrow-right.svg", color: AppColors.purpura)),
    );
  }

  Widget userSettingsItem() {
    return Column(
      children: [
        ListTile(
          leading: user['leading'],
          title: UILabels(
            text: user['title'],
            textLines: 1,
            color: AppColors.purpura,
            fontSize: 12,
          ),
          subtitle: UILabels(
            text: user['subtitle'],
            textLines: 1,
            color: user['color'],
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          trailing: user['trailing'],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget userBack() {
    return Row(
      children: [
        IconButton(
            onPressed: null,
            icon: SvgPicture.asset(
              "assets/icons/ic_back.svg",
            )),
        const UILabels(
          text: "Welcome",
          textLines: 1,
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
