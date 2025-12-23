import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/settings/working_days/data/model/working_day_model.dart';
import 'package:wasli/src/layouts/provider/settings/working_days/presentation/cubit/working_days_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/working_days/presentation/widget/working_day_item.dart';

class WorkingDaysTimePage extends StatefulWidget {
  const WorkingDaysTimePage({super.key});

  @override
  State<WorkingDaysTimePage> createState() => _WorkingDaysTimePageState();
}

class _WorkingDaysTimePageState extends State<WorkingDaysTimePage> {
  final WorkingDaysCubit _cubit = WorkingDaysCubit();

  @override
  void initState() {
    super.initState();
    _cubit.getWorkingDays();
  }

  void _addWorkingDay() {
    _cubit.addLocalWorkingDay();
  }

  void _onSave(WorkingDayModel model) {
    if (model.id == null) {
      _cubit.createWorkingDay(model);
    } else {
      _cubit.updateWorkingDay(model.copyWith(method: 'put'));
    }
  }

  void _onDelete(WorkingDayModel model, int index) {
    if (model.id == null) {
      _cubit.removeLocalWorkingDay(index);
    } else {
      _cubit.deleteWorkingDay(model.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizer.workingTime),
        ),
        body: BlocConsumer<WorkingDaysCubit, WorkingDaysState>(
            listener: (context, state) {
          if (state.createWorkingDayState.isSuccess) {
            AppLoadingWidget.removeOverlay();
            AppToasts.success(context,
                message: appLocalizer.yourWorkingHoursAddedSuccessfully);
          } else if (state.createWorkingDayState.isFailure) {
            AppLoadingWidget.removeOverlay();
            AppToasts.error(context,
                message: state.createWorkingDayState.errorMessage ?? '');
          } else if (state.createWorkingDayState.isLoading) {
            AppLoadingWidget.overlay();
          }

          if (state.updateWorkingDayState.isSuccess) {
            AppLoadingWidget.removeOverlay();
            AppToasts.success(context,
                message: appLocalizer.yourWorkingHoursUpdatedSuccessfully);
          } else if (state.updateWorkingDayState.isFailure) {
            AppLoadingWidget.removeOverlay();
            AppToasts.error(context,
                message: state.updateWorkingDayState.errorMessage ?? '');
          } else if (state.updateWorkingDayState.isLoading) {
            AppLoadingWidget.overlay();
          }

          if (state.deleteWorkingDayState.isSuccess) {
            AppLoadingWidget.removeOverlay();
            AppToasts.success(context,
                message: appLocalizer.yourWorkingHoursDeletedSuccessfully);
          } else if (state.deleteWorkingDayState.isFailure) {
            AppLoadingWidget.removeOverlay();
            AppToasts.error(context,
                message: state.deleteWorkingDayState.errorMessage ?? '');
          } else if (state.deleteWorkingDayState.isLoading) {
            AppLoadingWidget.overlay();
          }
        }, builder: (context, state) {
          return HandleResponseWidget(
              status: state.workingDaysState,
              onRetry: () => _cubit.getWorkingDays(),
              successWithoutDataBuilder: () {
                return Center(
                  child: Text(
                    appLocalizer.noData,
                    style: TextStyles.bold16,
                  ),
                );
              },
              onSuccess: (data) {
                final workingDays = state.workingDaysState.data ?? [];
                return ListView.separated(
                  itemCount: workingDays.length,
                  separatorBuilder: (_, __) => const Gap(20),
                  itemBuilder: (context, index) {
                    final model = workingDays[index];
                    return WorkingDayItem(
                      key: ValueKey(model.id ?? 'new_$index'),
                      model: model,
                      onDelete: () => _onDelete(model, index),
                      onSave: _onSave,
                    );
                  },
                ).paddingAll(20);
              });
        }),
        bottomNavigationBar: AppButton(
          text: appLocalizer.add_another_day,
          onPressed: _addWorkingDay,
        ).paddingAll(20),
      ),
    );
  }
}
