import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/packages/data/model/package_model.dart';
import 'package:wasli/src/layouts/provider/settings/packages/data/model/subscription_model.dart';

abstract class PackagesSubscriptionsRemoteDataSource {
  Future<List<PackageModel>> getPackages();
  Future<void> subscribePackage(int packageId);
  Future<List<SubscriptionModel>> getSubscriptions();
}

@LazySingleton(as: PackagesSubscriptionsRemoteDataSource)
class PackagesSubscriptionsRemoteDataSourceImpl
    implements PackagesSubscriptionsRemoteDataSource {
  final DioHelper dioHelper;

  PackagesSubscriptionsRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<List<PackageModel>> getPackages() async {
    final response = await dioHelper.get(url: 'packages');
    final List data = response['data']['data'] ?? [];
    return packageModelFromJson(data);
  }

  @override
  Future<void> subscribePackage(int packageId) async {
    await dioHelper.post(url: 'subscriptions', body: {'package_id': packageId});
  }
  
  @override
  Future<List<SubscriptionModel>> getSubscriptions() async{
    final response = await dioHelper.get(url: 'subscriptions');
    final List data = response['data']['data'] ?? [];
    return subscriptionModelFromJson(data);
    
  }
}
