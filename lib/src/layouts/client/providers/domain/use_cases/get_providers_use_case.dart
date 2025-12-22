import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_filter_enum.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';
import 'package:wasli/src/layouts/client/providers/data/model/provider_model.dart';
import 'package:wasli/src/layouts/client/providers/domain/repository/providers_repository.dart';

@injectable
class GetProvidersUseCase
    extends IUseCase<List<ProviderModel>, GetProvidersParams> {
  final ProvidersRepository _repository;

  GetProvidersUseCase(this._repository);

  @override
  Future<Either<Failure, List<ProviderModel>>> call(GetProvidersParams params) {
    return _repository.getProviders(params: params);
  }
}

class GetProvidersParams {
  final int? categoryId;
  final String? query;
  final ProviderStatusEnum? status;
  final ProviderFilterEnum? filter;

  const GetProvidersParams(
      {this.categoryId, this.query, this.status, this.filter});
}
