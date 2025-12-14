import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/banks/banks_drop_down_cubit.dart';

import '../drop_down.dart';

class BanksDropDown extends StatelessWidget {
  const BanksDropDown({
    super.key,
    this.bank,
    this.onChanged,
  });
  final CommonEntity? bank;
  final void Function(CommonEntity? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown<CommonEntity>(
      value: bank,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      hint: appLocalizer.bankName,
      borderRadius: 12,
      cubit: BanksDropDownCubit(),
    );
  }
}
