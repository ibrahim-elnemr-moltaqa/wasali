// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../material/paginated_scroll_view/data/repositories/pagination_repo_impl.dart'
    as _i625;
import '../../material/paginated_scroll_view/domain/repositories/pagination_repo.dart'
    as _i173;
import '../../material/paginated_scroll_view/domain/use_cases/fetch_pagination_data_use_case.dart'
    as _i266;
import '../../src/layouts/client/register/data/repository_impl/user_register_repository_impl.dart'
    as _i1009;
import '../../src/layouts/client/register/domain/repository/user_register_repository.dart'
    as _i561;
import '../../src/layouts/client/register/domain/use_case/user_register_use_case.dart'
    as _i635;
import '../../src/layouts/provider/register/data/repository/provider_register_repository_impl.dart'
    as _i365;
import '../../src/layouts/provider/register/domain/repository/provider_register_repository.dart'
    as _i913;
import '../../src/layouts/provider/register/domain/use_case/provider_register_main_information_use_case.dart'
    as _i276;
import '../../src/layouts/provider/register/domain/use_case/provider_register_store_address_params.dart'
    as _i950;
import '../../src/layouts/provider/register/domain/use_case/provider_register_store_data_use_case.dart'
    as _i630;
import '../../src/shared/auth/data/repository/authentication_repository_imp.dart'
    as _i565;
import '../../src/shared/auth/domain/repository/authentication_repository.dart'
    as _i1005;
import '../../src/shared/auth/domain/use_case/can_update_email_use_case.dart'
    as _i357;
import '../../src/shared/auth/domain/use_case/can_update_phone_use_case.dart'
    as _i1022;
import '../../src/shared/auth/domain/use_case/delete_account_use_case.dart'
    as _i554;
import '../../src/shared/auth/domain/use_case/login_use_case.dart' as _i737;
import '../../src/shared/auth/domain/use_case/logout_use_case.dart' as _i867;
import '../../src/shared/auth/domain/use_case/resend_otp_use_case.dart'
    as _i897;
import '../../src/shared/auth/domain/use_case/update_name_usecase.dart'
    as _i306;
import '../../src/shared/auth/domain/use_case/update_phone_use_case.dart'
    as _i310;
import '../../src/shared/auth/domain/use_case/verify_otp_use_case.dart'
    as _i843;
import '../../src/shared/common/data/repository/common_repository_imp.dart'
    as _i321;
import '../../src/shared/common/data/repository/menu_common_repository_imp.dart'
    as _i434;
import '../../src/shared/common/domain/repository/common_repository.dart'
    as _i864;
import '../../src/shared/common/domain/repository/menu_common_repository.dart'
    as _i722;
import '../../src/shared/common/domain/use_cases/get_areas_use_case.dart'
    as _i1069;
import '../../src/shared/common/domain/use_cases/get_cities_use_case.dart'
    as _i478;
import '../../src/shared/common/domain/use_cases/get_countries_use_case.dart'
    as _i874;
import '../../src/shared/common/domain/use_cases/get_educational_stage_use_case.dart'
    as _i206;
import '../../src/shared/common/domain/use_cases/get_educational_subject_use_case.dart'
    as _i543;
import '../../src/shared/common/domain/use_cases/get_educational_years_use_case.dart'
    as _i771;
import '../../src/shared/common/domain/use_cases/get_languages_use_case.dart'
    as _i530;
import '../../src/shared/common/domain/use_cases/get_main_categories_use_case.dart'
    as _i456;
import '../../src/shared/common/domain/use_cases/get_sub_categories_use_case.dart'
    as _i543;
import '../../src/shared/common/domain/use_cases/menu/get_contact_us_data_use_case.dart'
    as _i0;
import '../../src/shared/common/domain/use_cases/menu/get_faq_use_case.dart'
    as _i51;
import '../../src/shared/common/domain/use_cases/menu/get_static_data_use_case.dart'
    as _i580;
import '../../src/shared/common/domain/use_cases/menu/send_contact_us_message_use_case.dart'
    as _i404;
import '../../src/shared/common/domain/use_cases/send_rate_use_case.dart'
    as _i25;
import '../../src/shared/google_maps/data/data_sources/maps_data_source.dart'
    as _i614;
