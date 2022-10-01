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
        child: Container(
          width: 53.0,
          height: 53.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all( Radius.circular(50.0)),
            border: Border.all(
              color: AppColors.purpura2,
              width: 1.0,
            ),
          ),
          child: Image.asset(
            "assets/background/profile.png",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        onTap: () {
          print("/personalInfo");
          Navigator.pushNamed(
            mycontext,
            "/personalInfo",
          );
        },
      ),
      title:  UILabels(
        text: "Welcome",
        textLines: 1,
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      subtitle: UILabels(
        text: user['userInfo']['name'],
        textLines: 1,
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      trailing: SvgPicture.asset("assets/icons/notification.svg", color: AppColors.white),
    );
  }

  Widget userInfo(mycontext) {
    return ListTile(
      onTap: () {
        print("/personalInfo");
        Navigator.pushNamed(
          mycontext,
          "/editProfile",
        );
      },
      leading: SizedBox(
        height: Get.height,
        child: GestureDetector(
          child: Container(
            width: 53.0,
            height: 53.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              borderRadius: BorderRadius.all( Radius.circular(50.0)),
              border: Border.all(
                color: AppColors.purpura2,
                width: 1.0,
              ),
            ),
            child: Image.asset(
              "assets/background/profile.png",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
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
      title:  const UILabels(
        text: "Full Name",
        textLines: 1,
        color: AppColors.purpura4,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      subtitle: UILabels(
        text: user['userInfo']['name'],
        textLines: 1,
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      trailing: SizedBox(height: Get.height, child: SvgPicture.asset("assets/icons/arrow-right.svg", color: AppColors.purpura)),
    );
  }

  Widget userSettingsItem(mycontext) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            print("/personalInfo");
            Navigator.pushNamed(
              mycontext,
              user['root'],
            );
          },
          leading: user['leading'],
          title: UILabels(
            text: user['title'],
            textLines: 1,
            color: AppColors.purpura4,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          subtitle: UILabels(
            text: user['subtitle'],
            textLines: 1,
            color: user['color'],
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          trailing: user['trailing'],
        ),
        const Divider(
          endIndent: 16,
          indent: 66,
          color: AppColors.gray1,
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
