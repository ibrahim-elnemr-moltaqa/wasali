import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../core/utils/picker/media_picker_bottomsheet.dart';
import 'validator_field.dart';
import '../media/app_image.dart';
import '../media/svg_icon.dart';
import '../shimmer/gradiant_widget.dart';

class MediaField extends StatelessWidget {
  const MediaField({
    super.key,
    required this.path,
    required this.onSelect,
    this.label = '',
    this.hint = '',
    this.icon = '',
    this.canSelectImage = true,
    this.canSelectVideo = false,
    this.canSelectFile = false,
    this.validator,
  });

  final String? path;
  final void Function(String? image) onSelect;
  final String label;
  final String hint;
  final String icon;
  final bool canSelectImage;
  final bool canSelectVideo;
  final bool canSelectFile;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return ValidatorField<String>(
      value: path,
      validator: validator ?? (value) => Validator(value).profileImageValidator,
      onSaved: onSelect,
      build:
          (context, hasError, errorMessage, value, onChange, onSave, validate) {
        final errorBorderColor = Theme.of(context)
            .inputDecorationTheme
            .errorBorder
            ?.borderSide
            .color;
        final themeBorderColor = Theme.of(context)
            .inputDecorationTheme
            .enabledBorder
            ?.borderSide
            .color;
        final Color borderColor =
            (hasError ? errorBorderColor : themeBorderColor) ??
                AppColors.borderColor;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: AnimatedSize(
            duration: Durations.medium3,
            reverseDuration: Durations.medium3,
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (label.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      label,
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                    ),
                  ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    MediaPickerBottomSheet.show(
                      context,
                      canPickPdf: canSelectFile,
                      canPickImage: canSelectImage,
                      canPickVideo: canSelectVideo,
                      onMultiMediaPicked: (media) {},
                      onMediaPicked: (media) {
                        onChange(media.path);
                        onSave();
                        validate();
                      },
                    );
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.canvasBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: borderColor,
                      ),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 115,
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    alignment: Alignment.center,
                    child: Builder(builder: (context) {
                      if (value != null && value.isNotEmpty) {
                        final IoFileUtils fileUtils = IoFileUtils(value);
                        final fileName = fileUtils.name;
                        final Widget previewWidget;
                        switch (fileUtils.getAttachmentType) {
                          case AttachmentTypeEnum.document:
                          case AttachmentTypeEnum.gif:
                          case AttachmentTypeEnum.audio:
                          case AttachmentTypeEnum.unKnown:
                          // previewWidget = AppSvgIcon(
                          //   path: AppIcons.fileIc,
                          // );
                          case AttachmentTypeEnum.video:
                          // previewWidget = AppSvgIcon(
                          //   path: AppIcons.videoIc,
                          // );
                          case AttachmentTypeEnum.photo:
                            previewWidget = AppImage.rounded(
                              path: value,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            spacing: 12,
                            children: [
                              previewWidget,
                              GradiantWidget(
                                child: Text(
                                  fileName,
                                  style: TextStyles.regular14,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (icon.isNotEmpty) AppSvgIcon(path: icon),
                              if (hint.isNotEmpty)
                                GradiantWidget(
                                  child: Text(
                                    hint,
                                    style: TextStyles.regular14,
                                  ),
                                ),
                            ],
                          ),
                        );
                      }
                    }),
                  ),
                ),
                if (errorMessage?.isNotEmpty == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      errorMessage ?? '',
                      style: Theme.of(context).inputDecorationTheme.errorStyle,
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
