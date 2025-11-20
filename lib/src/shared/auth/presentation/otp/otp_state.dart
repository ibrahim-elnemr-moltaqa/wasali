part of "otp_cubit.dart";

class OtpState extends Equatable {
  final Async<void> verifyState;
  final Async<void> resendState;

  const OtpState({
    required this.verifyState,
    required this.resendState,
  });

  const OtpState.initial()
      : this(
          verifyState: const Async.initial(),
          resendState: const Async.initial(),
        );

  OtpState copyWith({
    Async<void>? verifyState,
    Async<void>? resendState,
  }) {
    return OtpState(
      verifyState: verifyState ?? this.verifyState,
      resendState: resendState ?? this.resendState,
    );
  }

  @override
  List<Object?> get props => [
        verifyState,
        resendState,
      ];
}
