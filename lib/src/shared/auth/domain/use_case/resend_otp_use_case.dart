import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/core.dart';

import '../entities/user_entity.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class ResendOtpUseCase extends IUseCase<void, PhoneEntity> {
  final AuthenticationRepository _repository;

  ResendOtpUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(PhoneEntity params) async {
    return await _repository.resendOtp(params);
  }
}
