import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/di/di.dart';
import '../../domain/use_cases/get_popular_searches_use_case.dart';
import '../../domain/use_cases/get_recent_searches_use_case.dart';
import '../../domain/use_cases/search_use_case.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetRecentSearchesUseCase _getRecentSearchesUseCase = injector();
  final GetPopularSearchesUseCase _getPopularSearchesUseCase = injector();
  final SearchUseCase _searchUseCase = injector();

  SearchCubit() : super(const SearchState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(
      recent: const Async.loading(),
      popular: const Async.loading(),
    ));

    final results = await Future.wait([
      _getRecentSearchesUseCase(NoParams()),
      _getPopularSearchesUseCase(NoParams()),
    ]);

    final recentResult = results[0] as dynamic;
    final popularResult = results[1] as dynamic;

    Async<List<String>> recentAsync = state.recent;
    Async<List<String>> popularAsync = state.popular;

    recentResult.fold(
      (failure) => recentAsync = Async.failure(failure),
      (data) => recentAsync = Async.success(data),
    );

    popularResult.fold(
      (failure) => popularAsync = Async.failure(failure),
      (data) => popularAsync = Async.success(data),
    );

    emit(state.copyWith(
      recent: recentAsync,
      popular: popularAsync,
    ));
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      emit(state.copyWith(query: query, searchResult: const Async.initial()));
      return;
    }

    emit(state.copyWith(
      query: query,
      searchResult: const Async.loading(),
    ));

    final result = await _searchUseCase(query);

    result.fold(
      (failure) => emit(state.copyWith(searchResult: Async.failure(failure))),
      (data) => emit(state.copyWith(searchResult: Async.success(data))),
    );
  }

  void clearSearch() {
    emit(state.copyWith(query: '', searchResult: const Async.initial()));
  }
}
