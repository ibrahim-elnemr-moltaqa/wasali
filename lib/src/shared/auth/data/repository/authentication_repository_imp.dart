import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/src/shared/auth/data/models/api_user_model.dart';
import 'package:wasli/src/shared/auth/domain/use_case/update_name_usecase.dart';

import '../../../../../core/core.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/authentication_repository.dart';
import '../../domain/use_case/can_update_email_use_case.dart';
import '../../domain/use_case/can_update_phone_use_case.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/update_phone_use_case.dart';
import '../models/api_authentication_response.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImp implements AuthenticationRepository {
  final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorageRepository;

  const AuthenticationRepositoryImp(
    this._apiHelper,
    this._secureStorageRepository,
  );

  ///

  @override
  DomainServiceType<Unit> login(LoginParams params) async {
    return await failureCollect(
      () async {
        final result = await _apiHelper.post(
          url: "auth/login",
          body: params.toMap,
        );
        final data = ApiLoggedUserResponse.fromJson(result['data']);
        await _secureStorageRepository.setToken(data.getAsValidTokenEntity);
        return const Right(unit);
      },
    );
  }

  /// Common Services
  ///

  @override
  DomainServiceType<Unit> verifyOtp(String params) async {
    return await failureCollect<Unit>(() async {
      final result = await _apiHelper.post(
        url: "auth/verify-otp",
        body: {
          "code": params,
        },
      );
      final token = await _secureStorageRepository.getToken();
      result["data"]["access_token"] = token?.token;
      final data = ApiLoggedUserResponse.fromJson(result['data']);
      await _secureStorageRepository.setCachedUser(data.user!.mapToCacheEntity);

      return const Right(unit);
    });
  }

  @override
  DomainServiceType<void> resendOtp(PhoneEntity params) async {
    return await failureCollect<void>(() async {
      await _apiHelper.post(url: "auth/resend-otp", body: params.toMap);
      return const Right(null);
    });
  }

  @override
  DomainServiceType<void> logOut() async {
    return await failureCollect<void>(
      () async {
        await _apiHelper.post(url: "auth/logout");
        await _secureStorageRepository.deleteAllCache();
        return const Right(null);
      },
    );
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    return await failureCollect<void>(() async {
      await _apiHelper.delete(url: "auth/delete-account");
      await _secureStorageRepository.deleteAllCache();
      return const Right(null);
    });
  }

  @override
  DomainServiceType<void> canUpdateEmail(CanUpdateEmailParams params) async {
    return await failureCollect<void>(() async {
      await _apiHelper.post(
        url: "auth/change-email",
        body: params.toMap,
      );
      return const Right(null);
    });
  }

  @override
  DomainServiceType<void> canUpdateMobile(CanUpdatePhoneParams params) async {
    return await failureCollect<void>(() async {
      await _apiHelper.post(
        url: "auth/change-mobile",
        body: params.toMap,
      );
      return const Right(null);
    });
  }

  @override
  DomainServiceType<Unit> updatePhone(UpdatePhoneParams params) async {
    return await failureCollect<Unit>(() async {
      final result = await _apiHelper.post(
        url: "auth/change-mobile",
        body: params.toMap,
      );
      final data = ApiLoggedUserResponse.fromJson(result['data']);
      await _secureStorageRepository.setToken(data.getAsValidTokenEntity);
      await _secureStorageRepository.setCachedUser(data.user!.mapToCacheEntity);
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<Unit> updateName(UpdateNameParams params) async {
    return await failureCollect<Unit>(() async {
      final result = await _apiHelper.post(
        url: "auth/update-profile",
        body: params.toMap(),
      );
      final data = ApiUserModel.fromJson(result['data']['user']['user']);
      // await _secureStorageRepository.setToken(data.getAsValidTokenEntity);
      await _secureStorageRepository.setCachedUser(data.mapToCacheEntity);
      return const Right(unit);
    });
  }
}
