import 'package:injectable/injectable.dart';
import 'package:wasli/src/layouts/provider/settings/packages/data/model/package_model.dart';

abstract class PackagesRemoteDataSource {
  Future<List<PackageModel>> getPackages();
}

@LazySingleton(as: PackagesRemoteDataSource)
class PackagesRemoteDataSourceImpl implements PackagesRemoteDataSource {
  @override
  Future<List<PackageModel>> getPackages() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 1));

    return List.generate(
      4,
      (index) => PackageModel(
        id: index + 1,
        name: 'اسم الباقة',
        price: 300,
        duration: 3,
        description:
            'باقة مميزة تمنحك إمكانية إضافة منتجاتك وعرضها لعملائك بسهولة، باقة مميزة تمنحك إمكانية إضافة منتجاتك وعرضها لعملائك بسهولة',
        isPromoted: true,
      ),
    );
  }
}
