import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/notifiers/resend_timer_notifier.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wasli/src/shared/auth/presentation/otp/otp_cubit.dart';
import 'package:wasli/src/shared/auth/presentation/otp/widgets/dont_recive_code.dart';
import 'package:wasli/src/shared/auth/presentation/otp/widgets/otp_pin_fields_widget.dart';

class OtpPageBody extends StatefulWidget {
  const OtpPageBody({
    super.key,
    required this.arguments,
  });

  final OtpScreenArguments arguments;

  @override
  State<OtpPageBody> createState() => _OtpPageBodyState();
}

class _OtpPageBodyState extends State<OtpPageBody> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _resendOtpNotifier = ResendOtpTimerNotifier()..startTimer();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OtpCubit, OtpState>(
          listenWhen: (previous, current) =>
              previous.verifyState != current.verifyState,
          listener: (context, state) {
            if (state.verifyState.isSuccess) {
              _onOtpVerifySuccess(context);
            } else if (state.verifyState.isFailure) {
              AppToasts.error(context,
                  message: state.verifyState.errorMessage ?? '');
            }
          },
        ),
        BlocListener<OtpCubit, OtpState>(
          listenWhen: (previous, current) =>
              previous.resendState != current.resendState,
          listener: (context, state) {
            if (state.resendState.isSuccess) {
              _resendOtpNotifier.startTimer();
              AppToasts.success(context,
                  message: appLocalizer.otpSentSuccessfully);
            } else if (state.resendState.isFailure) {
              AppToasts.error(context,
                  message: state.resendState.errorMessage ?? '');
            }
          },
        ),
      ],
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // const SizedBox(height: 32),
            BlocBuilder<OtpCubit, OtpState>(
              buildWhen: (previous, current) =>
                  previous.verifyState != current.verifyState,
              builder: (context, state) {
                return OtpPinCodeWidget(
                  controller: _otpController,
                  hasError: state.verifyState.isFailure,
                  readOnly: state.verifyState.isLoading,
                  errorMessage: state.verifyState.errorMessage,
                  validator: (value) {
                    final text = value ?? '';
                    if (text.isEmpty) {
                      return appLocalizer.enterVerificationCode;
                    } else if (text.length < appOtpFieldsLength) {
                      return appLocalizer.verificationCodeLengthValidation;
                    }
                    return null;
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DontReciveCodeWidget(
                    resendNotifier: _resendOtpNotifier,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _resendOtpNotifier,
                  builder: (context, value, child) {
                    if (value.isEnded) {
                      return const SizedBox(height: 25);
                    }
                    return Text(
                      value.timerText,
                      style: TextStyles.bold16.copyWith(color: AppColors.text2),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(
              height: 32,
            ),
            BlocBuilder<OtpCubit, OtpState>(
              builder: (context, state) {
                return ValueListenableBuilder(
                  valueListenable: _otpController,
                  builder: (context, value, child) {
                    return AppButton(
                      isEnabled: value.text.length >= appOtpFieldsLength,
                      onPressed: _onVerifyButtonPressed,
                      text: appLocalizer.send,
                      isLoading: state.verifyState.isLoading,
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _onVerifyButtonPressed() {
    final bool isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      OtpCubit.of(context).verify(_otpController.text);
    }
  }

  void _onOtpVerifySuccess(BuildContext ctx) {
    switch (widget.arguments.caseEnum) {
      case OtpScreenCaseEnum.register:
        AppAuthenticationBloc.of(ctx).add(AuthenticatedEvent());
        AppToasts.success(
          ctx,
          message: appLocalizer.verifyCodeSuccessMessage,
        );
        if (ctx.mounted) {
          AppRouter.popUntil(
            context: ctx,
            predicate: (route) => route.isFirst,
          );
        }
        break;

      case OtpScreenCaseEnum.login:
        AppAuthenticationBloc.of(ctx).add(AuthenticatedEvent());
        AppToasts.success(
          ctx,
          message: appLocalizer.verifyCodeSuccessMessage,
        );
        if (ctx.mounted) {
          AppRouter.popUntil(
            context: ctx,
            predicate: (route) => route.isFirst,
          );
        }

        break;

      case OtpScreenCaseEnum.updatePhone:
        AppToasts.success(context,
            message: appLocalizer.phoneUpdateSuccessMessage);
        AppAuthenticationBloc.of(ctx).add(AuthenticatedEvent());
        AppToasts.success(
          ctx,
          message: appLocalizer.verifyCodeSuccessMessage,
        );
        if (ctx.mounted) {
          AppRouter.popUntil(
            context: ctx,
            predicate: (route) => route.isFirst,
          );
        }
        break;
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
