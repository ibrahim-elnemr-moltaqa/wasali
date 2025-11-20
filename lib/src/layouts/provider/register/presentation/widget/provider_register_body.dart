import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_cubit.dart';
import 'package:wasli/src/layouts/provider/register/presentation/cubit/provider_register_state.dart';
import 'package:wasli/src/layouts/provider/register/presentation/widget/service_provider_step.dart';
import 'package:wasli/src/layouts/provider/register/presentation/widget/store_address_step.dart';
import 'package:wasli/src/layouts/provider/register/presentation/widget/store_data_step.dart';
import 'package:wasli/src/shared/auth/domain/entities/auth_step_entity.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/widget/custom_auth_stepper_widget.dart';

class ProviderRegisterBody extends StatefulWidget {
  const ProviderRegisterBody({super.key, required this.onStepChanged});

  final ValueChanged<int> onStepChanged;

  @override
  State<ProviderRegisterBody> createState() => _ProviderRegisterBodyState();
}

class _ProviderRegisterBodyState extends State<ProviderRegisterBody> {
  ValueNotifier<int> currentStep = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: currentStep,
              builder: (context, value, child) {
                return BlocBuilder<ProviderRegisterCubit,
                    ProviderRegisterState>(
                  builder: (context, state) {
                    return CustomAuthStepperWidget(
                      steps: providerSteps,
                      onStepChanged: (index) {
                        currentStep.value = index;
                        widget.onStepChanged(index);
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
                      const ServiceProviderStep(),
                      const StoreDataStep(),
                      const StoreAddressStep(),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
