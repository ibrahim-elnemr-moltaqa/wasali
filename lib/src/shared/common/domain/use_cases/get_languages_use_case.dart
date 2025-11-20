import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../entity/language_entity.dart';
import '../repository/common_repository.dart';

@injectable
class GetLanguagesUseCase extends IUseCase<List<LanguageEntity>, NoParams> {
  final CommonRepository _repository;

  GetLanguagesUseCase(this._repository);
  @override
  Future<Either<Failure, List<LanguageEntity>>> call(NoParams params) async {
    return await _repository.getLanguages();
  }
}
