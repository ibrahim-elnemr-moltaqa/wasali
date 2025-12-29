import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/repository/packages_subscriptions_repository.dart';

@injectable
class SubscribePackageUseCase extends IUseCase<Unit, int> {
  final PackagesSubscriptionsRepository _repository;

  SubscribePackageUseCase(this._repository);

  @override
  DomainServiceType<Unit> call(int countryId) {
    return _repository.subscribePackage(countryId);
  }
}
