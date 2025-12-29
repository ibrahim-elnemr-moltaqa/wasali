import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../repository/common_repository.dart';

@injectable
class GetCountriesUseCase extends IUseCase<List<CommonEntity>, NoParams> {
  final CommonRepository _repository;

  GetCountriesUseCase(this._repository);
  @override
  Future<Either<Failure, List<CommonEntity>>> call(NoParams countryId) async {
    return await _repository.getCountries();
  }
}
