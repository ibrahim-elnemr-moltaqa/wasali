import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../repository/common_repository.dart';

@injectable
class GetAreasUseCase extends IUseCase<List<CommonEntity>, int> {
  final CommonRepository _repository;

  GetAreasUseCase(this._repository);
  @override
  Future<Either<Failure, List<CommonEntity>>> call(int? countryId) async {
    return await _repository.getAreas(countryId: countryId);
  }
}
