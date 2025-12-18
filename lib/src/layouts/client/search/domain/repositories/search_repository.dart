
import '../../../../../../core/core.dart';
import '../entities/search_entity.dart';

abstract class SearchRepository {
  DomainServiceType<List<String>> getRecentSearches();
  DomainServiceType<List<String>> getPopularSearches();
  DomainServiceType<SearchResultEntity> search(String query);
}
