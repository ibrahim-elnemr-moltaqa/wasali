
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/core.dart';
import '../repositories/search_repository.dart';

@injectable
class GetRecentSearchesUseCase
    extends IUseCase<List<String>, NoParams> {
  final SearchRepository _repository;

  GetRecentSearchesUseCase(this._repository);

  @override
  DomainServiceType<List<String>> call(NoParams params) {
    return _repository.getRecentSearches();
  }
}
