import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/bank_account_number_field.dart';
import 'package:wasli/material/inputs/iban_field.dart';
import 'package:wasli/material/inputs/identity_number_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_bank_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/bank_info_cubit.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/banks/banks_drop_down.dart';

class DeliveryRegisterBankDataStep extends StatefulWidget {
  const DeliveryRegisterBankDataStep(
      {super.key, required this.onStepSucceeded});
  final ValueChanged<int> onStepSucceeded;

  @override
  State<DeliveryRegisterBankDataStep> createState() =>
      _DeliveryRegisterBankDataStepState();
}

class _DeliveryRegisterBankDataStepState
    extends State<DeliveryRegisterBankDataStep> {
  TextEditingController ibanController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  ValueNotifier<CommonEntity?> bank = ValueNotifier(null);
  GlobalKey<FormState> secondStepFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    ibanController.dispose();
    identityNumberController.dispose();
    bankAccountNumberController.dispose();
    super.dispose();
  }

  void onBankInfo(BuildContext context) {
    if (secondStepFormKey.currentState!.validate()) {
      final params = DeliveryBankInfoParams(
        bankID: bank.value!.id,
        iban: ibanController.text,
        accountNumber: bankAccountNumberController.text,
        nationalID: identityNumberController.text,
      );
      context.read<BankInfoCubit>().bankInfo(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BankInfoCubit(),
      child: Scaffold(
        body: Form(
          key: secondStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: bank,
                    builder: (context, value, child) {
                      return BanksDropDown(
                        onChanged: (value) {
                          bank.value = value;
                        },
                      );
                    }),
                IbanField(
                  controller: ibanController,
                ),
                BankAccountNumberField(
                  controller: bankAccountNumberController,
                ),
                IdentityNumberField(
                  controller: identityNumberController,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocConsumer<BankInfoCubit, Async>(
          listener: (context, state) {
            if (state.isSuccess) {
              widget.onStepSucceeded(2);
            } else if (state.isFailure) {
              AppToasts.error(context, message: state.errorMessage ?? '');
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                    isLoading: state.isLoading,
                    text: appLocalizer.next,
                    onPressed: () {
                      onBankInfo(context);
                    }).paddingBottom(16),
              ],
            );
          },
        ),
      ),
    );
  }
}
