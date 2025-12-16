import 'package:flutter/material.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/register/widget/delivery_register_bank_data_step.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/register/widget/delivery_register_initial_data_step.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/register/widget/delivery_register_vehicle_data_step.dart';
import 'package:wasli/src/shared/auth/domain/entities/auth_step_entity.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/widget/custom_auth_stepper_widget.dart';

class DeliveryRegisterBody extends StatefulWidget {
  const DeliveryRegisterBody({super.key});

  @override
  State<DeliveryRegisterBody> createState() => _DeliveryRegisterBodyState();
}

class _DeliveryRegisterBodyState extends State<DeliveryRegisterBody> {
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
                        steps: deliverySteps,
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
                      DeliveryRegisterInitialDataStep(
                        onStepSucceeded: (index, phone) {
                          currentStep.value = index;
                          completedSteps.value = {
                            ...completedSteps.value,
                            index
                          };
                          this.phone.value = phone;
                        },
                      ),
                      DeliveryRegisterBankDataStep(
                        onStepSucceeded: (index) {
                          currentStep.value = index;
                          completedSteps.value = {
                            ...completedSteps.value,
                            index
                          };
                        },
                      ),
                      DeliveryRegisterVehicleDataStep(
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
