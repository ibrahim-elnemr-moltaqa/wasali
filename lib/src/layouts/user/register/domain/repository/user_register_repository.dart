import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/user/register/domain/use_case/user_register_use_case.dart';

abstract class UserRegisterRepository {
  DomainServiceType<Unit> register(RegisterParams params);
}
