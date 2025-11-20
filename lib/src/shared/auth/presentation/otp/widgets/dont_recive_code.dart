import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/notifiers/resend_timer_notifier.dart';
import 'package:wasli/src/shared/auth/presentation/otp/otp_cubit.dart';

class DontReciveCodeWidget extends StatelessWidget {
  const DontReciveCodeWidget({super.key, required this.resendNotifier});

  final ResendOtpTimerNotifier resendNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          appLocalizer.dontSendCode,
          style: TextStyles.regular14.copyWith(color: AppColors.grey2Color),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: BlocBuilder<OtpCubit, OtpState>(
            buildWhen: (previous, current) =>
                previous.resendState != current.resendState,
            builder: (context, state) {
              return ValueListenableBuilder(
                valueListenable: resendNotifier,
                builder: (context, value, child) {
                  final bool isEnabled = value.isEnded;
                  return _DontReceiveVerificationCode(
                      isEnabled: isEnabled,
                      isLoading: state.resendState.isLoading,
                      onResendPressed: () {
                        OtpCubit.of(context).resendOtp();
                      });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DontReceiveVerificationCode extends StatelessWidget {
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback onResendPressed;

  const _DontReceiveVerificationCode({
    required this.isEnabled,
    required this.isLoading,
    required this.onResendPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = isEnabled && !isLoading
        ? AppColors.primary
        : AppColors.disableBorderColor;
    return AnimatedSize(
      duration: Durations.medium1,
      alignment: AlignmentDirectional.centerStart,
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: GestureDetector(
              onTap: isEnabled && !isLoading ? onResendPressed : null,
              behavior: HitTestBehavior.opaque,
              child: Text(
                appLocalizer.resend,
                style: TextStyles.bold14.copyWith(
                  color: color,
                  decorationColor: color,
                ),
              ),
            ),
          ),
          if (isLoading)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              height: 12,
              width: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: color,
              ),
            ),
        ],
      ),
    );
  }
}
