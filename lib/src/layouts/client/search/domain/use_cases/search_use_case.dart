
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/core.dart';
import '../entities/search_entity.dart';
import '../repositories/search_repository.dart';

@injectable
class SearchUseCase extends IUseCase<SearchResultEntity, String> {
  final SearchRepository _repository;

  SearchUseCase(this._repository);

  @override
  DomainServiceType<SearchResultEntity> call(String params) {
    return _repository.search(params);
  }
}
