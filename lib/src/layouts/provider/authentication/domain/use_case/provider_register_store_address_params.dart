import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/repository/provider_authentication_repository.dart';

@Injectable()
class ProviderStoreAddressUseCase extends IUseCase<Unit, StoreAddressParams> {
  final ProviderAuthenticationRepository providerRegisterRepository;
  ProviderStoreAddressUseCase(this.providerRegisterRepository);

  @override
  Future<Either<Failure, Unit>> call(StoreAddressParams countryId) async {
    return await providerRegisterRepository
        .providerRegisterStoreAddress(countryId);
  }
}

class StoreAddressParams extends Equatable {
  final String? address;
  final String? lat;
  final String? lng;
  final int? countryId;
  final int? cityId;
  final int? areaId;
  final bool isUpdate;

  const StoreAddressParams(
      {this.address,
      this.lat,
      this.lng,
      this.countryId,
      this.cityId,
      this.areaId,
      this.isUpdate = false});

  Map<String, dynamic> toJson() => {
        if (address != null) 'address': address,
        if (lat != null) 'lat': lat,
        if (lng != null) 'lng': lng,
        if (countryId != null) 'country_id': countryId,
        if (cityId != null) 'city_id': cityId,
        if (areaId != null) 'area_id': areaId,
      };

  @override
  List<Object?> get props =>
      [address, lat, lng, countryId, cityId, areaId, isUpdate];
}
