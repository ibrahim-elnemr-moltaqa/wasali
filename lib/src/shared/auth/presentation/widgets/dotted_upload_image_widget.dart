import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wasli/core/config/theme/app_theme.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/picker/media_picker_bottomsheet.dart';
import 'package:wasli/material/dotted_decoration/dotted_decoration.dart';
import 'package:wasli/material/inputs/validator_field.dart';
import 'package:wasli/material/media/svg_icon.dart';

class DottedUploadImageWidget extends StatefulWidget {
  const DottedUploadImageWidget({
    super.key,
    required this.title,
    required this.onChanged,
  });
  final String title;
  final void Function(File? file) onChanged;

  @override
  State<DottedUploadImageWidget> createState() =>
      _DottedUploadImageWidgetState();
}

class _DottedUploadImageWidgetState extends State<DottedUploadImageWidget> {
  File? file;
  @override
  Widget build(BuildContext context) {
    return ValidatorField<File>(
        validator: (value) {
          if (value == null) {
            return appLocalizer.fieldRequired;
          }
          return null;
        },
        value: file,
        onSaved: (value) => widget.onChanged(value),
        build: (context, hasError, errorMessage, value, onChange, onSave,
                validate) =>
            AnimatedSize(
              duration: Durations.medium3,
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                decoration: BoxDecoration(
                  color: hasError
                      ? getThemeColor(
                          lightColor: AppColors.red50,
                          darkColor: AppColors.canvasBackgroundColor,
                        )
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      padding: EdgeInsets.all(file != null ? 0 : 20),
                      decoration: DottedDecoration(
                          shape: Shape.box,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: hasError
                              ? getThemeColor(
                                  lightColor: AppColors.red50,
                                  darkColor: AppColors.canvasBackgroundColor,
                                )
                              : AppColors.disableindicatorColor),
                      child: file != null
                          ? ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.file(
                                file!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppSvgIcon(
                                    path: AppIcons.uploadImage,
                                    size: 24,
                                  ),
                                  Text(
                                    widget.title,
                                    style: TextStyles.regular12.copyWith(
                                        color: AppColors.textInputField),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'png,jpeg',
                                    style: TextStyles.regular12.copyWith(
                                        color: AppColors.lightTextInputField),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    if (errorMessage?.isNotEmpty == true)
                      Text(
                        errorMessage ?? '',
                        style:
                            Theme.of(context).inputDecorationTheme.errorStyle,
                      )
                  ],
                ).onTapScaleAnimation(onTap: () {
                  MediaPickerBottomSheet.show(context, onMediaPicked: (media) {
                    widget.onChanged(File(media.path));
                    onChange(File(media.path));
                    setState(() {
                      file = File(media.path);
                    });
                  });
                }),
              ),
            ));
  }
}
