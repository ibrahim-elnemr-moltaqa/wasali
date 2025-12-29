import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/entity/delivery_user_entity.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/repository/delivery_authentication_repository.dart';

@injectable
class GetDeliveryUseCase extends IUseCase<DeliveryUserEntity, NoParams> {
  final DeliveryAuthenticationRepository repository;

  GetDeliveryUseCase(this.repository);

  @override
  DomainServiceType<DeliveryUserEntity> call(NoParams countryId) async =>
      await repository.getDeliveryUser();
}
