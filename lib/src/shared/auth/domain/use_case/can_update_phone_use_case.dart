import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/core.dart';
import '../entities/user_entity.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class CanUpdatePhoneUseCase extends IUseCase<void, CanUpdatePhoneParams> {
  final AuthenticationRepository _repository;

  CanUpdatePhoneUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(CanUpdatePhoneParams params) async =>
      await _repository.canUpdateMobile(params);
}

class CanUpdatePhoneParams extends Equatable {
  final PhoneEntity phone;

  const CanUpdatePhoneParams({
    required this.phone,
  });

  @override
  List<Object?> get props => [
        phone,
      ];

  Map<String, dynamic> get toMap => phone.toMap;
}
