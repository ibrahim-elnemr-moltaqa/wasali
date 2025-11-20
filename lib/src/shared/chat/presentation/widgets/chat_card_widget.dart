import 'package:wasli/core/core.dart';
import 'package:flutter/material.dart';

class ChatCardWidget extends StatelessWidget {
  final bool isMe;
  const ChatCardWidget({super.key, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: !isMe ? TextDirection.ltr : TextDirection.rtl,
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // if (!TimeStampUtil.isSameDate(
            //   widget.model.createdAt,
            //   widget.nextMessage?.createdAt ?? 0,
            // )) ...[
            //   CustomText(
            //     DateHelper.dayDate(widget.model.createdAt),
            //     style: context.labelSmall.copyWith(
            //       color: AppColors.hintDarkColor,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ).center.withPadding(bottom: 12.h),
            // ],
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: isMe ? null : AppColors.primary50,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(8),
                  bottomRight: const Radius.circular(8),
                  topRight: Radius.circular(isMe ? 8 : 0),
                  topLeft: Radius.circular(isMe ? 0 : 8),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'widget.model.message',
                  ),
                  // if (!TimeStampUtil.isSameDate(
                  //   widget.model.createdAt,
                  //   widget.nextMessage?.createdAt ?? 0,
                  // )) ...[
                  //   CustomText(
                  //     DateHelper.dayDate(widget.model.createdAt),
                  //     style: context.labelSmall.copyWith(
                  //       color: AppColors.hintDarkColor,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ).center.withPadding(bottom: 12.h),
                  // ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
