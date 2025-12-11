import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/register/domain/use_case/provider_register_main_information_use_case.dart';
import 'package:wasli/src/layouts/provider/register/presentation/provider_register_cubit/main_information/main_information_cubit.dart';

class ServiceProviderStep extends StatefulWidget {
  const ServiceProviderStep({super.key, required this.onStepSucceeded});

  final Function(int, IntelPhoneNumberEntity) onStepSucceeded;

  @override
  State<ServiceProviderStep> createState() => _ServiceProviderStepState();
}

class _ServiceProviderStepState extends State<ServiceProviderStep> {
  ValueNotifier<IntelPhoneNumberEntity?> phoneNumber = ValueNotifier(null);
  ValueNotifier<IntelPhoneNumberEntity?> whatsAppPhoneNumber =
      ValueNotifier(null);
  final TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> firstStepFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumber.dispose();
    whatsAppPhoneNumber.dispose();
    super.dispose();
  }

  void onRegisterMainInformation(BuildContext context) {
    if (phoneNumber.value != null && whatsAppPhoneNumber.value != null) {
      final params = MainInformationsParams(
        name: nameController.text,
        mobile: phoneNumber.value!.number,
        whatsApp: whatsAppPhoneNumber.value!.number,
      );
      context.read<MainInformationCubit>().registerMainInformation(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainInformationCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Form(
          key: firstStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NameField(
                  controller: nameController,
                  hint: appLocalizer.enterName,
                  label: appLocalizer.name,
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder(
                    valueListenable: phoneNumber,
                    builder: (context, value, child) {
                      return IntelPhoneField(
                        initialValue: phoneNumber.value,
                        label: appLocalizer.phoneNumber,
                        onChange: (phoneNumber) {
                          this.phoneNumber.value = phoneNumber;
                        },
                        hint: appLocalizer.enterPhoneNumber,
                      );
                    }),
                const SizedBox(height: 12),
                ValueListenableBuilder(
                    valueListenable: whatsAppPhoneNumber,
                    builder: (context, value, child) {
                      return IntelPhoneField(
                        initialValue: whatsAppPhoneNumber.value,
                        label: appLocalizer.whatsApp_number,
                        onChange: (whatsAppNumber) {
                          whatsAppPhoneNumber.value = whatsAppNumber;
                        },
                        hint: appLocalizer.enter_whatsapp_number,
                      );
                    }),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocConsumer<MainInformationCubit, Async>(
          listener: (context, state) {
            if (state.isSuccess) {
              widget.onStepSucceeded(1, phoneNumber.value!);
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
                      if (firstStepFormKey.currentState!.validate()) {
                        onRegisterMainInformation(context);
                      }
                    }),
              ],
            );
          },
        ).paddingBottom(16),
      ),
    );
  }
}
