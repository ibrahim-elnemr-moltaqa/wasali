import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/inputs/avatar_widget.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/entity/delivery_user_entity.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_main_info_use_case.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/delivery_cubit.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/delivery_authentication_cubit/delviery_main_info_cubit.dart';
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import 'package:wasli/src/shared/auth/presentation/delete_account/delete_account_bottom_sheet.dart';
import 'package:wasli/src/shared/common/domain/entity/gender_enum.dart';

class DeliveryUpdateProfilePage extends StatefulWidget {
  const DeliveryUpdateProfilePage({super.key});

  @override
  State<DeliveryUpdateProfilePage> createState() =>
      _DeliveryUpdateProfilePageState();
}

class _DeliveryUpdateProfilePageState extends State<DeliveryUpdateProfilePage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  PhoneEntity? whatsAppNumber;
  ValueNotifier<GenderEnum?> gender = ValueNotifier(null);
  ValueNotifier<File?> image = ValueNotifier(null);
  String? avatarFromApi;
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
          title: Text(appLocalizer.acccountInformation),
          centerTitle: false,
        ),
        body: BlocBuilder<DeliveryCubit, Async>(
          builder: (context, state) {
            return HandleResponseWidget(
                status: state,
                onRetry: () => context.read<DeliveryCubit>().getDelivery(),
                onSuccess: (data) {
                  final delivery = data as DeliveryUserEntity;
                  firstNameController.text = delivery.firstName;
                  lastNameController.text = delivery.lastName;
                  avatarFromApi = delivery.image.path;
                  whatsAppNumber = IntelPhoneNumberEntity.fromCompleteNumber(
                    completeNumber: delivery.whatsapp
                        .replaceFirstCharWithCountryCode('+966'),
                  ).getPhoneEntity;
                  gender.value = GenderEnum.fromApiValue(delivery.gender);
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            ValueListenableBuilder(
                                valueListenable: image,
                                builder: (context, value, child) {
                                  return AvatarWidget(
                                    initialImage: avatarFromApi,
                                    onPickImage: (file) {
                                      image.value = file;
                                    },
                                  );
                                }),
                            Row(
                              children: [
                                Expanded(
                                  child: NameField(
                                    label: appLocalizer.first_name,
                                    controller: firstNameController,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: NameField(
                                    label: appLocalizer.last_name,
                                    controller: lastNameController,
                                  ),
                                ),
                              ],
                            ),
                            IntelPhoneField(
                              initialValue:
                                  whatsAppNumber?.toIntelPhoneEntity(),
                              label: appLocalizer.whatsApp_number,
                              onChange: (phoneNumber) {
                                whatsAppNumber = phoneNumber.getPhoneEntity;
                              },
                            ),
                            ValueListenableBuilder(
                                valueListenable: gender,
                                builder: (context, value, child) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: RadioMenuButton(
                                          toggleable: true,
                                          value: GenderEnum.male,
                                          groupValue: value,
                                          onChanged: (value) {
                                            gender.value = GenderEnum.male;
                                          },
                                          child: Text(appLocalizer.male),
                                        ).setBorder(
                                          radius: 12,
                                        ),
                                      ),
                                      const Gap(12),
                                      Expanded(
                                        child: RadioMenuButton<GenderEnum>(
                                          value: GenderEnum.female,
                                          groupValue: value,
                                          onChanged: (value) {
                                            gender.value = GenderEnum.female;
                                          },
                                          child: Text(appLocalizer.female),
                                        ).setBorder(
                                          radius: 12,
                                        ),
                                      ),
                                      const Gap(12),
                                      Expanded(
                                        child: RadioMenuButton<GenderEnum>(
                                          value: GenderEnum.other,
                                          groupValue: value,
                                          onChanged: (value) {
                                            gender.value = GenderEnum.other;
                                          },
                                          child: Text(appLocalizer.other),
                                        ).setBorder(
                                          radius: 12,
                                        ),
                                      )
                                    ],
                                  ).setTitle(title: appLocalizer.gender);
                                }),
                            const Gap(64),
                            BlocProvider(
                              create: (context) => DeliveryMainInfoCubit(),
                              child: BlocConsumer<DeliveryMainInfoCubit, Async>(
                                listener: (context, state) {
                                  if (state.isFailure) {
                                    AppToasts.error(context,
                                        message: state.errorMessage ?? '');
                                  } else if (state.isSuccess) {
                                    AppAuthenticationBloc.of(context)
                                        .add(AuthenticatedEvent());
                                    AppToasts.success(context,
                                        message: appLocalizer
                                            .profileUpdateSuccessMessage);
                                  }
                                },
                                builder: (context, state) {
                                  return AppButton(
                                      isLoading: state.isLoading,
                                      text: appLocalizer.saveChanges,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          context
                                              .read<DeliveryMainInfoCubit>()
                                              .deliveryMainInformation(
                                                  DeliveryMainInformationParams(
                                                      fName: firstNameController
                                                          .text,
                                                      lName: lastNameController
                                                          .text,
                                                      whatsApp: whatsAppNumber!
                                                          .numberWithZeroIfNot,
                                                      image: image.value,
                                                      gender: gender.value,
                                                      isUpdate: true));
                                        }
                                      });
                                },
                              ),
                            ),
                            const Gap(24),
                            Text(
                              appLocalizer.deleteAccount,
                              style: TextStyles.bold16
                                  .copyWith(color: AppColors.error),
                            ).onTapScaleAnimation(
                                onTap: () =>
                                    DeleteAccountBottomSheet.show(context))
                          ],
                        ).paddingHorizontal(20),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
