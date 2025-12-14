import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/src/shared/auth/domain/use_case/update_profile_usecase.dart';
import '../../../../../core/core.dart';
import '../../../../../core/di/di.dart';

typedef ClientEditProfileState = Async<void>;

class ClientEditProfileCubit extends Cubit<ClientEditProfileState> {
  ClientEditProfileCubit() : super(const Async.initial());

  final UpdateProfileUseCase _updateProfileUseCase = injector();

  void updateProfile(UpdateProfileParams params) async {
    emit(const Async.loading());
    final result = await _updateProfileUseCase(params);
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
  void emit(ClientEditProfileState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
