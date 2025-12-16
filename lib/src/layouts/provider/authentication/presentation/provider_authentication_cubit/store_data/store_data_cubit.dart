import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_store_data_use_case.dart';

class StoreDataCubit extends Cubit<Async> {
  StoreDataCubit() : super(const Async.initial());

  final ProviderStoreDataUseCase providerStoreDataUseCase = injector();

  Future<void> providerStoreData(StoreDataParams params) async {
    emit(const Async.loading());
    final result = await providerStoreDataUseCase(params);
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
