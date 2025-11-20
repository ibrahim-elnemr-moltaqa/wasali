import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_cubit.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/cubit/delivery_register_state.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/widget/delivery_register_bank_data_step.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/widget/delivery_register_initial_data_step.dart';
import 'package:wasli/src/layouts/delivery/register/presentation/widget/delivery_register_vehicle_data_step.dart';
import 'package:wasli/src/shared/auth/domain/entities/auth_step_entity.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/auth_app_bar_widget.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/widget/custom_auth_stepper_widget.dart';

class DeliveryRegisterScreen extends StatefulWidget {
  const DeliveryRegisterScreen({super.key});

  @override
  State<DeliveryRegisterScreen> createState() => _DeliveryRegisterScreenState();
}

class _DeliveryRegisterScreenState extends State<DeliveryRegisterScreen> {
  ValueNotifier<int> currentStep = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryRegisterCubit(),
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
                        return BlocBuilder<DeliveryRegisterCubit,
                            DeliveryRegisterState>(
                          builder: (context, state) {
                            return CustomAuthStepperWidget(
                              steps: deliverySteps,
                              onStepChanged: (value) {
                                currentStep.value = value;
                              },
                              completedSteps: state.completedSteps,
                            );
                          },
                        );
                      }),
                  const SizedBox(
                    height: 32,
                  ),
                  ValueListenableBuilder(
                      valueListenable: currentStep,
                      builder: (context, value, child) {
                        return Expanded(
                          child: IndexedStack(
                            index: value,
                            children: [
                              const DeliveryRegisterInitialDataStep(),
                              const DeliveryRegisterBankDataStep(),
                              const DeliveryRegisterVehicleDataStep(),
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: currentStep,
            builder: (context, value, child) {
              final cubit = context.read<DeliveryRegisterCubit>();
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
                                  .read<DeliveryRegisterCubit>()
                                  .phoneNumber
                            });
                          } else {
                            context
                                .read<DeliveryRegisterCubit>()
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
