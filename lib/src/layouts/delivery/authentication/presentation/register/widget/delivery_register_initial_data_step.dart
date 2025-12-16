import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/avatar_widget.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_main_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/delviery_main_info_cubit.dart';

class DeliveryRegisterInitialDataStep extends StatefulWidget {
  const DeliveryRegisterInitialDataStep({
    super.key,
    required this.onStepSucceeded,
  });
  final Function(int, IntelPhoneNumberEntity) onStepSucceeded;

  @override
  State<DeliveryRegisterInitialDataStep> createState() =>
      _DeliveryRegisterInitialDataStepState();
}

class _DeliveryRegisterInitialDataStepState
    extends State<DeliveryRegisterInitialDataStep> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  ValueNotifier<IntelPhoneNumberEntity?> phoneNumber = ValueNotifier(null);
  ValueNotifier<IntelPhoneNumberEntity?> whatsAppPhoneNumber =
      ValueNotifier(null);
  ValueNotifier<File?> profileImage = ValueNotifier(null);

  GlobalKey<FormState> firstStepFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumber.dispose();
    whatsAppPhoneNumber.dispose();
    profileImage.dispose();
    super.dispose();
  }

  void onRegister(BuildContext context) {
    if (firstStepFormKey.currentState!.validate()) {
      final params = DeliveryMainInformationParams(
          fName: firstNameController.text,
          lName: lastNameController.text,
          mobile: phoneNumber.value!.number,
          whatsApp: whatsAppPhoneNumber.value!.number,
          image: profileImage.value!);
      context.read<DeliveryMainInfoCubit>().deliveryMainInformation(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryMainInfoCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: firstStepFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ValueListenableBuilder(
                      valueListenable: profileImage,
                      builder: (context, value, child) {
                        return AvatarWidget(
                          onPickImage: (image) {
                            profileImage.value = image;
                          },
                          onDeleteImage: () {
                            profileImage.value = null;
                          },
                        );
                      }),
                  Row(
                    children: [
                      Expanded(
                        child: NameField(
                          controller: firstNameController,
                          hint: appLocalizer.enterName,
                          label: appLocalizer.first_name,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: NameField(
                          controller: lastNameController,
                          hint: appLocalizer.enterName,
                          label: appLocalizer.last_name,
                        ),
                      ),
                    ],
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
                          onChange: (phoneNumber) {
                            whatsAppPhoneNumber.value = phoneNumber;
                          },
                          hint: appLocalizer.enter_whatsapp_number,
                        );
                      }),
                  const SizedBox(height: 16),
                ]),
          ),
        ),
        bottomNavigationBar: BlocConsumer<DeliveryMainInfoCubit, Async>(
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
                        onRegister(context);
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
