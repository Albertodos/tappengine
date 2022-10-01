// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class UIBottons extends StatelessWidget {
  final Widget labels;
  final Color color;
  final Color borderColor;
  final void Function(String) cb;
  // final void Function(bool) cbHover;
  final List<Color> colorList;
  final AlignmentGeometry beginDGD;
  final AlignmentGeometry endDGD;
  final double radius;
  final bool disabled;

  const UIBottons({
    super.key,
    required this.labels,
    this.color = AppColors.purpura,
    required this.colorList,
    required this.cb,
    this.beginDGD = Alignment.bottomCenter,
    this.endDGD = Alignment.topRight,
    this.radius = 8.0,
    this.disabled = false,
    this.borderColor = AppColors.purpura,
  });

  @override
  Widget build(BuildContext context) {
    return eleve();
  }

  Widget eleve() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: disabled ? MaterialStateProperty.all<Color>(AppColors.gray1) : MaterialStateProperty.all<Color>(color),
            //shadowColor: MaterialStateProperty.all<Color>(AppColors.purpura.withOpacity(0.65)),
            //elevation: MaterialStateProperty.all<double>(10),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ))),
        onPressed: disabled ? null : () => cb(""),
        child: labels);
  }

  Widget flo() {
    return FloatingActionButton(
      onPressed: () => cb(""),
      backgroundColor: color,
      child: labels,
    );
  }

  Widget out(bg) {
    return OutlinedButton(
      onPressed: () => cb(""),
      style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: borderColor,
            style: BorderStyle.solid,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: bg),
      child: labels,
    );
  }

  Widget outTranparent() {
    return OutlinedButton(
      onPressed: () => cb("sdf"),
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: color.withAlpha(0), style: BorderStyle.solid, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: labels,
    );
  }

  Widget getInk(context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: beginDGD,
          end: endDGD,
          colors: colorList,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: outTranparent(),
    );
  }
}
