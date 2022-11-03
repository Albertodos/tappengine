import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:tappengine/constants/app_colors.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

import 'model/cms.dart';

class CMSCards extends StatelessWidget {
  final CMS cms;
  const CMSCards({
    super.key,
    required this.cms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.gray1,
            spreadRadius: 0,
            blurRadius: 23,
            offset: Offset(0, 4),
            // changes position of shadow
          ),
        ],
      ),
      width: Get.width - 35,
      height: 300,
      child: HtmlWidget(
        '<iframe style="border-radius:20px" src="${cms.link ?? ""}" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>',
        factoryBuilder: () => MyWidgetFactory(),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {
  // optional: override getter to configure how WebViews are built
  bool get webViewMediaPlaybackAlwaysAllow => true;
  String? get webViewUserAgent => 'My app';
}
