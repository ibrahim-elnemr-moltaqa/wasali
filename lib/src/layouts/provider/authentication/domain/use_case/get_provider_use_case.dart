import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/entity/provider_entity.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/repository/provider_authentication_repository.dart';

@Injectable()
class GetProviderUserCase extends IUseCase<ProviderEntity, NoParams> {
  final ProviderAuthenticationRepository _providerRegisterRepository;
  GetProviderUserCase(this._providerRegisterRepository);
  @override
  Future<Either<Failure, ProviderEntity>> call(NoParams countryId) async {
    return await _providerRegisterRepository.getProvider();
  }
}
