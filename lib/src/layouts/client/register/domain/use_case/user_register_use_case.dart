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
  Future<Either<Failure, Unit>> call(RegisterParams countryId) async {
    return await _repository.register(countryId);
  }
}

class RegisterParams with Params {
  final String username;
  final String mobile;
  final String whatsApp;
  final String countryCode;
  final String codeWhatsapp;
  final String deviceToken;

  RegisterParams({
    required this.username,
    required this.mobile,
    required this.whatsApp,
    required this.countryCode,
    required this.codeWhatsapp,
    required this.deviceToken,
  });

  @override
  Map<String, dynamic> get toMap => {
        "name": username,
        "mobile": mobile,
        "whatsapp": whatsApp,
        "code_mobile": countryCode,
        "code_whatsapp": codeWhatsapp,
        "terms": 1,
        "device_token": deviceToken,
      };
}
