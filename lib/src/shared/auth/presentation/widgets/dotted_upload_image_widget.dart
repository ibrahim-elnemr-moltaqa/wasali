import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wasli/core/config/theme/app_theme.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/picker/media_picker_bottomsheet.dart';
import 'package:wasli/material/dotted_decoration/dotted_decoration.dart';
import 'package:wasli/material/inputs/validator_field.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/material/media/svg_icon.dart';

class DottedUploadImageWidget extends StatefulWidget {
  const DottedUploadImageWidget({
    super.key,
    required this.title,
    required this.onChanged,
    this.initialValue,
    this.onDelete,
  });
  final String title;
  final void Function(File? file) onChanged;
  final String? initialValue;
  final void Function()? onDelete;

  @override
  State<DottedUploadImageWidget> createState() =>
      _DottedUploadImageWidgetState();
}

class _DottedUploadImageWidgetState extends State<DottedUploadImageWidget> {
  File? file;

  bool get hasImage =>
      file != null ||
      (widget.initialValue != null && widget.initialValue!.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return ValidatorField<File>(
        validator: (value) {
          if (value == null &&
              (widget.initialValue == null || widget.initialValue!.isEmpty)) {
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
              child: Column(
                children: [
                  Container(
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // if (hasImage) ...{
                        //   Text(
                        //     widget.title,
                        //     style: TextStyles.regular12
                        //         .copyWith(color: AppColors.textInputField),
                        //   ),
                        //   const SizedBox(height: 8),
                        // },
                        Container(
                          height: 110,
                          padding: EdgeInsets.all(hasImage ? 0 : 20),
                          decoration: file != null
                              ? DottedDecoration(
                                  shape: Shape.box,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: hasError
                                      ? getThemeColor(
                                          lightColor: AppColors.red50,
                                          darkColor:
                                              AppColors.canvasBackgroundColor,
                                        )
                                      : AppColors.disableindicatorColor)
                              : BoxDecoration(
                                  border: Border.all(
                                    color: hasError
                                        ? getThemeColor(
                                            lightColor: AppColors.red50,
                                            darkColor:
                                                AppColors.canvasBackgroundColor,
                                          )
                                        : AppColors.disableindicatorColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                          child: hasImage
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: file != null
                                      ? Image.file(
                                          file!,
                                          fit: BoxFit.cover,
                                        )
                                      : AppImage(
                                          path: widget.initialValue!,
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
                                            color:
                                                AppColors.lightTextInputField),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        if (errorMessage?.isNotEmpty == true)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              errorMessage ?? '',
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .errorStyle,
                            ),
                          )
                      ],
                    ).onTapScaleAnimation(onTap: () {
                      MediaPickerBottomSheet.show(context,
                          onMediaPicked: (media) {
                        final newFile = File(media.path);
                        widget.onChanged(newFile);
                        onChange(newFile);
                        setState(() {
                          file = newFile;
                        });
                      });
                    }),
                  ),
                  if (widget.onDelete != null) ...{
                    SizedBox(
                      height: hasImage ? 12 : 0,
                    ),
                    Visibility(
                      visible: widget.initialValue != null &&
                          widget.initialValue!.isNotEmpty,
                      child: Text(appLocalizer.delete_image,
                              style: TextStyles.bold12
                                  .copyWith(color: AppColors.red500))
                          .onTapScaleAnimation(
                        onTap: () => widget.onDelete,
                      ),
                    )
                  }
                ],
              ),
            ));
  }
}
