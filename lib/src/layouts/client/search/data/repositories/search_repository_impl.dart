import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../domain/entities/search_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_sources/search_data_source.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _dataSource;

  SearchRepositoryImpl(this._dataSource);

  @override
  DomainServiceType<List<String>> getRecentSearches() async {
    try {
      final result = await _dataSource.getRecentSearches();
      return Right(result);
    } catch (e) {
      return const Left(Failure(message: 'Simulated Failure'));
    }
  }

  @override
  DomainServiceType<List<String>> getPopularSearches() async {
    try {
      final result = await _dataSource.getPopularSearches();
      return Right(result);
    } catch (e) {
      return const Left(Failure(message: 'Simulated Failure'));
    }
  }

  @override
  DomainServiceType<SearchResultEntity> search(String query) async {
    try {
      final result = await _dataSource.search(query);
      return Right(result);
    } catch (e) {
      return const Left(Failure(message: 'Simulated Failure'));
    }
  }
}
