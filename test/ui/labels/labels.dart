import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

class Labels extends StatefulWidget {
  const Labels({super.key});

  @override
  State<Labels> createState() => _LabelsState();
}

class _LabelsState extends State<Labels> {

  var expanded = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children:  const [
               SizedBox(
                height: 68,
              ),
               UILabels.bold(text: "32px -Bold ", textLines: 1,color: AppColors.black,fontSize: 32,),
               SizedBox(
                height: 32,
              ),

              UILabels.bold(text: "32px -Bold", textLines: 1,color: AppColors.black,fontSize: 30,),
              SizedBox(
                height: 32,
              ),
              UILabels.bold(text: "24px -Bold", textLines: 1,color: AppColors.black,fontSize: 24,),
              SizedBox(
                height: 32,
              ),
              UILabels.bold(text: "22px -Bold", textLines: 1,color: AppColors.black,fontSize: 22,),
              SizedBox(
                height: 32,
              ),
              UILabels.bold(text: "20px -Bold", textLines: 1,color: AppColors.black,fontSize: 20,),
              SizedBox(
                height: 32,
              ),
              UILabels.bold(text: "18px -Bold", textLines: 1,color: AppColors.black,fontSize: 18,),
              SizedBox(
                height: 32,
              ),
              UILabels.bold(text: "14px -Bold ", textLines: 1,color: AppColors.black,fontSize: 14,),
              SizedBox(
                height: 32,
              ),
              UILabels.regular(text: "14px -Regular 14", textLines: 1,color: AppColors.black,fontSize: 14,),
              SizedBox(
                height: 32,
              ),
              UILabels.regular(text: "12px -Regular 12", textLines: 1,color: AppColors.black,fontSize: 12,),
              SizedBox(
                height: 32,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
