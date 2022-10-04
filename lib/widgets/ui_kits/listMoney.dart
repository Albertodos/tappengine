import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/model/objects/user/controller/user_personalC.dart';

import '../../constants/app_colors.dart';

class ListMoney extends StatefulWidget {
  const ListMoney({Key? key}) : super(key: key);

  @override
  _ListMoneyState createState() => _ListMoneyState();
}

class _ListMoneyState extends State<ListMoney> {
  var list = ["\$10", "\$50", "\$100", "\$500", "\$1000"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: GetBuilder<UserPersonalC>(
        builder: (_) =>
         ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(left: 7, right: 7),
                  margin: EdgeInsets.only(left: 17, right: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                   // color: UserPersonalC().selectedIndex == index ? AppColors.purpura : AppColors.white,

                  ),
                  child: Text(list[index],
                      //style: TextStyle(color: UserPersonalC().selectedIndex == index ? AppColors.white : AppColors.black,),
                  ),
                ),
                onTap: () {
                //  UserPersonalC().selectedIndex = index ;
                },
              );
            }),
      ),
    );
  }
}
