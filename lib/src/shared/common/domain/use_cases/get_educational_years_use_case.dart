import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../entity/educational_year_entity.dart';
import '../repository/common_repository.dart';

@injectable
class GetEducationalYearsUseCase
    extends IUseCase<List<EducationalYearEntity>, int> {
  final CommonRepository _repository;

  GetEducationalYearsUseCase(this._repository);
  @override
  Future<Either<Failure, List<EducationalYearEntity>>> call(
      int params) async {
    return await _repository.getEducationalYears(params);
  }
}
