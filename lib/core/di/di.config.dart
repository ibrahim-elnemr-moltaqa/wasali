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
import '../../src/layouts/client/home/data/data_sources/home_remote_data_source.dart'
    as _i404;
import '../../src/layouts/client/home/data/repositories/home_repository_impl.dart'
    as _i618;
import '../../src/layouts/client/home/domain/repositories/home_repository.dart'
    as _i993;
import '../../src/layouts/client/home/domain/usecases/get_home_banners_usecase.dart'
    as _i2;
import '../../src/layouts/client/home/domain/usecases/get_home_offers_usecase.dart'
    as _i693;
import '../../src/layouts/client/providers/data/data_source/providers_data_source.dart'
    as _i224;
import '../../src/layouts/client/providers/data/repository/providers_repository_impl.dart'
    as _i597;
import '../../src/layouts/client/providers/domain/repository/providers_repository.dart'
    as _i475;
import '../../src/layouts/client/providers/domain/use_cases/get_providers_use_case.dart'
    as _i946;
import '../../src/layouts/client/register/data/repository_impl/user_register_repository_impl.dart'
    as _i1009;
import '../../src/layouts/client/register/domain/repository/user_register_repository.dart'
    as _i561;
import '../../src/layouts/client/register/domain/use_case/user_register_use_case.dart'
    as _i635;
import '../../src/layouts/client/search/data/data_sources/search_data_source.dart'
    as _i613;
import '../../src/layouts/client/search/data/repositories/search_repository_impl.dart'
    as _i215;
import '../../src/layouts/client/search/domain/repositories/search_repository.dart'
    as _i672;
import '../../src/layouts/client/search/domain/use_cases/get_popular_searches_use_case.dart'
    as _i160;
import '../../src/layouts/client/search/domain/use_cases/get_recent_searches_use_case.dart'
    as _i843;
import '../../src/layouts/client/search/domain/use_cases/search_use_case.dart'
    as _i350;
import '../../src/layouts/delivery/authentication/data/repository/delivery_authentication_repository_impl.dart'
    as _i893;
import '../../src/layouts/delivery/authentication/domain/repository/delivery_authentication_repository.dart'
    as _i719;
import '../../src/layouts/delivery/authentication/domain/use_case/delivery_bank_info_use_case.dart'
    as _i368;
import '../../src/layouts/delivery/authentication/domain/use_case/delivery_main_info_use_case.dart'
    as _i60;
import '../../src/layouts/delivery/authentication/domain/use_case/delivery_vehicle_data_use_case.dart'
    as _i927;
import '../../src/layouts/delivery/authentication/domain/use_case/get_delivery_use_case.dart'
    as _i345;
import '../../src/layouts/provider/authentication/data/repository/provider_authentication_repository_impl.dart'
    as _i352;
import '../../src/layouts/provider/authentication/domain/repository/provider_authentication_repository.dart'
    as _i592;
import '../../src/layouts/provider/authentication/domain/use_case/get_provider_use_case.dart'
    as _i965;
import '../../src/layouts/provider/authentication/domain/use_case/provider_register_main_information_use_case.dart'
    as _i81;
import '../../src/layouts/provider/authentication/domain/use_case/provider_register_store_address_params.dart'
    as _i386;
import '../../src/layouts/provider/authentication/domain/use_case/provider_register_store_data_use_case.dart'
    as _i266;
import '../../src/layouts/provider/settings/packages/data/datasource/packages_remote_data_source.dart'
    as _i545;
import '../../src/layouts/provider/settings/packages/data/repository/packages_repository_impl.dart'
    as _i715;
import '../../src/layouts/provider/settings/packages/domain/repository/packages_repository.dart'
    as _i608;
import '../../src/layouts/provider/settings/packages/domain/use_case/get_packages_use_case.dart'
    as _i43;
import '../../src/layouts/provider/settings/store_management/data/repository/sizes_repository_impl.dart'
    as _i1013;
import '../../src/layouts/provider/settings/store_management/data/repository/store_categories_repository_impl.dart'
    as _i599;
