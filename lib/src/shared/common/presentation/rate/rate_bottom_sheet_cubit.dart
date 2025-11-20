
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';

import '../../domain/use_cases/send_rate_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RateBottomSheetCubit extends Cubit<Async> {
  RateBottomSheetCubit() : super(const Async.initial());
  final SendRateUseCase _sendRateUseCase = injector();
  Future<void> sendRate(RateParams params) async {
    emit(const Async.loading());
    final result = await _sendRateUseCase(params);
    result.fold(
      (f) {
        emit(Async.failure(f));
      },
      (_) {
        emit(const Async.successWithoutData());
      },
    );
    // await Future.delayed(const Duration(seconds: 1));
    // emit(const Async.successWithoutData());
  }
}
