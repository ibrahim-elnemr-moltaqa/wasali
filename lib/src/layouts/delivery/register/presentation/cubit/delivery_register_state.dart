import 'package:equatable/equatable.dart';

class DeliveryRegisterState extends Equatable {
  final Set<int> completedSteps;
  final bool isTermsAndConditionsAccepted;

  const DeliveryRegisterState({
    this.completedSteps = const {},
    this.isTermsAndConditionsAccepted = false,
  });

  DeliveryRegisterState copyWith({
    Set<int>? completedSteps,
    bool? isTermsAndConditionsAccepted,
  }) {
    return DeliveryRegisterState(
      completedSteps: completedSteps ?? this.completedSteps,
      isTermsAndConditionsAccepted:
          isTermsAndConditionsAccepted ?? this.isTermsAndConditionsAccepted,
    );
  }

  @override
  List<Object?> get props => [completedSteps, isTermsAndConditionsAccepted];
}