import '../../src/layouts/provider/settings/store_management/data/repository/store_products_repository_impl.dart'
    as _i315;
import '../../src/layouts/provider/settings/store_management/domain/repository/sizes_repository.dart'
    as _i137;
import '../../src/layouts/provider/settings/store_management/domain/repository/store_categories_repository.dart'
    as _i59;
import '../../src/layouts/provider/settings/store_management/domain/repository/store_products_repository.dart'
    as _i151;
import '../../src/layouts/provider/settings/store_management/domain/use_case/change_product_status_use_case.dart'
    as _i449;
import '../../src/layouts/provider/settings/store_management/domain/use_case/change_size_status_use_case.dart'
    as _i442;
import '../../src/layouts/provider/settings/store_management/domain/use_case/create_product_use_case.dart'
    as _i874;
import '../../src/layouts/provider/settings/store_management/domain/use_case/create_size_use_case.dart'
    as _i1029;
import '../../src/layouts/provider/settings/store_management/domain/use_case/delete_product_use_case.dart'
    as _i129;
import '../../src/layouts/provider/settings/store_management/domain/use_case/delete_size_use_case.dart'
    as _i1006;
import '../../src/layouts/provider/settings/store_management/domain/use_case/get_products_use_case.dart'
    as _i284;
import '../../src/layouts/provider/settings/store_management/domain/use_case/get_size_use_case.dart'
    as _i790;
import '../../src/layouts/provider/settings/store_management/domain/use_case/get_sizes_use_case.dart'
    as _i593;
import '../../src/layouts/provider/settings/store_management/domain/use_case/update_product_use_case.dart'
    as _i857;
import '../../src/layouts/provider/settings/store_management/domain/use_case/update_size_use_case.dart'
    as _i1003;
import '../../src/layouts/provider/settings/working_days/data/repository/working_days_repository_imp.dart'
    as _i423;
import '../../src/layouts/provider/settings/working_days/domain/repository/working_days_repository.dart'
    as _i224;
import '../../src/layouts/provider/settings/working_days/domain/use_case/create_working_day_use_case.dart'
    as _i932;
import '../../src/layouts/provider/settings/working_days/domain/use_case/delete_working_day_use_case.dart'
    as _i460;
import '../../src/layouts/provider/settings/working_days/domain/use_case/get_working_days_use_case.dart'
    as _i523;
import '../../src/layouts/provider/settings/working_days/domain/use_case/update_working_day_use_case.dart'
    as _i94;
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
import '../../src/shared/auth/domain/use_case/update_phone_use_case.dart'
    as _i310;
import '../../src/shared/auth/domain/use_case/update_profile_usecase.dart'
    as _i808;
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
import '../../src/shared/common/domain/use_cases/get_banks_use_case.dart'
    as _i800;
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
import '../../src/shared/common/domain/use_cases/get_sizes_use_case.dart'
    as _i602;
import '../../src/shared/common/domain/use_cases/get_sub_categories_use_case.dart'
    as _i543;
