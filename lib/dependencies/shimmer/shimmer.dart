import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/app_colors.dart';

class ShimmerDependencies {
  Widget shimmer(Widget widget) {
    return Shimmer.fromColors(baseColor: AppColors.gray, highlightColor: AppColors.gray1, enabled: true, child: widget);
  }
}
