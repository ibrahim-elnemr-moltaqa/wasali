import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_store_address_params.dart';

class StoreAddressCubit extends Cubit<Async> {
  StoreAddressCubit() : super(const Async.initial());

  final ProviderStoreAddressUseCase providerRegisterStoreAddressUseCase =
      injector();
  Future<void> providerStoreAddress(StoreAddressParams params) async {
    emit(const Async.loading());
    final result = await providerRegisterStoreAddressUseCase(params);
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
