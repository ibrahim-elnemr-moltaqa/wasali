import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/inputs/bank_account_number_field.dart';
import 'package:wasli/material/inputs/iban_field.dart';
import 'package:wasli/material/inputs/identity_number_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/entity/delivery_user_entity.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_bank_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/bank_info_cubit.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/delivery_cubit.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/banks/banks_drop_down.dart';

class DeliveryUpdateBankDataPage extends StatefulWidget {
  const DeliveryUpdateBankDataPage({super.key});

  @override
  State<DeliveryUpdateBankDataPage> createState() =>
      _DeliveryUpdateBankDataPageState();
}

class _DeliveryUpdateBankDataPageState
    extends State<DeliveryUpdateBankDataPage> {
  TextEditingController ibanController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  ValueNotifier<CommonEntity?> bank = ValueNotifier(null);

  @override
  void dispose() {
    ibanController.dispose();
    identityNumberController.dispose();
    bankAccountNumberController.dispose();
    bank.dispose();
    super.dispose();
  }

  void onBankInfo(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final params = DeliveryBankInfoParams(
          bankID: bank.value!.id,
          iban: ibanController.text,
          accountNumber: bankAccountNumberController.text,
          nationalID: identityNumberController.text,
          isUpdate: true);
      context.read<BankInfoCubit>().bankInfo(params);
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryCubit()..getDelivery(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton()
              .setBorder(
                radius: 12,
              )
              .paddingAll(8),
          title: Text(appLocalizer.bank_account_data),
          centerTitle: false,
        ),
        body: BlocBuilder<DeliveryCubit, Async>(
          builder: (context, state) {
            return HandleResponseWidget(
                status: state,
                onRetry: () => context.read<DeliveryCubit>().getDelivery(),
                onSuccess: (data) {
                  final delivery = data as DeliveryUserEntity;
                  ibanController.text = delivery.deliveryBankInfo.iban;
                  identityNumberController.text =
                      delivery.deliveryBankInfo.nationalId;
                  bankAccountNumberController.text =
                      delivery.deliveryBankInfo.accountNumber;
                  bank.value = delivery.deliveryBankInfo.bank;
                  return Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ValueListenableBuilder(
                              valueListenable: bank,
                              builder: (context, value, child) {
                                return BanksDropDown(
                                  bank: bank.value,
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
                          const SizedBox(
                            height: 27,
                          ),
                          BlocProvider(
                            create: (context) => BankInfoCubit(),
                            child: BlocConsumer<BankInfoCubit, Async>(
                              listener: (context, state) {
                                if (state.isFailure) {
                                  AppToasts.error(context,
                                      message: state.errorMessage ?? '');
                                } else {
                                  AppToasts.success(context,
                                      message: appLocalizer
                                          .profileUpdateSuccessMessage);
                                }
                              },
                              builder: (context, state) {
                                return AppButton(
                                  isLoading: state.isLoading,
                                  text: appLocalizer.change,
                                  onPressed: () => onBankInfo(context),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ).paddingHorizontal(20),
      ),
    );
  }
}
