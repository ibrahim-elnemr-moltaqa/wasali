import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/get_provider_use_case.dart';

class ProviderCubit extends Cubit<Async> {
  ProviderCubit() : super(const Async.initial());

  final GetProviderUserCase getProviderUserCase = injector();

  Future<void> getProvider() async {
    emit(const Async.loading());
    final result = await getProviderUserCase(NoParams());
    emit(result.fold(
        (failure) => Async.failure(failure), (data) => Async.success(data)));
  }

  @override
  void emit(Async state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
