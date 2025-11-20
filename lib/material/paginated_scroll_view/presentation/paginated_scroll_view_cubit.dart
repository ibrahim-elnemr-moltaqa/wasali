import '../../../core/core.dart';
import '../../../core/di/di.dart';
import '../domain/use_cases/fetch_pagination_data_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginationCubit<T> extends Cubit<Async<List<T>>> {
  final FetchPaginatedDataUseCase<T> useCase = injector();
  final String endpoint;
  final T Function(Map<String, dynamic>) fromJson;

  PaginationCubit({
    required this.endpoint,
    required this.fromJson,
  }) : super(const Async.initial());

  final List<T> _items = [];
  int _currentPage = 1;
  bool _hasMore = true;

  bool get hasMore => _hasMore;
  List<T> get items => _items;

  Future<void> loadInitial() async {
    _currentPage = 1;
    _hasMore = true;
    _items.clear();
    emit(const Async.loading());
    await _fetch();
  }

  Future<void> loadMore() async {
    if (state.isLoading || !_hasMore) return;
    await _fetch();
  }

  Future<void> _fetch() async {
    emit(const Async.loading());
    final result = await useCase(PaginatedParams<T>(
      endpoint: endpoint,
      page: _currentPage,
      fromJson: fromJson,
    ));

    result.fold(
      (failure) {
        emit(Async<List<T>>.failure(failure));
      },
      (response) {
        _items.addAll(response.data);
        _hasMore = response.meta.hasNextPage;
        _currentPage++;
        emit(Async<List<T>>.success(_items));
      },
    );
  }
}
