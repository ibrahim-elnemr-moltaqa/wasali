import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/repository/delivery_authentication_repository.dart';

@injectable
class DeliveryBankInfoUseCase extends IUseCase<Unit, DeliveryBankInfoParams> {
  DeliveryBankInfoUseCase(this._repository);
  final DeliveryRegisterRepository _repository;
  @override
  DomainServiceType<Unit> call(DeliveryBankInfoParams params) async {
    return await _repository.deliveryBankInfo(params);
  }
}

class DeliveryBankInfoParams extends Equatable {
  final int bankID;
  final String accountNumber;
  final String iban;
  final String nationalID;
  final bool isUpdate;

  const DeliveryBankInfoParams({
    required this.bankID,
    required this.accountNumber,
    required this.iban,
    required this.nationalID,
    this.isUpdate = false,
  });

  Map<String, dynamic> toJson() => {
        'bank_id': bankID,
        'account_number': accountNumber,
        'iban': iban,
        'national_id': nationalID,
        'terms': 1
      };

  @override
  List<Object?> get props => [bankID, accountNumber, iban, nationalID, isUpdate];
}
