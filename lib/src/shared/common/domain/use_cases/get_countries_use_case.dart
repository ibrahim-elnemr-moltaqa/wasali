import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../entity/country_entity.dart';
import '../repository/common_repository.dart';

@injectable
class GetCountriesUseCase extends IUseCase<List<CountryEntity>, NoParams> {
  final CommonRepository _repository;

  GetCountriesUseCase(this._repository);
  @override
  Future<Either<Failure, List<CountryEntity>>> call(NoParams params) async {
    return await _repository.getCountries();
  }
}
