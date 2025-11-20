import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../entity/educational_subject_entity.dart';
import '../repository/common_repository.dart';

@injectable
class GetEducationalSubjectUseCase
    extends IUseCase<List<EducationalSubjectEntity>, NoParams> {
  final CommonRepository _repository;

  GetEducationalSubjectUseCase(this._repository);
  @override
  Future<Either<Failure, List<EducationalSubjectEntity>>> call(
      NoParams params) async {
    return await _repository.getEducationalSubject();
  }
}
