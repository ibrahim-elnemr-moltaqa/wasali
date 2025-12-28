import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/date_time_field.dart';
import 'package:wasli/src/layouts/provider/settings/working_days/data/model/working_day_model.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class WorkingDayItem extends StatefulWidget {
  final WorkingDayModel model;
  final VoidCallback onDelete;
  final Function(WorkingDayModel) onSave;

  const WorkingDayItem({
    super.key,
    required this.model,
    required this.onDelete,
    required this.onSave,
  });

  @override
  State<WorkingDayItem> createState() => _WorkingDayItemState();
}

class _WorkingDayItemState extends State<WorkingDayItem> {
  late WorkingDayModel _tempModel;

  @override
  void initState() {
    super.initState();
    _tempModel = widget.model;
  }

  @override
  void didUpdateWidget(WorkingDayItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != widget.model) {
      _tempModel = widget.model;
    }
  }

  int? day;

  @override
  Widget build(BuildContext context) {
    final bool isModified = _tempModel != widget.model;
    final bool isNew = widget.model.id == null;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppSingleDropDown<WeekDayEnum>(
                value: WeekDayEnumX.fromDayValue(_tempModel.day),
                items: WeekDayEnum.values,
                itemDisplay: (item) => item?.localizedName,
                onChanged: (value) {
                  setState(() {
                    _tempModel = _tempModel.copyWith(
                      day: value?.dayValue,
                    );
                  });
                },
                title: appLocalizer.day,
                hint: appLocalizer.select_day,
                borderRadius: 12,
              ),
            ),
            const Gap(8),
            if (isNew || isModified)
              Icon(
                Iconsax.tick_circle_copy,
                color: AppColors.primary,
              )
                  .setBorder(radius: 12, padding: const EdgeInsets.all(10))
                  .onTapScaleAnimation(onTap: () => widget.onSave(_tempModel))
                  .paddingTop(24),
            const Gap(8),
            Icon(
              Iconsax.trash_copy,
              color: AppColors.red500,
            )
                .setBorder(radius: 12, padding: const EdgeInsets.all(10))
                .onTapScaleAnimation(onTap: widget.onDelete)
                .paddingTop(24),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: AppDatePickerField(
                hintText: '09:00 AM',
                labelText: appLocalizer.from,
                mode: CupertinoDatePickerMode.time,
                value: _tempModel.from != null
                    ? DateFormat('HH:mm').parse(_tempModel.from!)
                    : null,
                onChange: (date) {
                  if (date != null) {
                    setState(() {
                      _tempModel = _tempModel.copyWith(
                          from: DateFormat('HH:mm').format(date));
                    });
                  }
                },
              ),
            ),
            const Gap(8),
            Expanded(
              child: AppDatePickerField(
                hintText: '05:00 PM',
                labelText: appLocalizer.to,
                mode: CupertinoDatePickerMode.time,
                value: _tempModel.to != null
                    ? DateFormat('HH:mm').parse(_tempModel.to!)
                    : null,
                onChange: (date) {
                  if (date != null) {
                    setState(() {
                      _tempModel = _tempModel.copyWith(
                          to: DateFormat('HH:mm').format(date));
                    });
                  }
                },
              ),
            ),
          ],
        )
      ],
    ).fadeInLeft();
  }
}
