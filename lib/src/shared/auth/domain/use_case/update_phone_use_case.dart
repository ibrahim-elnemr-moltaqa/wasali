import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../entities/user_entity.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class UpdatePhoneUsecase extends IUseCase<void, UpdatePhoneParams> {
  final AuthenticationRepository _repository;

  UpdatePhoneUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(UpdatePhoneParams countryId) async =>
      await _repository.updatePhone(countryId);
}

class UpdatePhoneParams {
  final PhoneEntity phoneEntity;
  UpdatePhoneParams({
    required this.phoneEntity,
  });
  Map<String, dynamic> get toMap => {
        "code_mobile": phoneEntity.code,
        "mobile": phoneEntity.phone,
      };
}
