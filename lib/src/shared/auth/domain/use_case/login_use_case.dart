import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/core.dart';
import '../repository/authentication_repository.dart';

import '../../../../../core/utils/mixins/params.dart';
import '../entities/user_entity.dart';

@Injectable()
class LoginUseCase extends IUseCase<Unit, LoginParams> {
  final AuthenticationRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(LoginParams params) async {
    return await _repository.login(params);
  }
}

class LoginParams with Params {
  final PhoneEntity phone;
  final String countryCode;
  final String deviceToken;

  const LoginParams({
    required this.phone,
    required this.countryCode,
    required this.deviceToken,
  });
  @override
  Map<String, dynamic> get toMap => {
        "mobile": '0${phone.phone}',
        "country_code": countryCode,
        "device_token": deviceToken,
      };
}
