
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/core.dart';
import '../repositories/search_repository.dart';

@injectable
class GetPopularSearchesUseCase
    extends IUseCase<List<String>, NoParams> {
  final SearchRepository _repository;

  GetPopularSearchesUseCase(this._repository);

  @override
  DomainServiceType<List<String>> call(NoParams params) {
    return _repository.getPopularSearches();
  }
}
