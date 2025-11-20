import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/picker/media_picker_bottomsheet.dart';
import 'package:wasli/material/media/svg_icon.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    super.key,
    this.onPickImage,
    this.onDeleteImage,
  });
  final void Function(File)? onPickImage;
  final VoidCallback? onDeleteImage;
  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: profileImage != null
                    ? ClipOval(
                        child: Image.file(
                          profileImage!,
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
                      setState(() => profileImage = File(media.path));
                      widget.onPickImage?.call(profileImage ?? File(''));
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
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            setState(() => profileImage = null);
            widget.onDeleteImage?.call();
          },
          child: Text(
            appLocalizer.delete_image,
            style: TextStyles.regular12.copyWith(color: AppColors.red600),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
