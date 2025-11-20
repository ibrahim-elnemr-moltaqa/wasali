import 'dart:async';
import 'package:wasli/core/config/values/assets.gen.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/core.dart';
import 'validator_field.dart';
import '../overlay/show_modal_bottom_sheet.dart';

typedef PickedDateCallback = void Function(DateTime? dateTime);

class AppDatePickerField extends StatelessWidget {
  const AppDatePickerField({
    super.key,
    this.labelText,
    this.hintText,
    required this.onChange,
    this.value,
    this.mode = CupertinoDatePickerMode.date,
    this.validator,
    this.minimumDate,
    this.maximumDate,
    this.selectableDayPredicate,
    this.dateFormatter,
    this.prefixIconPath,
  });
  final String? labelText;
  final String? hintText;
  final PickedDateCallback onChange;
  final DateTime? value;
  final CupertinoDatePickerMode mode;
  final FormFieldValidator<DateTime?>? validator;
  final String Function(DateTime? date)? dateFormatter;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final String? prefixIconPath;

  final bool Function(DateTime date)? selectableDayPredicate;

  @override
  Widget build(BuildContext context) {
    return ValidatorField<DateTime?>(
      value: value,
      validator: validator,
      onSaved: onChange,
      build:
          (context, hasError, errorMessage, value, onChange, onSave, validate) {
        return DefaultInputFieldDesign(
          title: labelText ?? '',
          borderRadius: 8,
          hint: hintText ?? '',
          hasError: hasError,
          errorMessage: errorMessage ?? '',
          prefixIconPath: prefixIconPath,
          suffixIcon: _suffixIcon(),
          value: _presentText,
          onTap: () async {
            if (mode == CupertinoDatePickerMode.date) {
              DateTime? value = this.value;
              if (minimumDate != null && value?.isAfter(maximumDate!) == true) {
                value = maximumDate;
              }
              await AppDateTimePickers.pickDatePicker(
                context,
                onDateTimeChanged: (dateTime) {
                  onChange(dateTime);
                  onSave();
                  validate();
                },
                initialDate: value,
                maximumDate: maximumDate,
                minimumDate: minimumDate,
                selectableDayPredicate: selectableDayPredicate,
              );
            } else {
              await AppDateTimePickers.pickTime(
                context,
                onDateTimeChanged: (dateTime) {
                  onChange(dateTime);
                  onSave();
                  validate();
                },
                initialDate: value,
              );
            }
          },
        );
      },
    );
  }

  String get _presentText {
    if (value != null) {
      if (mode == CupertinoDatePickerMode.time) {
        return value!.toHHMMa;
      } else {
        if (dateFormatter != null) {
          return dateFormatter!(value!);
        }
        return value!.YYYYMMDD;
      }
    }
    return "";
  }

  Widget _suffixIcon() {
    if (mode == CupertinoDatePickerMode.date) {
      return AppSvgIcon(
        path: Assets.icons.calendar,
        color: AppColors.primary,
      );
    } else {
      return Icon(
        Icons.access_alarm,
        color: AppColors.primary,
      );
    }
  }
}

class AppDateTimePickers extends StatefulWidget {
  const AppDateTimePickers(
      {super.key,
      this.initialDate,
      this.onDateTimeChanged,
      this.mode,
      this.validator,
      this.minimumDate,
      this.maximumDate});

  final DateTime? initialDate;
  final CupertinoDatePickerMode? mode;
  final PickedDateCallback? onDateTimeChanged;

  final String? Function(DateTime? dateTime)? validator;
  final DateTime? minimumDate;
  final DateTime? maximumDate;

  static Future<DateTime?> pickTime(
    BuildContext context, {
    DateTime? initialDate,
    PickedDateCallback? onDateTimeChanged,
    String? Function(DateTime? dateTime)? validator,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    return await showAppModalBottomSheet<DateTime?>(
      context: context,
      child: AppDateTimePickers(
        validator: validator,
        initialDate: initialDate,
        onDateTimeChanged: onDateTimeChanged,
        mode: CupertinoDatePickerMode.time,
      ),
    );
  }

  static Future<DateTime?> pickDatePicker(
    BuildContext context, {
    DateTime? initialDate,
    PickedDateCallback? onDateTimeChanged,
    DateTime? minimumDate,
    DateTime? maximumDate,
    bool Function(DateTime)? selectableDayPredicate,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final DateTime? selectedDate = await showDatePicker(
      cancelText: appLocalizer.back,
      confirmText: appLocalizer.confirm,
      context: context,
      initialDate: initialDate,
      firstDate: minimumDate ?? DateTime.now(),
      currentDate: initialDate,
      routeSettings: const RouteSettings(name: "DateTimeRouteSetting"),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      lastDate:
          maximumDate ?? DateTime.now().add(const Duration(days: 365 * 120)),
      selectableDayPredicate: selectableDayPredicate,
    );
    if (selectedDate != null && onDateTimeChanged != null) {
      onDateTimeChanged(selectedDate);
    }
    return selectedDate;
  }

  static Future<DateTime?> pickDate(
    BuildContext context, {
    DateTime? initialDate,
    PickedDateCallback? onDateTimeChanged,
    DateTime? minimumDate,
    DateTime? maximumDate,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    return await showAppModalBottomSheet<DateTime?>(
        context: context,
        child: AppDateTimePickers(
          initialDate: initialDate,
          onDateTimeChanged: onDateTimeChanged,
          mode: CupertinoDatePickerMode.date,
          minimumDate: minimumDate,
          maximumDate: maximumDate?.add(const Duration(minutes: 30)),
        ));
  }

  @override
  State<AppDateTimePickers> createState() => _AppDateTimePickersState();
}

class _AppDateTimePickersState extends State<AppDateTimePickers> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime?>(
      initialValue: widget.initialDate,
      validator: widget.validator,
      builder: (field) {
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
