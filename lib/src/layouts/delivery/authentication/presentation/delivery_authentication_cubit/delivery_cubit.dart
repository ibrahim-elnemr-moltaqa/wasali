import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/get_delivery_use_case.dart';

class DeliveryCubit extends Cubit<Async> {
  DeliveryCubit() : super(const Async.initial());

  final GetDeliveryUseCase _getDeliveryUseCase = injector();
  Future<void> getDelivery() async {
    emit(const Async.loading());
    final result = await _getDeliveryUseCase(NoParams());
    emit(result.fold(
      (l) => Async.failure(l),
      (delivery) => Async.success(delivery),
    ));
  }
}
