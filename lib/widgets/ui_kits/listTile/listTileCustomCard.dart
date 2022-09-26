
import 'package:flutter/material.dart';

class ListTitleCustomNotification extends StatelessWidget {
  final String? subtitle;
  final String title;
  final Widget? iconTrailing;
  final Color? textColor;
  const ListTitleCustomNotification({Key? key, this.subtitle, required this.title,this.iconTrailing, this.textColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: subtitle==null ? null:Text(subtitle!, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
      title: Text(title, style:  TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      trailing:  iconTrailing,
    );
  }
}
