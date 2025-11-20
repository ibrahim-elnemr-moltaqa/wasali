import 'svg_icon.dart';
import 'package:flutter/material.dart';

import 'app_image.dart';

class AppMedia extends StatelessWidget {
  final String path;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final double? radius;
  const AppMedia({super.key, required this.path, this.fit, this.height, this.width, this.radius});

  @override
  Widget build(BuildContext context) {
    if(path.split('.').last == 'svg') {
      return AppSvgIcon(
        path: path,
        fit: fit?? BoxFit.contain,
        height: height,
        width: width,
      );
    }else{ 
      return AppImage(
        path: path,
        fit: fit,
        height: height,
        width: width,
        radius: radius,
      );
    }
  }
}