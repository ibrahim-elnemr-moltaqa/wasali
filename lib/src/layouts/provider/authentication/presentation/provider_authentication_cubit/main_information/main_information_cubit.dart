import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_main_information_use_case.dart';

class MainInformationCubit extends Cubit<Async> {
  MainInformationCubit() : super(const Async.initial());

  final ProviderMainInformationUseCase providerRegisterMainInformationUseCase =
      injector();

  Future<void> providerMainInformation(MainInformationsParams params) async {
    emit(const Async.loading());
    final result = await providerRegisterMainInformationUseCase(params);
    emit(result.fold((failure) => Async.failure(failure),
        (_) => const Async.successWithoutData()));
  }

  @override
  void emit(Async state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
