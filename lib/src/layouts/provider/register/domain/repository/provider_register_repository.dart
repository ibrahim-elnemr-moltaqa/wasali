import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/register/domain/use_case/provider_register_main_information_use_case.dart';
import 'package:wasli/src/layouts/provider/register/domain/use_case/provider_register_store_address_params.dart';
import 'package:wasli/src/layouts/provider/register/domain/use_case/provider_register_store_data_use_case.dart';

abstract class ProviderRegisterRepository {
  DomainServiceType<Unit> providerRegisterMainInformations(
      MainInformationsParams params);

  DomainServiceType<Unit> providerRegisterStoreInformations(
      StoreDataParams params);

  DomainServiceType<Unit> providerRegisterStoreAddress(
      StoreAddressParams params);
}
