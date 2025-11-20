import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/src/shared/auth/presentation/otp/widgets/otp_body_widget.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/auth_app_bar_widget.dart';
import '../../../../../core/core.dart';
import '../../domain/use_case/verify_otp_use_case.dart';
import 'otp_cubit.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({required this.arguments, super.key});

  final OtpScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    final phoneNumber = arguments.phone.completeNumber;
    return BlocProvider(
      create: (context) => OtpCubit(arguments: arguments),
      child: Scaffold(
        appBar: AuthAppBarWidget(
          onPressed: () => AppRouter.pop(),
        ),
        body: SafeArea(
          child: Padding(
            padding: Dimensions.hPageMargins,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(appLocalizer.login, style: TextStyles.regular20),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    appLocalizer.enter_verification_code(phoneNumber),
                    style: TextStyles.light14,
                  ),
                  const SizedBox(height: 24),
                  OtpPageBody(
                    arguments: arguments,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
