import 'package:dartz/dartz.dart';
import '../../../../../core/core.dart';

import '../entities/user_entity.dart';
import '../use_case/can_update_email_use_case.dart';
import '../use_case/can_update_phone_use_case.dart';
import '../use_case/login_use_case.dart';
import '../use_case/update_name_usecase.dart';
import '../use_case/update_phone_use_case.dart';

abstract class AuthenticationRepository {
  DomainServiceType<Unit> login(LoginParams params);


  /// Common
  ///
  DomainServiceType<Unit> verifyOtp(String params);
  DomainServiceType<void> resendOtp(PhoneEntity params);
  DomainServiceType<void> canUpdateEmail(CanUpdateEmailParams params);
  DomainServiceType<void> canUpdateMobile(CanUpdatePhoneParams params);
  DomainServiceType<void> logOut();
  DomainServiceType<void> deleteAccount();

  DomainServiceType<Unit> updatePhone(UpdatePhoneParams params);
  DomainServiceType<Unit> updateName(UpdateNameParams  params);
}
