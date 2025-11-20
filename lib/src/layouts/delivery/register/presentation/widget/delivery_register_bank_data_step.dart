import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/inputs/bank_account_number_field.dart';
import 'package:wasli/material/inputs/iban_field.dart';
import 'package:wasli/material/inputs/identity_number_field.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_cubit.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_state.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class DeliveryRegisterBankDataStep extends StatelessWidget {
  const DeliveryRegisterBankDataStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryRegisterCubit, DeliveryRegisterState>(
      builder: (context, state) {
        final cubit = context.read<DeliveryRegisterCubit>();
        return Form(
          key: cubit.secondStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSingleDropDown(
                  title: appLocalizer.bankName,
                  items: const ['bank1', 'bank2', 'bank3', 'bank4', 'bank5'],
                  onChanged: (value) {
                    cubit.changeBankName(value);
                  },
                  itemDisplay: (displayValue) => displayValue,
                  value: null,
                  hint: appLocalizer.enterBankName,
                  borderRadius: 10,
                  suffixIconPath: AppIcons.arrowDownIc,
                ),
                IbanField(
                  controller: cubit.ibanController,
                ),
                BankAccountNumberField(
                  controller: cubit.bankAccountNumberController,
                ),
                IdentityNumberField(
                  controller: cubit.identityNumberController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
