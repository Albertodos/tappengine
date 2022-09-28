import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class UILabels extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int textLines;

  const UILabels(
      {super.key,
      required this.text,
      this.color = AppColors.white,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.textDecoration = TextDecoration.none,
      this.textAlign = TextAlign.left,
      required this.textLines});
  const UILabels.extraBold({
    super.key,
    required this.text,
    this.color = AppColors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.left,
    required this.textLines,
  });
  const UILabels.bold({
    super.key,
    required this.text,
    this.color = AppColors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.left,
    required this.textLines,
  });
  const UILabels.regular({
    super.key,
    required this.text,
    this.color = AppColors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.left,
    required this.textLines,
  });
  const UILabels.semiBold({
    super.key,
    required this.text,
    this.color = AppColors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.left,
    required this.textLines,
  });

  @override
  Widget build(BuildContext context) {
    return textLines != 0
        ? Text(
            text,
            textAlign: textAlign,
            maxLines: textLines,
            style: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: color,
                decoration: textDecoration,
                decorationColor: color,
                height: 1.9),
          )
        : Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: color,
                decoration: textDecoration,
                decorationColor: color,
                height: 1.9),
          );
  }
}
