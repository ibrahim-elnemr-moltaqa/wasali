import '../entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/core.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class UpdatePhoneUsecase extends IUseCase<void, UpdatePhoneParams> {
  final AuthenticationRepository _repository;

  UpdatePhoneUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(UpdatePhoneParams params) async => await _repository.updatePhone(params);
}

class UpdatePhoneParams {
  final PhoneEntity phoneEntity;
  UpdatePhoneParams({
    required this.phoneEntity,
  });
  Map<String, dynamic> get toMap => {
        "country_code": phoneEntity.code,
        "mobile": "0${phoneEntity.phone}",
      };
}