import '../../src/shared/google_maps/data/repository/maps_repository_imp.dart'
    as _i596;
import '../../src/shared/google_maps/domain/repository/maps_repository.dart'
    as _i602;
import '../../src/shared/google_maps/domain/use_cases/google_maps_api/get_location_address_use_case.dart'
    as _i950;
import '../../src/shared/google_maps/domain/use_cases/google_maps_api/get_maps_place_details_use_case.dart'
    as _i949;
import '../../src/shared/google_maps/domain/use_cases/google_maps_api/get_maps_search_suggestions_use_case.dart'
    as _i346;
import '../../src/shared/google_maps/domain/use_cases/location/enable_gps_and_handle_premistion.dart'
    as _i185;
import '../../src/shared/google_maps/domain/use_cases/location/get_current_user_location.dart'
    as _i966;
import '../../src/shared/notifications/data/data_sources/notification_data_source.dart'
    as _i113;
import '../../src/shared/notifications/data/repository/notification_repository_imp.dart'
    as _i1037;
import '../../src/shared/notifications/domain/repository/notification_repository.dart'
    as _i190;
import '../../src/shared/notifications/domain/use_cases/get_notifications_use_case.dart'
    as _i933;
import '../../src/shared/notifications/domain/use_cases/mark_all_notifications_as_read_use_case.dart'
    as _i109;
import '../../src/shared/notifications/domain/use_cases/mark_notification_as_read_use_case.dart'
    as _i947;
import '../../src/shared/wallet/data/repository/wallet_repository_imp.dart'
    as _i78;
import '../../src/shared/wallet/domain/repository/wallet_repository.dart'
    as _i143;
import '../../src/shared/wallet/domain/use_case/charage_wallet_use_case.dart'
    as _i355;
import '../../src/shared/wallet/domain/use_case/get_transactions_use_case.dart'
    as _i856;
import '../../src/shared/wallet/domain/use_case/withdraw_balance_use_case.dart'
    as _i356;
