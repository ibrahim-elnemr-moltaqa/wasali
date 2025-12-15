import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/avatar_widget.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/client/profile/client_edit_profile_cubit.dart';
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import 'package:wasli/src/shared/auth/domain/use_case/update_profile_usecase.dart';
import 'package:wasli/src/shared/auth/presentation/delete_account/delete_account_bottom_sheet.dart';
import 'package:wasli/src/shared/common/domain/entity/gender_enum.dart';

class ClientEditProfilePage extends StatefulWidget {
  const ClientEditProfilePage({super.key});

  @override
  State<ClientEditProfilePage> createState() => _ClientEditProfilePageState();
}

class _ClientEditProfilePageState extends State<ClientEditProfilePage> {
  late TextEditingController nameController = TextEditingController();
  late PhoneEntity whatsAppNumber;
  ValueNotifier<GenderEnum?> gender = ValueNotifier(null);
  ValueNotifier<File?> image = ValueNotifier(null);
  String? avatarFromApi;

  @override
  void initState() {
    final state =
        context.read<AppAuthenticationBloc>().state as AuthAuthenticatedState;
    nameController.text = state.user.name;
    whatsAppNumber = state.user.whatsApp;
    gender.value = GenderEnum.fromApiValue(state.user.gender ?? "");
    avatarFromApi = state.user.avatar;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    gender.dispose();
    image.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientEditProfileCubit(),
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
        body: SingleChildScrollView(
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
              NameField(
                label: appLocalizer.username,
                controller: nameController,
              ),
              IntelPhoneField(
                initialValue: whatsAppNumber.getFieldPhoneNumber,
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
                        )
                      ],
                    ).setTitle(title: appLocalizer.gender);
                  }),
              const Gap(24),
              BlocConsumer<ClientEditProfileCubit, ClientEditProfileState>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    AppToasts.success(context,
                        message: appLocalizer.nameUpdatedSuccessfully);
                    AppAuthenticationBloc.of(context).add(AuthenticatedEvent());
                  } else if (state.isFailure) {
                    AppToasts.error(context,
                        message: appLocalizer.somethingWentWrong);
                  }
                },
                builder: (context, state) {
                  return AppButton(
                      isLoading: state.isLoading,
                      text: appLocalizer.saveChanges,
                      onPressed: () {
                        context.read<ClientEditProfileCubit>().updateProfile(
                              UpdateProfileParams(
                                whatsapp: whatsAppNumber.numberWithZeroIfNot,
                                name: nameController.text,
                                gender: gender.value,
                                image: image.value,
                              ),
                            );
                      });
                },
              ),
              const Gap(24),
              Text(
                appLocalizer.deleteAccount,
                style: TextStyles.bold16.copyWith(color: AppColors.error),
              ).onTapScaleAnimation(
                  onTap: () => DeleteAccountBottomSheet.show(context))
            ],
          ).paddingHorizontal(20).withSafeArea(),
        ),
      ),
    );
  }
}
