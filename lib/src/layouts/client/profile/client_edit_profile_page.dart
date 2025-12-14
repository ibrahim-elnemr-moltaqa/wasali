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
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import 'package:wasli/src/shared/auth/presentation/delete_account/delete_account_bottom_sheet.dart';

enum Gender { male, female }

class ClientEditProfilePage extends StatefulWidget {
  const ClientEditProfilePage({super.key});

  @override
  State<ClientEditProfilePage> createState() => _ClientEditProfilePageState();
}

class _ClientEditProfilePageState extends State<ClientEditProfilePage> {
  late TextEditingController nameController = TextEditingController();
  late PhoneEntity whatsAppNumber;

  ValueNotifier<Gender> gender = ValueNotifier(Gender.male);

  @override
  void initState() {
    final state =
        context.read<AppAuthenticationBloc>().state as AuthAuthenticatedState;
    nameController.text = state.user.name;
    whatsAppNumber = state.user.mobile;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton()
            .setBorder(
              radius: 12,
            )
            .paddingAll(8),
        title: Text(appLocalizer.acccountInformation),
        centerTitle: false,
      ),
      body: Column(
        children: [
          AvatarWidget(
            onPickImage: (file) {},
          ),
          NameField(
            label: appLocalizer.username,
            controller: nameController,
          ),
          IntelPhoneField(
            label: appLocalizer.whatsApp_number,
            controller: TextEditingController(text: whatsAppNumber.phone),
          ),
          ValueListenableBuilder(
              valueListenable: gender,
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: RadioMenuButton(
                        toggleable: true,
                        value: Gender.male,
                        groupValue: value,
                        onChanged: (value) {
                          gender.value = Gender.male;
                        },
                        child: Text(appLocalizer.male),
                      ).setBorder(
                        radius: 12,
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: RadioMenuButton<Gender>(
                        value: Gender.female,
                        groupValue: value,
                        onChanged: (value) {
                          gender.value = Gender.female;
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
          AppButton(text: appLocalizer.saveChanges, onPressed: () {}),
          const Gap(24),
          Text(
            appLocalizer.deleteAccount,
            style: TextStyles.bold16.copyWith(color: AppColors.error),
          ).onTapScaleAnimation(
              onTap: () => DeleteAccountBottomSheet.show(context))
        ],
      ).paddingHorizontal(20).withSafeArea(),
    );
  }
}
