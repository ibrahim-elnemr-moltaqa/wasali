import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/packages/data/datasource/packages_subscriptions_remote_data_source.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/repository/packages_subscriptions_repository.dart';

@LazySingleton(as: PackagesSubscriptionsRepository)
class PackagesSubscriptionsRepositoryImpl
    implements PackagesSubscriptionsRepository {
  final PackagesSubscriptionsRemoteDataSource _remoteDataSource;

  PackagesSubscriptionsRepositoryImpl(this._remoteDataSource);

  @override
  DomainServiceType<List<PackageEntity>> getPackages() async {
    return await failureCollect(() async {
      final packages = await _remoteDataSource.getPackages();
      return Right(packages);
    });
  }

  @override
  DomainServiceType<List<SubscriptionEntity>> getSubscriptions() async {
    return await failureCollect(() async {
      final subscriptions = await _remoteDataSource.getSubscriptions();
      return Right(subscriptions);
    });
  }

  @override
  DomainServiceType<Unit> subscribePackage(int packageId) async {
    return await failureCollect(() async {
      await _remoteDataSource.subscribePackage(packageId);
      return const Right(unit);
    });
  }
}
