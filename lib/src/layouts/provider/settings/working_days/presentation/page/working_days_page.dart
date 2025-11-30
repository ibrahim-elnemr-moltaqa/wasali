import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/src/layouts/provider/settings/working_days/data/model/working_day_model.dart';
import 'package:wasli/src/layouts/provider/settings/working_days/presentation/widget/working_day_item.dart';

class WorkingTimePage extends StatefulWidget {
  const WorkingTimePage({super.key});

  @override
  State<WorkingTimePage> createState() => _WorkingTimePageState();
}

class _WorkingTimePageState extends State<WorkingTimePage> {
  List<WorkingDayModel> workingDays = [WorkingDayModel()];

  void _addWorkingDay() {
    setState(() {
      workingDays.add(WorkingDayModel());
    });
  }

  void _removeWorkingDay(int index) {
    setState(() {
      workingDays.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizer.workingTime),
      ),
      body: ListView.separated(
        itemCount: workingDays.length,
        separatorBuilder: (_, __) => const Gap(20),
        itemBuilder: (context, index) {
          if (workingDays.isEmpty) {
            return const Text('Empty');
          }
          return WorkingDayItem(
            model: workingDays[index],
            onDelete: () => _removeWorkingDay(index),
            onChanged: (updatedModel) {
              workingDays[index] = updatedModel;
            },
          );
        },
      ).paddingAll(20),
      bottomNavigationBar: AppButton(
              text: appLocalizer.add_another_day, onPressed: _addWorkingDay)
          .paddingAll(20),
    );
  }
}
