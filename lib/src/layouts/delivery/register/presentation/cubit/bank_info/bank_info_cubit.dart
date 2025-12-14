import 'package:bloc/bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import 'package:wasli/src/layouts/delivery/register/domain/use_case/delivery_bank_info_use_case.dart';

class BankInfoCubit extends Cubit<Async> {
  BankInfoCubit() : super(const Async.initial());
  final DeliveryBankInfoUseCase _deliveryBankInfoUseCase = injector();

  Future<void> bankInfo(DeliveryBankInfoParams params) async {
    emit(const Async.loading());
    final result = await _deliveryBankInfoUseCase(params);
    emit(result.fold(
        (l) => Async.failure(l), (r) => const Async.successWithoutData()));
  }
}
