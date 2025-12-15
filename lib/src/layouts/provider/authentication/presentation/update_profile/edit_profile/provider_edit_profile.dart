import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_main_information_use_case.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/provider_authentication_cubit/main_information/main_information_cubit.dart';
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String originalName;
  late PhoneEntity originalPhoneNumber;
  late PhoneEntity originalWhatsAppNumber;

  bool isPhoneNumberChanged = false;

  @override
  void initState() {
    super.initState();
    final state =
        context.read<AppAuthenticationBloc>().state as AuthAuthenticatedState;

    nameController.text = state.user.name;
    phoneNumber = state.user.mobile;
    whatsAppNumber = state.user.whatsApp;

    originalName = state.user.name;
    originalPhoneNumber = state.user.mobile;
    originalWhatsAppNumber = state.user.whatsApp;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  bool hasChanges() {
    return nameController.text != originalName ||
        phoneNumber.phone != originalPhoneNumber.phone ||
        whatsAppNumber.phone != originalWhatsAppNumber.phone;
  }

  Map<String, String?> getChangedFields() {
    final Map<String, String?> changedFields = {};

    if (nameController.text != originalName) {
      changedFields['name'] = nameController.text;
    }

    if (phoneNumber.phone != originalPhoneNumber.phone) {
      changedFields['mobile'] = phoneNumber.numberWithZeroIfNot;
      isPhoneNumberChanged = true;
    }

    if (whatsAppNumber.phone != originalWhatsAppNumber.phone) {
      changedFields['whatsApp'] = whatsAppNumber.numberWithZeroIfNot;
    }

    return changedFields;
  }

  void handleSaveChanges(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (!hasChanges()) {
        AppToasts.hint(context, message: 'No changes to save');
        return;
      }
      final changedFields = getChangedFields();
      final params = MainInformationsParams(
          name: changedFields['name'],
          mobile: changedFields['mobile'],
          whatsApp: changedFields['whatsApp'],
          isUpdate: true);

      context.read<MainInformationCubit>().providerMainInformation(params);
    }
  }

  void navigateToOtpScreen(BuildContext context) {
    AppRouter.pushNamed(AppRoutes.otp,
        arguments: OtpScreenArguments(
          phone: phoneNumber.getFieldPhoneNumber,
          caseEnum: OtpScreenCaseEnum.updatePhone,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainInformationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizer.service_provider_data),
          centerTitle: false,
          leading: const BackButton()
              .setBorder(
                radius: 12,
              )
              .paddingAll(8),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Gap(20),
                NameField(
                  label: appLocalizer.name,
                  controller: nameController,
                ),
                IntelPhoneField(
                  initialValue: phoneNumber.getFieldPhoneNumber,
                  label: appLocalizer.phoneNumber,
                  onChange: (phoneNumber) {
                    this.phoneNumber = phoneNumber.getPhoneEntity;
                  },
                ),
                IntelPhoneField(
                  label: appLocalizer.whatsApp_number,
                  initialValue: whatsAppNumber.getFieldPhoneNumber,
                  onChange: (phoneNumber) {
                    whatsAppNumber = phoneNumber.getPhoneEntity;
                  },
                ),
                const Gap(100),
                BlocConsumer<MainInformationCubit, Async>(
                  listener: (context, state) {
                    if (state.isFailure) {
                      AppToasts.error(context,
                          message: state.errorMessage ?? '');
                    } else if (state.isSuccess) {
                      if (isPhoneNumberChanged) {
                        navigateToOtpScreen(context);
                        isPhoneNumberChanged = false;
                      } else {
                        AppToasts.success(context,
                            message: appLocalizer.profileUpdateSuccessMessage);
                        Navigator.pop(context);
                        AppAuthenticationBloc.of(context).add(
                          AuthenticatedEvent(),
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                        isLoading: state.isLoading,
                        text: appLocalizer.saveChanges,
                        onPressed: () => handleSaveChanges(context));
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
      ),
    );
  }
}
