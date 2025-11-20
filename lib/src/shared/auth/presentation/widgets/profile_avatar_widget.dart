import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/core.dart';
import '../../../../../core/utils/picker/media_picker_utils.dart';
import '../../../../../material/inputs/validator_field.dart';
import '../../../../../material/media/app_image.dart';
import '../../../../../material/media/svg_icon.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({
    super.key,
    required this.path,
    required this.onSelect,
     this.validator,
  });

  final String? path;
  final void Function(String? image) onSelect;
  final String? Function(String? image)? validator;

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
        return AnimatedSize(
          duration: Durations.medium3,
          reverseDuration: Durations.medium3,
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  final attachment =
                      await MediaPickerUtils.pickImage(ImageSource.gallery);
                  if (attachment != null) {
                    onChange(attachment.path);
                    onSave();
                    validate();
                  }
                },
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.canvasBackgroundColor,
                          border: Border.all(
                            color: borderColor,
                          )),
                      child: Builder(builder: (context) {
                        if (value != null && value.isNotEmpty) {
                          return AppImage.circle(
                            path: value,
                            fit: BoxFit.cover,
                            dimension: double.infinity,
                          );
                        } else {
                          return const AppSvgIcon(
                              path: "assets/icons/user1_ic.svg");
                        }
                      }),
                    ),
                   
                  ],
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
        );
      },
    );
  }
}
