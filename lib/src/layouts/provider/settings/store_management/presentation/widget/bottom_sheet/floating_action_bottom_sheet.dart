import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';

class FloatingActionBottomSheet extends StatefulWidget {
  const FloatingActionBottomSheet._(
    this.title,
    this.hintText,
    this.onConfirmed,
  );
  final String title;
  final String hintText;
  final void Function(String value)? onConfirmed;

  static void showModalBottomSheet(
    BuildContext context, {
    required String title,
    required String hintText,
    void Function(String value)? onConfirmed,
  }) async =>
      await showAppModalBottomSheet(
          context: context,
          child: FloatingActionBottomSheet._(
            title,
            hintText,
            onConfirmed,
          ));

  @override
  State<FloatingActionBottomSheet> createState() =>
      _FloatingActionBottomSheetState();
}

class _FloatingActionBottomSheetState extends State<FloatingActionBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameField(
          label: widget.title,
          hint: widget.hintText,
          controller: _nameController,
        ),
        const Gap(24),
        AppButton(
            text: appLocalizer.confirm,
            onPressed: () {
              widget.onConfirmed?.call(_nameController.text);
            })
      ],
    );
  }
}
