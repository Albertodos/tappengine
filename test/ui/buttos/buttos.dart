import 'package:flutter/material.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:tappengine/widgets/ui_kits/button_ui/button_ui.dart';
import 'package:tappengine/widgets/ui_kits/labels_ui/label_ui.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 68,
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: UIBottons(
                      labels: const UILabels(
                        text: "Button",
                        textLines: 1,
                      ),
                      colorList: const [],
                      cb: (v) {})),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: UIBottons(
                      disabled: true,
                      labels: const UILabels(
                        text: "Button",
                        textLines: 1,
                        color: AppColors.black,
                      ),
                      colorList: const [],
                      cb: (v) {})),
              const SizedBox(
                height: 32,
              ),
              SizedBox(height: 50, child: UIBottons(labels: const Icon(Icons.access_alarm), colorList: const [], cb: (v) {}).flo()),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: UIBottons(
                          labels: const UILabels(
                            text: "Button",
                            textLines: 1,
                            color: AppColors.black,
                          ),
                          colorList: const [],
                          cb: (v) {})
                      .out(Colors.green.withAlpha(0))),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: UIBottons(
                          labels: const UILabels(
                            text: "Button",
                            textLines: 1,
                            color: AppColors.black,
                          ),
                          colorList: const [],
                          cb: (v) {})
                      .outTranparent()),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: UIBottons(
                          labels: const UILabels(
                            text: "Button",
                            textLines: 1,
                            color: AppColors.black,
                          ),
                          colorList: const [AppColors.green, AppColors.blue],
                          cb: (v) {})
                      .getInk(context)),
            ],
          ),
        ),
      ),
    );
  }
}
