import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../entities/paginated_entity.dart';
import '../repositories/pagination_repo.dart';

@injectable
class FetchPaginatedDataUseCase<T>
    extends IUseCase<PagedResponse<T>, PaginatedParams<T>> {
  final PaginationRepository repository;
  FetchPaginatedDataUseCase(this.repository);

  @override
  DomainServiceType<PagedResponse<T>> call(PaginatedParams<T> countryId) {
    return repository.fetchPaginated(countryId);
  }
}

class PaginatedParams<T> {
  final String endpoint;
  final int page;
  final T Function(Map<String, dynamic>) fromJson;
  PaginatedParams({
    required this.endpoint,
    required this.page,
    required this.fromJson,
  });
}
