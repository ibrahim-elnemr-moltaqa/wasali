import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/auth_app_bar_widget.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';

import '../../../../../material/media/svg_icon.dart';
import '../../../notifications/helpers/firebase/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/config/router/app_routes.dart';
import '../../../../../core/core.dart';
import '../../../../../material/buttons/app_button.dart';
import '../../../../../material/inputs/intel_phone/phone_field.dart';
import '../../../../../material/toast/app_toast.dart';
import '../../domain/use_case/login_use_case.dart';
import 'login_cubit.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  IntelPhoneNumberEntity? phone;

  void onLoginPressed(BuildContext ctx) async {
    if (phone?.number != null && phone?.number.isNotEmpty == true) {
      final fcmToken = await FirebaseHelper.getDeviceFcmToken() ?? "";
      final params = LoginParams(
        phone: phone!.getPhoneEntity,
        countryCode: phone!.countryCode,
        deviceToken: fcmToken,
      );
      if (ctx.mounted) {
        ctx.read<LoginCubit>().logIn(params);
      }
    }
  }

  void onLoginSuccess() {
    if (phone != null) {
      AppRouter.pushNamed(AppRoutes.otp,
          arguments: OtpScreenArguments(
              phone: phone!, caseEnum: OtpScreenCaseEnum.login));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, Async>(
        listener: (context, state) {
          if (state.isFailure) {
            AppToasts.error(context, message: state.errorMessage ?? '');
          } else if (state.isSuccess) {
            onLoginSuccess();
          }
        },
        builder: (context, state) {
          final roleState =
              context.read<AppAuthenticationBloc>().state as AuthLogInPageState;
          return Scaffold(
            appBar: AuthAppBarWidget(
              onPressed: () {
                AppAuthenticationBloc.of(context).add(ChooseRoleEvent());
              },
            ),
            body: Padding(
              padding: Dimensions.hPageMargins,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      appLocalizer.login,
                      style: TextStyles.regular20,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      appLocalizer.welcome_back,
                      style: TextStyles.light14,
                    ),
                    const SizedBox(height: 40),
                    IntelPhoneField(
                      initialValue: phone,
                      onChange: (phoneNumber) {
                        setState(() {
                          phone = phoneNumber;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: Dimensions.hPageMargins,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                        AppIllustrations.userAuthButtonSection),
                  ),
                  AppButton(
                    text: appLocalizer.sendOTP,
                    isLoading: state.isLoading,
                    onPressed: () => onLoginPressed(context),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Visibility(
                    visible: roleState.role == RoleEnum.client,
                    child: ElevatedButton.icon(
                        icon: AppSvgIcon(path: AppIcons.guestIc),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary100,
                            foregroundColor: AppColors.primary),
                        onPressed: () =>
                            AppAuthenticationBloc.of(context).add(GuestEvent()),
                        label: Text(appLocalizer.continueAsGuest)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(roleState.role.registerRoute);
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: appLocalizer.dontHaveAccount,
                            ),
                            const TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                                text: appLocalizer.registerNow,
                                style: TextStyles.light16
                                    .copyWith(color: AppColors.primary))
                          ],
                          style: TextStyles.light16,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
