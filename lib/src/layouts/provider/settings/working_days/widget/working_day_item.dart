import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/date_time_field.dart';
import 'package:wasli/src/layouts/provider/authentication/data/model/working_day_model.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class WorkingDayItem extends StatelessWidget {
  final WorkingDayModel model;
  final VoidCallback onDelete;
  final ValueChanged<WorkingDayModel> onChanged;

  const WorkingDayItem({
    super.key,
    required this.model,
    required this.onDelete,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppSingleDropDown(
                value: model.day,
                items: [
                  'Saturday',
                  'Sunday',
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday'
                ],
                itemDisplay: (item) => item,
                onChanged: (value) {
                  model.day = value;
                  onChanged(model);
                },
                title: appLocalizer.day,
                hint: appLocalizer.select_day,
                borderRadius: 12,
              ),
            ),
            const Gap(8),
            Icon(
              Iconsax.trash_copy,
              color: AppColors.red500,
            )
                .setBorder(radius: 12, padding: const EdgeInsets.all(10))
                .onTapScaleAnimation(onTap: onDelete)
                .paddingTop(24),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: AppDatePickerField(
                hintText: '10:00 AM',
                labelText: appLocalizer.from,
                mode: CupertinoDatePickerMode.time,
                value: model.fromTime,
                onChange: (date) {
                  model.fromTime = date;
                  onChanged(model);
                },
              ),
            ),
            const Gap(8),
            Expanded(
              child: AppDatePickerField(
                hintText: '10:00 AM',
                labelText: appLocalizer.to,
                mode: CupertinoDatePickerMode.time,
                value: model.toTime,
                onChange: (date) {
                  model.toTime = date;
                  onChanged(model);
                },
              ),
            ),
          ],
        )
      ],
    ).fadeInLeft();
  }
}
