import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/core.dart';

import '../../../../../material/inputs/intel_phone/phone_field.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class VerifyOtpUseCase extends IUseCase<Unit, String> {
  final AuthenticationRepository _repository;

  VerifyOtpUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await _repository.verifyOtp(params);
  }
}

enum OtpScreenCaseEnum {
  register,
  updatePhone,
  login,
}

class OtpScreenArguments {
  final IntelPhoneNumberEntity phone;
  final OtpScreenCaseEnum caseEnum;

  OtpScreenArguments({
    required this.phone,
    required this.caseEnum,
  });
}
