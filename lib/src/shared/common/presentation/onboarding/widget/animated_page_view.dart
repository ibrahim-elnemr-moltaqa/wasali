import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedPageView extends StatelessWidget {
  const AnimatedPageView({
    super.key,
    required this.controller,
    required this.children,
  });
  final PageController controller;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: children.length,
        itemBuilder: (context, index) {
          final child = children[index];
          return ZoomIn(child: child);
        },
      ),
    );
  }
}
