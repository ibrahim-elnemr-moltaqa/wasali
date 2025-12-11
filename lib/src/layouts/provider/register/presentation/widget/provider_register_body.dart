import 'package:flutter/material.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/src/layouts/provider/register/presentation/widget/main_information_step.dart';
import 'package:wasli/src/layouts/provider/register/presentation/widget/store_address_step.dart';
import 'package:wasli/src/layouts/provider/register/presentation/widget/store_data_step.dart';
import 'package:wasli/src/shared/auth/domain/entities/auth_step_entity.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/widget/custom_auth_stepper_widget.dart';

class ProviderRegisterBody extends StatefulWidget {
  const ProviderRegisterBody({
    super.key,
  });

  @override
  State<ProviderRegisterBody> createState() => _ProviderRegisterBodyState();
}

class _ProviderRegisterBodyState extends State<ProviderRegisterBody> {
  ValueNotifier<int> currentStep = ValueNotifier(0);
  ValueNotifier<Set<int>> completedSteps = ValueNotifier({});
  ValueNotifier<IntelPhoneNumberEntity?> phone = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: currentStep,
              builder: (context, value, child) {
                return ValueListenableBuilder(
                    valueListenable: completedSteps,
                    builder: (context, value, child) {
                      return CustomAuthStepperWidget(
                        steps: providerSteps,
                        onStepChanged: (index) {
                          currentStep.value = index;
                        },
                        completedSteps: completedSteps.value,
                      );
                    });
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
                      ServiceProviderStep(
                        onStepSucceeded: (value, phone) {
                          currentStep.value = value;
                          completedSteps.value = {
                            ...completedSteps.value,
                            value
                          };
                          this.phone.value = phone;
                        },
                      ),
                      StoreDataStep(
                        onStepSucceeded: (value) {
                          currentStep.value = value;
                          completedSteps.value = {
                            ...completedSteps.value,
                            value
                          };
                        },
                      ),
                      StoreAddressStep(
                        phoneNumber: phone.value,
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
