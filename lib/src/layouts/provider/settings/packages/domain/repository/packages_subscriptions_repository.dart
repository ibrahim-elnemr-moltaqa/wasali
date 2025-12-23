import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';

abstract class PackagesSubscriptionsRepository {
  DomainServiceType<List<PackageEntity>> getPackages();
  DomainServiceType<Unit> subscribePackage(int packageId);  
  DomainServiceType<List<SubscriptionEntity>> getSubscriptions();

}
