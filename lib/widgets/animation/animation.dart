import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnimationUI extends StatelessWidget {
  final Widget widget;

  const AnimationUI({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget position(context, selected, start, end) {
    return AnimatedPositioned(
      width: selected ? Get.width - 60 : Get.width - 80,
      height: 50.0,
      top: selected ? start : end,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: widget,
    );
  }

  Widget alpha(context, opacityLevel) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: const Duration(seconds: 1),
      child: widget,
    );
  }

  Widget scale() {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      tween: Tween(begin: 1.0, end: 0.3),
      builder: (context, value, child) {
        // horizontal disposition of the widget.
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: widget,
    );
  }

  Widget scaleX() {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 4),
      curve: Curves.fastOutSlowIn,
      tween: Tween(begin: 1.0, end: 0.3),
      builder: (context, value, child) {
        // horizontal disposition of the widget.
        return Transform.scale(
          // scale: value,
          scaleX: value,
          child: child,
          origin: Offset(0, 0),
          alignment: Alignment.topLeft,
        );
      },
      child: widget,
    );
  }
}
