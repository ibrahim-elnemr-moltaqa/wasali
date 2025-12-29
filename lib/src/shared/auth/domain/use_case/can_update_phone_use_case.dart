import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class CanUpdatePhoneUseCase extends IUseCase<void, CanUpdatePhoneParams> {
  final AuthenticationRepository _repository;

  CanUpdatePhoneUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(CanUpdatePhoneParams countryId) async =>
      await _repository.canUpdateMobile(countryId);
}

class CanUpdatePhoneParams extends Equatable {
  final String phone;

  const CanUpdatePhoneParams({
    required this.phone,
  });

  Map<String, dynamic> get toMap => {
        "mobile": phone,
      };

  @override
  List<Object?> get props => [
        phone,
      ];
}
