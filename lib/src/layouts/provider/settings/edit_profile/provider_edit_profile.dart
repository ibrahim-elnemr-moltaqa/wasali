import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import 'package:wasli/src/shared/auth/presentation/delete_account/delete_account_bottom_sheet.dart';

class ProviderEditProfile extends StatefulWidget {
  const ProviderEditProfile({super.key});

  @override
  State<ProviderEditProfile> createState() => _ProviderEditProfileState();
}

class _ProviderEditProfileState extends State<ProviderEditProfile> {
  late TextEditingController nameController = TextEditingController();
  late PhoneEntity phoneNumber;
  late PhoneEntity whatsAppNumber;

  @override
  void initState() {
    super.initState();
    final state =
        context.read<AppAuthenticationBloc>().state as AuthAuthenticatedState;
    nameController.text = state.user.name;
    phoneNumber = state.user.mobile;
    whatsAppNumber = state.user.mobile;
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
        title: Text(appLocalizer.service_provider_data),
        centerTitle: false,
        leading: const BackButton()
            .setBorder(
              radius: 12,
            )
            .paddingAll(8),
      ),
      body: Column(
        children: [
          const Gap(20),
          NameField(
            label: appLocalizer.name,
            controller: nameController,
          ),
          IntelPhoneField(
            label: appLocalizer.phoneNumber,
            controller: TextEditingController(text: phoneNumber.phone),
          ),
          IntelPhoneField(
            label: appLocalizer.whatsApp_number,
            controller: TextEditingController(text: whatsAppNumber.phone),
          ),
          const Gap(100),
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
