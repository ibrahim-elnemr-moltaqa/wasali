import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wasli/core/config/theme/app_theme.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/picker/media_picker_bottomsheet.dart';
import 'package:wasli/material/inputs/validator_field.dart';
import 'package:wasli/material/media/svg_icon.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    super.key,
    required this.onPickImage,
    this.onDeleteImage,
    this.initialImage,
  });
  final void Function(File? file) onPickImage;
  final VoidCallback? onDeleteImage;
  final String? initialImage;

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  File? profileImage;
  bool hasDeletedInitialImage = false;

  bool get hasImage =>
      profileImage != null ||
      (widget.initialImage != null && !hasDeletedInitialImage);

  @override
  Widget build(BuildContext context) {
    return ValidatorField<File>(
        validator: (value) {
          if (value == null &&
              (widget.initialImage == null || hasDeletedInitialImage)) {
            return appLocalizer.fieldRequired;
          }
          return null;
        },
        value: profileImage,
        onSaved: (value) => widget.onPickImage(value),
        build: (context, hasError, errorMessage, value, onChange, onSave,
                validate) =>
            AnimatedSize(
              duration: Durations.medium3,
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                padding: hasError
                    ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                    : EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: hasError
                      ? getThemeColor(
                          lightColor: AppColors.red50,
                          darkColor: AppColors.canvasBackgroundColor,
                        )
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.disableindicatorColor),
                            child: hasImage
                                ? ClipOval(
                                    child: profileImage != null
                                        ? Image.file(
                                            profileImage!,
                                            fit: BoxFit.cover,
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: widget.initialImage!,
                                            fit: BoxFit.cover,
                                          ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: AppSvgIcon(
                                      path: AppIcons.profile,
                                    ),
                                  )),
                        PositionedDirectional(
                            end: 0,
                            child: InkWell(
                              onTap: () => MediaPickerBottomSheet.show(context,
                                  onMediaPicked: (media) {
                                if (media.path.isNotEmpty) {
                                  final file = File(media.path);
                                  setState(() {
                                    profileImage = file;
                                    hasDeletedInitialImage = false;
                                  });
                                  widget.onPickImage(file);
                                  onChange(file);
                                }
                              }),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.primary100,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AppSvgIcon(
                                    path: AppIcons.camera,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                    if (hasImage) ...[
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          setState(() {
                            profileImage = null;
                            hasDeletedInitialImage = true;
                          });
                          widget.onDeleteImage?.call();
                          onChange(null);
                        },
                        child: Text(
                          appLocalizer.delete_image,
                          style: TextStyles.regular12
                              .copyWith(color: AppColors.red600),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    if (errorMessage?.isNotEmpty == true)
                      Text(
                        errorMessage ?? '',
                        style:
                            Theme.of(context).inputDecorationTheme.errorStyle,
                      )
                  ],
                ),
              ),
            ));
  }
}
