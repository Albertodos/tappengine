import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import '../../../helpers/globals.dart' as globals;
import '../../../helpers/cliper.dart';
import '../../../model/objects/user/user.dart';
import '../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../widgets/views/form/form.dart';

class EditProfileVC extends StatefulWidget {
  const EditProfileVC({Key? key}) : super(key: key);

  @override
  _EditProfileVCState createState() => _EditProfileVCState();
}

class _EditProfileVCState extends State<EditProfileVC> {
  var userLogin = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      primary: false,
      extendBody: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            collapsedHeight: 100,
            backgroundColor: AppColors.purpura.withAlpha(0),
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                // child: , //UserCards().userBack(),
              ),
              background: ClipPath(
                clipper: InBorderBotton(),
                child: ClipPath(
                  clipper: InBorderBotton(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: AppColors.purpura,
                  ),
                ),
              ),
              expandedTitleScale: 1,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: Container(
                height: Get.height * 0.75,
                child: Stack(
                  children: [
                    Positioned(
                      child: Column(
                        children: [
                          const CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              )),
                          Column(
                            children: globals.userPersonal.userFroms.value
                                .froms([
                                  "email",
                                  "password",
                                ])
                                .values
                                .map((e) => FromView(
                                      user: e,
                                      onSubmitted: (k) {},
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 100,
                      top: 160,
                      child: GestureDetector(
                          onTap: () {
                            //TODO
                          },
                          child: const CircleAvatar(radius: 20, backgroundColor: AppColors.purpura2, child: ClipOval(child: Icon(Icons.edit)))),
                    ),
                    Positioned(
                      //bottom: 0,
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: SizedBox(
                                    height: 50,
                                    child: UIBottons(
                                            labels: const UILabels(
                                              text: 'Cancel',
                                              textLines: 0,
                                              color: AppColors.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            colorList: const [],
                                            cb: (v) {})
                                        .out(Colors.transparent)),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: SizedBox(
                                    height: 50,
                                    child: UIBottons(
                                            labels: const UILabels(
                                              text: 'Save',
                                              textLines: 0,
                                              color: AppColors.purpura,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            colorList: const [],
                                            cb: (v) {})
                                        .out(Colors.transparent)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
