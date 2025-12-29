import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../repository/common_repository.dart';

@injectable
class GetCitiesUseCase extends IUseCase<List<CommonEntity>, int> {
  final CommonRepository _repository;

  GetCitiesUseCase(this._repository);
  @override
  Future<Either<Failure, List<CommonEntity>>> call(int? areaId) async {
    return await _repository.getCities(areaId: areaId);
  }
}
