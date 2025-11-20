import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.dart';
import '../../../../../core/di/di.dart';
import '../../domain/use_case/resend_otp_use_case.dart';
import '../../domain/use_case/verify_otp_use_case.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit({required this.arguments}) : super(const OtpState.initial());
  final OtpScreenArguments arguments;

  static OtpCubit of(BuildContext context) =>
      BlocProvider.of<OtpCubit>(context);

  late final VerifyOtpUseCase _verifyOtpUseCase = injector();
  late final ResendOtpUseCase _resendOtpUseCase = injector();

  void verify(String verificationCode) async {
    emit(state.copyWith(
      verifyState: const Async.loading(),
    ));
    final result = await _verifyOtpUseCase(verificationCode);
    result.fold(
      (failure) {
        emit(state.copyWith(
          verifyState: Async.failure(failure),
        ));
      },
      (data) async {
        emit(state.copyWith(
          verifyState: const Async.successWithoutData(),
        ));
      },
    );
  }

  void resendOtp() async {
    emit(state.copyWith(
      resendState: const Async.loading(),
    ));
    final result = await _resendOtpUseCase(arguments.phone.getPhoneEntity);
    result.fold((failer) {
      emit(state.copyWith(
        resendState: Async.failure(failer),
      ));
    }, (_) {
      emit(state.copyWith(
        resendState: const Async.successWithoutData(),
      ));
    });
    emit(state.copyWith(
      resendState: const Async.initial(),
    ));
  }

  @override
  void emit(OtpState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
