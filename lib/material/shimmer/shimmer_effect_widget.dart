import 'package:flutter/material.dart';

class ShimmerWidget extends StatefulWidget {
  final Widget child;
  final bool startAnim;
  final Color startColor;
  final Color endColor;

  ShimmerWidget({
    Key? key,
    required this.child,
    this.startAnim = true,
    this.startColor = Colors.white,
    this.endColor = Colors.grey,
  }) : super(key: key ?? UniqueKey());

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Color?> colorTween;
  late final Animation<Color?> colorTweenReverse;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    colorTween = ColorTween(begin: widget.startColor, end: widget.endColor)
        .animate(animationController);
    colorTweenReverse =
        ColorTween(begin: widget.endColor, end: widget.startColor)
            .animate(animationController);

    if (widget.startAnim) {
      animationController.forward();
    }

    animationController.addListener(() {
      if (widget.startAnim) {
        if (animationController.isCompleted) {
          animationController.reverse();
        } else if (animationController.isDismissed) {
          animationController.forward();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.startAnim,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            if (!widget.startAnim) {
              return child!;
            }
            return ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return LinearGradient(
                        colors: [colorTween.value!, colorTweenReverse.value!])
                    .createShader(bounds);
              },
              child: child,
            );
          },
          child: widget.child),
    );
  }
}
