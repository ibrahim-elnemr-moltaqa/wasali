import 'package:equatable/equatable.dart';

class ProviderRegisterState extends Equatable {
  final Set<int> completedSteps;
  final bool isTermsAndConditionsAccepted;

  const ProviderRegisterState({
    this.completedSteps = const {},
    this.isTermsAndConditionsAccepted = false,
  });

  ProviderRegisterState copyWith({
    Set<int>? completedSteps,
    bool? isTermsAndConditionsAccepted,
  }) {
    return ProviderRegisterState(
      completedSteps: completedSteps ?? this.completedSteps,
      isTermsAndConditionsAccepted:
          isTermsAndConditionsAccepted ?? this.isTermsAndConditionsAccepted,
    );
  }

  @override
  List<Object?> get props => [completedSteps, isTermsAndConditionsAccepted];
}
