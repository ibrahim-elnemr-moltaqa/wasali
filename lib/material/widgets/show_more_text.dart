import '../../core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLength;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLength = 100,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late bool isExpanded;
  late bool shouldTrim;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
    shouldTrim = widget.text.length > widget.trimLength;
  }

  @override
  Widget build(BuildContext context) {
    final displayText = isExpanded || !shouldTrim
        ? widget.text
        : widget.text.substring(0, widget.trimLength).trim();

    final toggleText = isExpanded
        ? ' ${appLocalizer.showLess}'
        : '... ${appLocalizer.showMore}';

    return Text.rich(
      TextSpan(
        text: displayText,
        style: TextStyles.regular14,
        children: shouldTrim
            ? [
                TextSpan(
                  text: toggleText,
                  style: TextStyles.medium14.copyWith(
                    color: AppColors.primary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => setState(() => isExpanded = !isExpanded),
                ),
              ]
            : [],
      ),
      textAlign: TextAlign.start,
    );
  }
}