import '../../src/shared/common/domain/use_cases/get_vehicle_use_case.dart'
    as _i101;
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
    gh.lazySingleton<_i613.SearchDataSource>(
        () => _i613.SearchDataSourceImpl());
    gh.factory<_i143.WalletRepository>(
        () => _i78.WalletRepositoryImp(gh<_i351.DioHelper>()));
    gh.lazySingleton<_i545.PackagesRemoteDataSource>(
        () => _i545.PackagesRemoteDataSourceImpl());
    gh.factory<_i722.MenuCommonRepository>(
        () => _i434.MenuCommonRepositoryImp(gh<_i351.DioHelper>()));
    gh.factory<_i984.ThemeRepository>(() => _i715.ThemeRepositoryImp());
    gh.factory<_i177.SecureStorageDataSource>(
        () => _i177.SecureStorageDataSourceImpl());
    gh.factory<_i614.MapsDataSource>(() => _i614.MapsDataSourceImpl());
    gh.factory<_i203.LanguageCacheDateSource>(
        () => _i203.LanguageCacheDateSourceImp());
    gh.factory<_i224.ProvidersDataSource>(
        () => _i224.ProvidersDataSourceImpl(gh<_i351.DioHelper>()));
    gh.factory<_i59.StoreCategoriesRepository>(
        () => _i599.StoreCategoriesRepositoryImpl(gh<_i351.DioHelper>()));
    gh.factory<_i51.GetFaqUseCase>(
        () => _i51.GetFaqUseCase(gh<_i722.MenuCommonRepository>()));
    gh.factory<_i0.GetContactUsDataUseCase>(
        () => _i0.GetContactUsDataUseCase(gh<_i722.MenuCommonRepository>()));
    gh.factory<_i580.GetStaticDataUseCase>(
        () => _i580.GetStaticDataUseCase(gh<_i722.MenuCommonRepository>()));
    gh.factory<_i404.SendContactUsMessageUseCase>(() =>
        _i404.SendContactUsMessageUseCase(gh<_i722.MenuCommonRepository>()));
    gh.factory<_i224.WorkingDaysRepository>(
        () => _i423.WorkingDaysRepositoryImpl(gh<_i351.DioHelper>()));
    gh.factory<_i475.ProvidersRepository>(
        () => _i597.ProvidersRepositoryImpl(gh<_i224.ProvidersDataSource>()));
    gh.factory<_i856.GetTransactionsUseCase>(
        () => _i856.GetTransactionsUseCase(gh<_i143.WalletRepository>()));
    gh.factory<_i356.WithdrawBalanceUseCase>(
        () => _i356.WithdrawBalanceUseCase(gh<_i143.WalletRepository>()));
    gh.factory<_i355.CharageWalletUseCase>(
        () => _i355.CharageWalletUseCase(gh<_i143.WalletRepository>()));
    gh.factory<_i351.SecureStorageRepository>(() =>
        _i526.SecureStorageRepositoryImp(gh<_i177.SecureStorageDataSource>()));
    gh.factory<_i523.GetWorkingDaysUseCase>(
        () => _i523.GetWorkingDaysUseCase(gh<_i224.WorkingDaysRepository>()));
    gh.factory<_i932.CreateWorkingDayUseCase>(
        () => _i932.CreateWorkingDayUseCase(gh<_i224.WorkingDaysRepository>()));
    gh.factory<_i94.UpdateWorkingDayUseCase>(
        () => _i94.UpdateWorkingDayUseCase(gh<_i224.WorkingDaysRepository>()));
    gh.factory<_i460.DeleteWorkingDayUseCase>(
        () => _i460.DeleteWorkingDayUseCase(gh<_i224.WorkingDaysRepository>()));
    gh.factory<_i151.StoreProductsRepository>(
        () => _i315.StoreProductsRepositoryImpl(gh<_i351.DioHelper>()));
    gh.factory<_i113.NotificationDataSource>(
        () => _i113.NotificationDataSourceImp(gh<_i351.DioHelper>()));
    gh.factory<_i173.PaginationRepository>(
        () => _i625.PaginationRepoImpl(gh<_i351.DioHelper>()));
    gh.lazySingleton<_i608.PackagesRepository>(() =>
        _i715.PackagesRepositoryImpl(gh<_i545.PackagesRemoteDataSource>()));
    gh.lazySingleton<_i404.HomeRemoteDataSource>(
        () => _i404.HomeRemoteDataSourceImpl(gh<_i351.DioHelper>()));
    gh.factory<_i351.LanguageCacheRepository>(() =>
        _i361.LanguageCacheRepositoryImp(gh<_i203.LanguageCacheDateSource>()));
    gh.lazySingleton<_i672.SearchRepository>(
        () => _i215.SearchRepositoryImpl(gh<_i613.SearchDataSource>()));
    gh.factory<_i864.CommonRepository>(
        () => _i321.CommonRepositoryImp(gh<_i351.DioHelper>()));
    gh.factory<_i351.GetUserRoleUseCase>(
        () => _i351.GetUserRoleUseCase(gh<_i271.RoleCachedDataSource>()));
    gh.factory<_i351.SetUserRoleUseCase>(
        () => _i351.SetUserRoleUseCase(gh<_i271.RoleCachedDataSource>()));
    gh.factory<_i351.DeleteUserRoleUseCase>(
        () => _i351.DeleteUserRoleUseCase(gh<_i271.RoleCachedDataSource>()));
    gh.factory<_i101.GetVehicleUseCase>(
        () => _i101.GetVehicleUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i800.GetBanksUseCase>(
        () => _i800.GetBanksUseCase(gh<_i864.CommonRepository>()));
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
    gh.factory<_i137.SizesRepository>(
        () => _i1013.SizesRepositoryImpl(gh<_i351.DioHelper>()));
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
    gh.lazySingleton<_i993.HomeRepository>(
        () => _i618.HomeRepositoryImpl(gh<_i404.HomeRemoteDataSource>()));
    gh.factory<_i592.ProviderAuthenticationRepository>(
        () => _i352.ProviderRegisterRepositoryImpl(
              gh<_i351.DioHelper>(),
              gh<_i351.SecureStorageRepository>(),
            ));
    gh.factory<_i946.GetProvidersUseCase>(
        () => _i946.GetProvidersUseCase(gh<_i475.ProvidersRepository>()));
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
    gh.factory<_i965.GetProviderUserCase>(() => _i965.GetProviderUserCase(
        gh<_i592.ProviderAuthenticationRepository>()));
    gh.factory<_i81.ProviderMainInformationUseCase>(() =>
        _i81.ProviderMainInformationUseCase(
            gh<_i592.ProviderAuthenticationRepository>()));
    gh.factory<_i602.MapsRepository>(
        () => _i596.MapsRepositoryImp(gh<_i614.MapsDataSource>()));
    gh.factory<_i719.DeliveryRegisterRepository>(
        () => _i893.DeliveryRegisterRepositoryImpl(
              gh<_i351.DioHelper>(),
              gh<_i351.SecureStorageRepository>(),
            ));
    gh.factory<_i771.GetEducationalYearsUseCase>(
        () => _i771.GetEducationalYearsUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i206.GetEducationalStageUseCase>(
        () => _i206.GetEducationalStageUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i874.GetCountriesUseCase>(
        () => _i874.GetCountriesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i456.GetMainCategoriesUseCase>(
        () => _i456.GetMainCategoriesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i530.GetLanguagesUseCase>(
        () => _i530.GetLanguagesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i543.GetEducationalSubjectUseCase>(
        () => _i543.GetEducationalSubjectUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i543.GetSubCategoriesUseCase>(
        () => _i543.GetSubCategoriesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i478.GetCitiesUseCase>(
        () => _i478.GetCitiesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i1069.GetAreasUseCase>(
        () => _i1069.GetAreasUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i602.GetSizesUseCase>(
        () => _i602.GetSizesUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i593.GetSizesUseCase>(
        () => _i593.GetSizesUseCase(gh<_i137.SizesRepository>()));
    gh.factory<_i43.GetPackagesUseCase>(
        () => _i43.GetPackagesUseCase(gh<_i608.PackagesRepository>()));
    gh.factory<_i60.DeliveryMainInformationUseCase>(() =>
        _i60.DeliveryMainInformationUseCase(
            gh<_i719.DeliveryRegisterRepository>()));
    gh.factory<_i635.RegiserUseCase>(
        () => _i635.RegiserUseCase(gh<_i561.UserRegisterRepository>()));
    gh.factory<_i693.GetHomeOffersUseCase>(
        () => _i693.GetHomeOffersUseCase(gh<_i993.HomeRepository>()));
    gh.factory<_i2.GetHomeBannersUseCase>(
        () => _i2.GetHomeBannersUseCase(gh<_i993.HomeRepository>()));
    gh.factory<_i129.DeleteProductUseCase>(
        () => _i129.DeleteProductUseCase(gh<_i151.StoreProductsRepository>()));
    gh.factory<_i449.ChangeProductStatusUseCase>(() =>
        _i449.ChangeProductStatusUseCase(gh<_i151.StoreProductsRepository>()));
    gh.factory<_i284.GetProductsUseCase>(
        () => _i284.GetProductsUseCase(gh<_i151.StoreProductsRepository>()));
    gh.factory<_i857.UpdateProductUseCase>(
        () => _i857.UpdateProductUseCase(gh<_i151.StoreProductsRepository>()));
    gh.factory<_i874.CreateProductUseCase>(
        () => _i874.CreateProductUseCase(gh<_i151.StoreProductsRepository>()));
    gh.factory<_i346.GetSearchSuggestionsUseCase>(
        () => _i346.GetSearchSuggestionsUseCase(gh<_i602.MapsRepository>()));
    gh.factory<_i950.GetMapLocationAddressUseCase>(
        () => _i950.GetMapLocationAddressUseCase(gh<_i602.MapsRepository>()));
    gh.factory<_i949.GetMapsPlaceDetailsUseCase>(
        () => _i949.GetMapsPlaceDetailsUseCase(gh<_i602.MapsRepository>()));
    gh.factory<_i25.SendRateUseCase>(
        () => _i25.SendRateUseCase(gh<_i864.CommonRepository>()));
    gh.factory<_i927.DeliveryVehicleDataUseCase>(() =>
        _i927.DeliveryVehicleDataUseCase(
            gh<_i719.DeliveryRegisterRepository>()));
    gh.factory<_i345.GetDeliveryUseCase>(
        () => _i345.GetDeliveryUseCase(gh<_i719.DeliveryRegisterRepository>()));
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
    gh.factory<_i843.GetRecentSearchesUseCase>(
        () => _i843.GetRecentSearchesUseCase(gh<_i672.SearchRepository>()));
    gh.factory<_i160.GetPopularSearchesUseCase>(
        () => _i160.GetPopularSearchesUseCase(gh<_i672.SearchRepository>()));
    gh.factory<_i350.SearchUseCase>(
        () => _i350.SearchUseCase(gh<_i672.SearchRepository>()));
    gh.factory<_i266.ProviderStoreDataUseCase>(() =>
        _i266.ProviderStoreDataUseCase(
            gh<_i592.ProviderAuthenticationRepository>()));
    gh.factory<_i386.ProviderStoreAddressUseCase>(() =>
        _i386.ProviderStoreAddressUseCase(
            gh<_i592.ProviderAuthenticationRepository>()));
    gh.factory<_i1029.CreateSizeUseCase>(
        () => _i1029.CreateSizeUseCase(gh<_i137.SizesRepository>()));
    gh.factory<_i1006.DeleteSizeUseCase>(
        () => _i1006.DeleteSizeUseCase(gh<_i137.SizesRepository>()));
    gh.factory<_i1003.UpdateSizeUseCase>(
        () => _i1003.UpdateSizeUseCase(gh<_i137.SizesRepository>()));
    gh.factory<_i790.GetSizeUseCase>(
        () => _i790.GetSizeUseCase(gh<_i137.SizesRepository>()));
    gh.factory<_i442.ChangeSizeStatusUseCase>(
        () => _i442.ChangeSizeStatusUseCase(gh<_i137.SizesRepository>()));
    gh.lazySingleton<_i808.UpdateProfileUseCase>(() =>
        _i808.UpdateProfileUseCase(
            repository: gh<_i1005.AuthenticationRepository>()));
    gh.factory<_i368.DeliveryBankInfoUseCase>(() =>
        _i368.DeliveryBankInfoUseCase(gh<_i719.DeliveryRegisterRepository>()));
    gh.factory<_i966.GetCurrentUserLocationUseCase>(
        () => _i966.GetCurrentUserLocationUseCase(
              gh<_i185.EnableGpsAndHandlePermissionUseCase>(),
              gh<_i950.GetMapLocationAddressUseCase>(),
            ));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
