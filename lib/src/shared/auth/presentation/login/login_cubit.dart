import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/di/di.dart';
import '../../domain/use_case/login_use_case.dart';

class LoginCubit extends Cubit<Async> {
  LoginCubit() : super(const Async.initial());

  final LoginUseCase _loginUseCase = injector();
  final phoneController = TextEditingController();


  void logIn(LoginParams params) async {
    emit(const Async.loading());
    final result = await _loginUseCase(params);
    result.fold(
      (failer) {
        emit(Async.failure(failer));
      },
      (data) {
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
