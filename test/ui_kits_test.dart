import 'package:flutter/material.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

class UIKitsTest extends StatefulWidget {
  const UIKitsTest({Key? key}) : super(key: key);

  @override
  State<UIKitsTest> createState() => _UIKitsTestState();
}

class _UIKitsTestState extends State<UIKitsTest> {
  List<Map<String,dynamic>> menuUIKtit = [
    {"name":"Buttons",
  "root":"/buttos"},
    {"name":"TextFields",
      "root":"/textFields"}
    ,
    {"name":"Drop Down",
      "root":"/dropdown"}
    ,
    {"name":"Labels",
      "root":"/labels"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: menuUIKtit.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, menuUIKtit[index]["root"].toString(),);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: UILabels.bold(
                        text: menuUIKtit[index]["name"].toString(),
                        textLines: 1,
                        color: AppColors.black,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
