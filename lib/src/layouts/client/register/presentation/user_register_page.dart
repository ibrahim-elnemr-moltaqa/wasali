import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/src/layouts/client/register/domain/use_case/user_register_use_case.dart';
import 'package:wasli/src/layouts/client/register/presentation/user_register_cubit.dart';
import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/accept_terms_tile.dart';
import 'package:wasli/src/shared/notifications/helpers/firebase/firebase_helper.dart';

import '../../../../../core/core.dart';
import '../../../../../material/buttons/app_button.dart';
import '../../../../../material/inputs/intel_phone/phone_field.dart';
import '../../../../../material/inputs/name_field.dart';
import '../../../../../material/toast/app_toast.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  IntelPhoneNumberEntity? phoneNumber;
  IntelPhoneNumberEntity? whatsAppPhoneNumber;

  bool isTermsAndConditionsAccepted = false;

  void onTermsAndConditionsChanged(bool? value) {
    setState(() {
      isTermsAndConditionsAccepted = value ?? false;
    });
  }

  void onSubmit(BuildContext ctx) async {
    if (formKey.currentState?.validate() ?? false) {
      if (phoneNumber == null || whatsAppPhoneNumber == null) {
        AppToasts.hint(ctx, message: appLocalizer.phoneFieldHint);
        return;
      }
      final facmToken = await FirebaseHelper.getDeviceFcmToken() ?? "";
      final params = RegisterParams(
        username: nameController.text,
        mobile: phoneNumber!.getPhoneEntity.phone,
        whatsApp: whatsAppPhoneNumber!.getPhoneEntity.phone,
        countryCode: phoneNumber!.countryCode,
        codeWhatsapp: whatsAppPhoneNumber!.countryCode,
        deviceToken: facmToken,
      );
      if (ctx.mounted) {
        BlocProvider.of<UserRegisterCubit>(ctx).register(params);
      }
    }
  }

  void onRegisterSuccess() async {
    if (phoneNumber == null) {
      AppToasts.hint(context, message: appLocalizer.phoneFieldHint);
      return;
    }
    AppRouter.pushNamed(AppRoutes.otp,
        arguments: OtpScreenArguments(
            phone: phoneNumber!, caseEnum: OtpScreenCaseEnum.register));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegisterCubit(),
      child: BlocConsumer<UserRegisterCubit, UserRegisterState>(
        listener: (context, state) async {
          if (state.isSuccess) {
            onRegisterSuccess();
          } else if (state.isFailure) {
            AppToasts.error(context, message: state.errorMessage ?? '');
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Stack(
            children: [
              PositionedDirectional(
                  bottom: 0,
                  end: 0,
                  child:
                      SvgPicture.asset(AppIllustrations.userAuthButtonSection)),
              Padding(
                padding: Dimensions.hPageMargins,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  appLocalizer.createAccount,
                                  style: TextStyles.regular20,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  appLocalizer.registerWelcome,
                                  style: TextStyles.light14,
                                ),
                                const SizedBox(height: 32),
                                NameField(
                                  controller: nameController,
                                  hint: appLocalizer.enterName,
                                  label: appLocalizer.username,
                                ),
                                const SizedBox(height: 12),
                                IntelPhoneField(
                                  initialValue: phoneNumber,
                                  label: appLocalizer.phoneNumber,
                                  onChange: (phoneNumber) {
                                    setState(() {
                                      this.phoneNumber = phoneNumber;
                                    });
                                  },
                                  hint: appLocalizer.enterPhoneNumber,
                                ),
                                const SizedBox(height: 12),
                                IntelPhoneField(
                                  initialValue: whatsAppPhoneNumber,
                                  label: appLocalizer.whatsApp_number,
                                  onChange: (whatsAppPhoneNumber) {
                                    setState(() {
                                      this.whatsAppPhoneNumber =
                                          whatsAppPhoneNumber;
                                    });
                                  },
                                  hint: appLocalizer.enter_whatsapp_number,
                                ),
                                const SizedBox(height: 16),
                                AcceptTermsAndConditionsWidget(
                                  isAccepted: isTermsAndConditionsAccepted,
                                  onChanged: onTermsAndConditionsChanged,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: Dimensions.hPageMargins,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                  text: appLocalizer.newRegister,
                  onPressed: () => onSubmit(context),
                  isLoading: state.isLoading,
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
