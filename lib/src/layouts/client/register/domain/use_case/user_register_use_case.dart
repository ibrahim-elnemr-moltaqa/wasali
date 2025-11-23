import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/src/layouts/client/register/domain/repository/user_register_repository.dart';
import '../../../../../../core/core.dart';
import '../../../../../../core/utils/mixins/params.dart';

@Injectable()
class RegiserUseCase extends IUseCase<void, RegisterParams> {
  final UserRegisterRepository _repository;

  RegiserUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(RegisterParams params) async {
    return await _repository.register(params);
  }
}

class RegisterParams with Params {
  final String username;
  final String phone;
  final String countryCode;
  final String deviceToken;

  RegisterParams({
    required this.username,
    required this.phone,
    required this.countryCode,
    required this.deviceToken,
  });

  @override
  Map<String, dynamic> get toMap => {
        "name": username,
        "mobile": '0$phone',
        "country_code": countryCode,
        "terms": 1,
        "device_token": deviceToken,
      };
}
