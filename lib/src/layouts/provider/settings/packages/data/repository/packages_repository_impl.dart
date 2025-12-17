import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';

import 'package:wasli/src/layouts/provider/settings/packages/data/datasource/packages_remote_data_source.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/repository/packages_repository.dart';

@LazySingleton(as: PackagesRepository)
class PackagesRepositoryImpl implements PackagesRepository {
  final PackagesRemoteDataSource _remoteDataSource;

  PackagesRepositoryImpl(this._remoteDataSource);

  @override
  DomainServiceType<List<PackageEntity>> getPackages() async {
    try {
      final result = await _remoteDataSource.getPackages();
      return Right(result);
    } catch (e) {
      // In a real app, we would parse the error to a Failure
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
