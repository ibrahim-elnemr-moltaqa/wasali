import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/providers/data/data_source/providers_data_source.dart';
import 'package:wasli/src/layouts/client/providers/data/model/provider_model.dart';
import 'package:wasli/src/layouts/client/providers/domain/repository/providers_repository.dart';
import 'package:wasli/src/layouts/client/providers/domain/use_cases/get_providers_use_case.dart';

@Injectable(as: ProvidersRepository)
class ProvidersRepositoryImpl implements ProvidersRepository {
  final ProvidersDataSource _dataSource;

  ProvidersRepositoryImpl(this._dataSource);


  @override
  Future<Either<Failure, List<ProviderModel>>> getProviders({GetProvidersParams? params}) async {
    try {
      final providers = await _dataSource.fetchProviders(params: params);
      return Right(providers);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
