import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/src/layouts/client/register/domain/use_case/user_register_use_case.dart';
import '../../../../../core/core.dart';
import '../../../../../core/di/di.dart';

typedef UserRegisterState = Async<void>;

class UserRegisterCubit extends Cubit<UserRegisterState> {
  UserRegisterCubit() : super(const Async.initial());

  final RegiserUseCase _registerUseCase = injector();

  void register(RegisterParams params) async {
    emit(const Async.loading());
    final result = await _registerUseCase(params);
    result.fold(
      (failer) {
        emit(Async.failure(failer));
      },
      (_) {
        emit(const Async.successWithoutData());
      },
    );
  }

  @override
  void emit(UserRegisterState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
