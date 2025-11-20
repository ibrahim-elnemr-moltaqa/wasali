import 'package:flutter/material.dart';
import '../../../../../core/core.dart';
import '../../../../../material/media/svg_icon.dart';

class AuthenticationHeaderWidget extends StatelessWidget {
  const AuthenticationHeaderWidget(
      {super.key,
      this.hasLogo = true,
      this.header,
      this.subHeader,
      this.style,
      this.padding,
      this.wrapWithSafeArea = false,
      this.bottom,
      this.top});
  final bool hasLogo;
  final Text? header;
  final String? subHeader;
  final TextStyle? style;
  final EdgeInsets? padding;
  final bool wrapWithSafeArea;
  final bool? bottom;
  final bool? top;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: wrapWithSafeArea
          ? SafeArea(
              bottom: bottom ?? true,
              top: top ?? true,
              child: _buildHeader(),
            )
          : _buildHeader(),
    );
  }

  Column _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasLogo)
          AppSvgIcon(
            path: AppIcons.circleLogoIc,
            width: 90,
            fit: BoxFit.fitWidth,
          ),
        if (hasLogo) const SizedBox(height: 32),
        if (header != null) header!,
        if (header != null) const SizedBox(height: 12),
        if (subHeader != null && subHeader?.isNotEmpty == true)
          Text(
            subHeader!,
            style: TextStyles.regular14.copyWith(color: AppColors.text2),
            textAlign: TextAlign.center,
          )
      ],
    );
  }
}
