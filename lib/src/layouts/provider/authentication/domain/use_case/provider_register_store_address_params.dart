import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/repository/provider_authentication_repository.dart';

@Injectable()
class ProviderRegisterStoreAddressUseCase
    extends IUseCase<Unit, StoreAddressParams> {
  final ProviderAuthenticationRepository providerRegisterRepository;
  ProviderRegisterStoreAddressUseCase(this.providerRegisterRepository);

  @override
  Future<Either<Failure, Unit>> call(StoreAddressParams params) async {
    return await providerRegisterRepository
        .providerRegisterStoreAddress(params);
  }
}

class StoreAddressParams extends Equatable {
  final String address;
  final String lat;
  final String lng;
  final int countryId;
  final int cityId;
  final int areaId;
  final bool isUpdate;

  const StoreAddressParams(
      {required this.address,
      required this.lat,
      required this.lng,
      required this.countryId,
      required this.cityId,
      required this.areaId,
      this.isUpdate = false});

  Map<String, dynamic> toJson() => {
        'address': address,
        'lat': lat,
        'lng': lng,
        'country_id': countryId,
        'city_id': cityId,
        'area_id': areaId,
      };

  @override
  List<Object?> get props =>
      [address, lat, lng, countryId, cityId, areaId, isUpdate];
}
