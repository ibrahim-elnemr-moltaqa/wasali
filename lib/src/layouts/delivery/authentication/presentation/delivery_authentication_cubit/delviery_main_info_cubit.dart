import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/use_case/delivery_main_info_use_case.dart';

class DeliveryMainInfoCubit extends Cubit<Async> {
  DeliveryMainInfoCubit() : super(const Async.initial());

  final DeliveryMainInformationUseCase _deliveryRegisterUseCase = injector();

  Future<void> deliveryMainInformation(
      DeliveryMainInformationParams params) async {
    emit(const Async.loading());
    final result = await _deliveryRegisterUseCase(params);
    emit(result.fold(
        (l) => Async.failure(l), (r) => const Async.successWithoutData()));
  }
}
