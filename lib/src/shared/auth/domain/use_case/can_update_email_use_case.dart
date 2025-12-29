import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../repository/authentication_repository.dart';

@Injectable()
class CanUpdateEmailUseCase extends IUseCase<void, CanUpdateEmailParams> {
  final AuthenticationRepository _repository;

  CanUpdateEmailUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(CanUpdateEmailParams countryId) async =>
      await _repository.canUpdateEmail(countryId);
}

class CanUpdateEmailParams extends Equatable {
  final String email;
  final String password;

  const CanUpdateEmailParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];

  Map<String, dynamic> get toMap => {
        "email": email,
        "password": password,
      };
}
