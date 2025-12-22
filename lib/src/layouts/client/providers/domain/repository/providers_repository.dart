import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/providers/data/model/provider_model.dart';
import 'package:wasli/src/layouts/client/providers/domain/use_cases/get_providers_use_case.dart';

abstract class ProvidersRepository {
  Future<Either<Failure, List<ProviderModel>>> getProviders({GetProvidersParams? params});
  
}