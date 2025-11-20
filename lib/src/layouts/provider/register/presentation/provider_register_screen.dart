import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_cubit.dart';
import 'package:wasli/src/layouts/provider/register/presentation/widget/provider_register_body.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/auth_app_bar_widget.dart';

class ProviderRegisterScreen extends StatefulWidget {
  const ProviderRegisterScreen({super.key});

  @override
  State<ProviderRegisterScreen> createState() => _ProviderRegisterScreenState();
}

class _ProviderRegisterScreenState extends State<ProviderRegisterScreen> {
  ValueNotifier<int> currentStep = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderRegisterCubit(),
      child: Scaffold(
        appBar: const AuthAppBarWidget(),
        body: Stack(
          children: [
            PositionedDirectional(
                bottom: 0,
                end: 0,
                child:
                    SvgPicture.asset(AppIllustrations.userAuthButtonSection)),
            Padding(
              padding: Dimensions.hPageMargins,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    appLocalizer.createAccount,
                    style: TextStyles.regular12,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    appLocalizer.registerWelcome,
                    style: TextStyles.regular12
                        .copyWith(color: AppColors.grey2Color),
                  ),
                  const SizedBox(height: 32),
                  ValueListenableBuilder(
                      valueListenable: currentStep,
                      builder: (context, value, child) {
                        return ProviderRegisterBody(
                          onStepChanged: (value) {
                            currentStep.value = value;
                          },
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: currentStep,
            builder: (context, value, child) {
              final cubit = context.read<ProviderRegisterCubit>();
              return Padding(
                padding: Dimensions.hPageMargins,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                        text: value == 2
                            ? appLocalizer.sendOTP
                            : appLocalizer.next,
                        onPressed: () {
                          if (value == 2 && cubit.validateAllSteps()) {
                            AppRouter.pushNamed(AppRoutes.otp, arguments: {
                              'phone': context
                                  .read<ProviderRegisterCubit>()
                                  .phoneNumber
                            });
                          } else {
                            context
                                .read<ProviderRegisterCubit>()
                                .nextStep(value);
                          }
                        }),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
