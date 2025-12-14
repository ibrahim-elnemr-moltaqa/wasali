import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_register_use_case.dart';

class DeliveryRegisterCubit extends Cubit<Async> {
  DeliveryRegisterCubit() : super(const Async.initial());

  final DeliveryRegisterUseCase _deliveryRegisterUseCase = injector();

  Future<void> register(DeliveryRegisterParams params) async {
    emit(const Async.loading());
    final result = await _deliveryRegisterUseCase(params);
    emit(result.fold(
        (l) => Async.failure(l), (r) => const Async.successWithoutData()));
  }
}
