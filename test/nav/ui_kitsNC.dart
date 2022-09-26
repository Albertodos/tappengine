import 'package:flutter/material.dart';

import '../ui/buttos/buttos.dart';
import '../ui/dropdown/dropdown.dart';
import '../ui/labels/labels.dart';
import '../ui/textfields/text_fields.dart';

class UIKitsNav extends StatefulWidget {
  final Widget root;
  const UIKitsNav({super.key, required this.root});
  @override
  State<UIKitsNav> createState() => _UIKitsNavState();
}

class _UIKitsNavState extends State<UIKitsNav> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI KITS',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => widget.root,
        '/buttos': (context) => const Buttons(),
        '/textFields': (context) => const TextFields(),
        '/dropdown': (context) => const Dropdowns(),
        '/labels': (context) => const Labels(),
      },
    );
  }
}