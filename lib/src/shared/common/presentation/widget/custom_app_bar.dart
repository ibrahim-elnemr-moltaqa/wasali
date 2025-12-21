import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  final double radius;
  final double elevation;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? title;
  final Color? appBarColor;
  final Color? shadowColor;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;
  final double? leadingWidth;
  final bool automaticallyImplyLeading;
  final BuildContext context;
  final BorderRadiusGeometry? borderRadius;
  final String? leadingIcon;
  final void Function()? leadingOnTap;
  CustomAppBar(
    this.context, {
    super.key,
    this.leadingOnTap,
    this.leadingIcon,
    this.height = kToolbarHeight,
    this.radius = 0,
    this.elevation = 0,
    this.leading,
    this.actions,
    this.title,
    this.appBarColor,
    this.centerTitle,
    this.bottom,
    this.leadingWidth,
    this.shadowColor,
    this.automaticallyImplyLeading = true,
    this.borderRadius,
  }) : super(
          preferredSize: Size.fromHeight(height),
          child: AppBar(
            elevation: elevation,
            backgroundColor: appBarColor ?? AppColors.backgroundColor,
            toolbarHeight: height,
            automaticallyImplyLeading: automaticallyImplyLeading,
            shadowColor: shadowColor,
            centerTitle: centerTitle,
            title: title,
            leading: GestureDetector(
                onTap: leadingOnTap ?? () => Navigator.pop(context),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: leading ??
                        const BackButton().setBorder(
                          radius: 12,
                        ))),
            actions: actions,
            leadingWidth: leadingWidth,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.vertical(
                    bottom: Radius.circular(radius),
                  ),
            ),
            bottom: bottom,
          ),
        );
}
