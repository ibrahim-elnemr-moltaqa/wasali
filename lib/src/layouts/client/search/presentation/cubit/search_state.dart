
import 'package:equatable/equatable.dart';
import '../../../../../../core/core.dart';
import '../../domain/entities/search_entity.dart';

class SearchState extends Equatable {
  final Async<List<String>> recent;
  final Async<List<String>> popular;
  final Async<SearchResultEntity> searchResult;
  final String query;

  const SearchState({
    this.recent = const Async.initial(),
    this.popular = const Async.initial(),
    this.searchResult = const Async.initial(),
    this.query = '',
  });

  SearchState copyWith({
    Async<List<String>>? recent,
    Async<List<String>>? popular,
    Async<SearchResultEntity>? searchResult,
    String? query,
  }) {
    return SearchState(
      recent: recent ?? this.recent,
      popular: popular ?? this.popular,
      searchResult: searchResult ?? this.searchResult,
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [recent, popular, searchResult, query];
}
