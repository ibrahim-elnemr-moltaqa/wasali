import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/repository/packages_subscriptions_repository.dart';

@injectable
class GetSubscriptionsUseCase extends IUseCase<List<SubscriptionEntity>, NoParams> {
  final PackagesSubscriptionsRepository _repository;

  GetSubscriptionsUseCase(this._repository);

  @override
  DomainServiceType<List<SubscriptionEntity>> call(NoParams params) {
    return _repository.getSubscriptions();
  }
}