import '../core.dart' as _i351;
import '../data/data_source/language_cache_date_source.dart' as _i203;
import '../data/data_source/role_cached_data_source.dart' as _i271;
import '../data/data_source/secure_storage_data_source.dart' as _i177;
import '../data/repository/language_cache_repository_imp.dart' as _i361;
import '../data/repository/secure_storage_repository_imp.dart' as _i526;
import '../data/repository/theme_repository_imp.dart' as _i715;
import '../domain/repository/theme_repository.dart' as _i984;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i351.GetIsUserAuthenticatedUseCase>(
        () => _i351.GetIsUserAuthenticatedUseCase());
    await gh.factoryAsync<_i351.DioHelper>(
      () => _i351.DioHelper().create(),
      preResolve: true,
    );
    gh.factory<_i185.EnableGpsAndHandlePermissionUseCase>(
        () => _i185.EnableGpsAndHandlePermissionUseCase());
    gh.factory<_i143.WalletRepository>(
        () => _i78.WalletRepositoryImp(gh<_i351.DioHelper>()));
    gh.factory<_i722.MenuCommonRepository>(
        () => _i434.MenuCommonRepositoryImp(gh<_i351.DioHelper>()));
    gh.factory<_i984.ThemeRepository>(() => _i715.ThemeRepositoryImp());
    gh.factory<_i177.SecureStorageDataSource>(
        () => _i177.SecureStorageDataSourceImpl());
    gh.factory<_i614.MapsDataSource>(() => _i614.MapsDataSourceImpl());
    gh.factory<_i203.LanguageCacheDateSource>(
        () => _i203.LanguageCacheDateSourceImp());
    gh.factory<_i51.GetFaqUseCase>(
        () => _i51.GetFaqUseCase(gh<_i722.MenuCommonRepository>()));
    gh.factory<_i0.GetContactUsDataUseCase>(
        () => _i0.GetContactUsDataUseCase(gh<_i722.MenuCommonRepository>()));
    gh.factory<_i580.GetStaticDataUseCase>(
        () => _i580.GetStaticDataUseCase(gh<_i722.MenuCommonRepository>()));
    gh.factory<_i404.SendContactUsMessageUseCase>(() =>
        _i404.SendContactUsMessageUseCase(gh<_i722.MenuCommonRepository>()));
    gh.factory<_i856.GetTransactionsUseCase>(
        () => _i856.GetTransactionsUseCase(gh<_i143.WalletRepository>()));
    gh.factory<_i356.WithdrawBalanceUseCase>(
        () => _i356.WithdrawBalanceUseCase(gh<_i143.WalletRepository>()));
    gh.factory<_i355.CharageWalletUseCase>(
        () => _i355.CharageWalletUseCase(gh<_i143.WalletRepository>()));
    gh.factory<_i351.SecureStorageRepository>(() =>
        _i526.SecureStorageRepositoryImp(gh<_i177.SecureStorageDataSource>()));
    gh.factory<_i113.NotificationDataSource>(
        () => _i113.NotificationDataSourceImp(gh<_i351.DioHelper>()));
    gh.factory<_i173.PaginationRepository>(
        () => _i625.PaginationRepoImpl(gh<_i351.DioHelper>()));
    gh.factory<_i351.LanguageCacheRepository>(() =>
        _i361.LanguageCacheRepositoryImp(gh<_i203.LanguageCacheDateSource>()));
    gh.factory<_i864.CommonRepository>(
        () => _i321.CommonRepositoryImp(gh<_i351.DioHelper>()));
    gh.factory<_i351.GetUserRoleUseCase>(
        () => _i351.GetUserRoleUseCase(gh<_i271.RoleCachedDataSource>()));
    gh.factory<_i351.SetUserRoleUseCase>(
        () => _i351.SetUserRoleUseCase(gh<_i271.RoleCachedDataSource>()));
    gh.factory<_i351.DeleteUserRoleUseCase>(
        () => _i351.DeleteUserRoleUseCase(gh<_i271.RoleCachedDataSource>()));
    gh.factory<_i351.DeleteAllSecureCacheUseCase>(() =>
        _i351.DeleteAllSecureCacheUseCase(gh<_i351.SecureStorageRepository>()));
    gh.factory<_i351.GetCachedUserUseCase>(
        () => _i351.GetCachedUserUseCase(gh<_i351.SecureStorageRepository>()));
    gh.factory<_i351.GetTokenUseCase>(
        () => _i351.GetTokenUseCase(gh<_i351.SecureStorageRepository>()));
    gh.factory<_i351.SetCachedUserUseCase>(
        () => _i351.SetCachedUserUseCase(gh<_i351.SecureStorageRepository>()));
    gh.factory<_i351.SetTokenUseCase>(
        () => _i351.SetTokenUseCase(gh<_i351.SecureStorageRepository>()));
    gh.factory<_i190.NotificationRepository>(() =>
        _i1037.NotificationRepositoryImp(gh<_i113.NotificationDataSource>()));
    gh.factory<_i561.UserRegisterRepository>(
        () => _i1009.UserRegisterRepositoryImpl(
              gh<_i351.DioHelper>(),
              gh<_i351.SecureStorageRepository>(),
            ));
    gh.factory<_i1005.AuthenticationRepository>(
        () => _i565.AuthenticationRepositoryImp(
              gh<_i351.DioHelper>(),
              gh<_i351.SecureStorageRepository>(),
            ));
    gh.factory<_i351.ClearLanguageCacheUseCase>(() =>
        _i351.ClearLanguageCacheUseCase(gh<_i351.LanguageCacheRepository>()));
    gh.factory<_i351.GetCachedLanguageUseCase>(() =>
        _i351.GetCachedLanguageUseCase(gh<_i351.LanguageCacheRepository>()));
    gh.factory<_i351.GetDeviceLanguageUseCase>(() =>
        _i351.GetDeviceLanguageUseCase(gh<_i351.LanguageCacheRepository>()));
    gh.factory<_i351.SetCachedLanguageUseCase>(() =>
        _i351.SetCachedLanguageUseCase(gh<_i351.LanguageCacheRepository>()));
    gh.factory<_i867.LogOutUseCase>(
        () => _i867.LogOutUseCase(gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i357.CanUpdateEmailUseCase>(() =>
        _i357.CanUpdateEmailUseCase(gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i737.LoginUseCase>(
        () => _i737.LoginUseCase(gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i897.ResendOtpUseCase>(
        () => _i897.ResendOtpUseCase(gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i843.VerifyOtpUseCase>(
        () => _i843.VerifyOtpUseCase(gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i554.DeleteAccountUseCase>(() =>
        _i554.DeleteAccountUseCase(gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i1022.CanUpdatePhoneUseCase>(() =>
        _i1022.CanUpdatePhoneUseCase(gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i310.UpdatePhoneUsecase>(
        () => _i310.UpdatePhoneUsecase(gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i602.MapsRepository>(
        () => _i596.MapsRepositoryImp(gh<_i614.MapsDataSource>()));
    gh.factory<_i913.ProviderRegisterRepository>(
        () => _i365.ProviderRegisterRepositoryImpl(
              gh<_i351.DioHelper>(),
              gh<_i351.SecureStorageRepository>(),
            ));
    gh.factory<_i771.GetEducationalYearsUseCase>(
        () => _i771.GetEducationalYearsUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i206.GetEducationalStageUseCase>(
        () => _i206.GetEducationalStageUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i874.GetCountriesUseCase>(
        () => _i874.GetCountriesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i530.GetLanguagesUseCase>(
        () => _i530.GetLanguagesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i543.GetEducationalSubjectUseCase>(
        () => _i543.GetEducationalSubjectUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i478.GetCitiesUseCase>(
        () => _i478.GetCitiesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i1069.GetAreasUseCase>(
        () => _i1069.GetAreasUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i456.GetMainCategoriesUseCase>(
        () => _i456.GetMainCategoriesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i543.GetSubCategoriesUseCase>(
        () => _i543.GetSubCategoriesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i635.RegiserUseCase>(
        () => _i635.RegiserUseCase(gh<_i561.UserRegisterRepository>()));
    gh.factory<_i346.GetSearchSuggestionsUseCase>(
        () => _i346.GetSearchSuggestionsUseCase(gh<_i602.MapsRepository>()));
    gh.factory<_i950.GetMapLocationAddressUseCase>(
        () => _i950.GetMapLocationAddressUseCase(gh<_i602.MapsRepository>()));
    gh.factory<_i949.GetMapsPlaceDetailsUseCase>(
        () => _i949.GetMapsPlaceDetailsUseCase(gh<_i602.MapsRepository>()));
    gh.factory<_i25.SendRateUseCase>(
        () => _i25.SendRateUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i266.FetchPaginatedDataUseCase<dynamic>>(() =>
        _i266.FetchPaginatedDataUseCase<dynamic>(
            gh<_i173.PaginationRepository>()));
    gh.factory<_i109.MarkAllNotificationsAsReadUseCase>(() =>
        _i109.MarkAllNotificationsAsReadUseCase(
            gh<_i190.NotificationRepository>()));
    gh.factory<_i933.GetNotificationsUseCase>(() =>
        _i933.GetNotificationsUseCase(gh<_i190.NotificationRepository>()));
    gh.factory<_i947.MarkNotificationAsReadUseCase>(() =>
        _i947.MarkNotificationAsReadUseCase(
            gh<_i190.NotificationRepository>()));
    gh.lazySingleton<_i306.UpdateNameUseCase>(() => _i306.UpdateNameUseCase(
        repository: gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i276.ProviderRegisterMainInformationUseCase>(() =>
        _i276.ProviderRegisterMainInformationUseCase(
            gh<_i913.ProviderRegisterRepository>()));
    gh.factory<_i630.ProviderRegisterStoreDataUseCase>(() =>
        _i630.ProviderRegisterStoreDataUseCase(
            gh<_i913.ProviderRegisterRepository>()));
    gh.factory<_i950.ProviderRegisterStoreAddressUseCase>(() =>
        _i950.ProviderRegisterStoreAddressUseCase(
            gh<_i913.ProviderRegisterRepository>()));
    gh.factory<_i966.GetCurrentUserLocationUseCase>(
        () => _i966.GetCurrentUserLocationUseCase(
              gh<_i185.EnableGpsAndHandlePermissionUseCase>(),
              gh<_i950.GetMapLocationAddressUseCase>(),
            ));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
