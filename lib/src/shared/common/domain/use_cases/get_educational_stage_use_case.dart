import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../entity/educational_stage_entity.dart';
import '../repository/common_repository.dart';

@injectable
class GetEducationalStageUseCase
    extends IUseCase<List<EducationalStageEntity>, NoParams> {
  final CommonRepository _repository;

  GetEducationalStageUseCase(this._repository);
  @override
  Future<Either<Failure, List<EducationalStageEntity>>> call(
      NoParams params) async {
    return await _repository.getEducationalStages();
  }
}
