import 'package:equatable/equatable.dart';

class ProviderRegisterState extends Equatable {
  final Set<int> completedSteps;
  final int currentStep;
  final bool isTermsAndConditionsAccepted;

  const ProviderRegisterState({
    this.completedSteps = const {},
    this.currentStep = 0,
    this.isTermsAndConditionsAccepted = false,
  });

  ProviderRegisterState copyWith({
    Set<int>? completedSteps,
    int? currentStep,
    bool? isTermsAndConditionsAccepted,
  }) {
    return ProviderRegisterState(
      completedSteps: completedSteps ?? this.completedSteps,
      currentStep: currentStep ?? this.currentStep,
      isTermsAndConditionsAccepted:
          isTermsAndConditionsAccepted ?? this.isTermsAndConditionsAccepted,
    );
  }

  @override
  List<Object?> get props =>
      [completedSteps, currentStep, isTermsAndConditionsAccepted];
}
