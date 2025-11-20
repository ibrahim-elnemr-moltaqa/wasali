import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import '../../../auth/domain/use_case/update_phone_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePhone extends Cubit<Async> {
  UpdatePhone() : super(const Async.initial());
  final UpdatePhoneUsecase _updateAccountUseCase = injector();

  Future<void> updatePhone(UpdatePhoneParams params) async {
    emit(const Async.loading());
    final result = await _updateAccountUseCase(params);
    result.fold(
      (failure) {
        emit(Async.failure(failure));
      },
      (_) {
        emit(const Async.successWithoutData());
      },
    );
  }

  @override
  void emit(Async state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
