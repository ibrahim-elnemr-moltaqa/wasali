import '../../../../core/core.dart';
import '../entities/paginated_entity.dart';
import '../use_cases/fetch_pagination_data_use_case.dart';

abstract class PaginationRepository {
  DomainServiceType<PagedResponse<T>> fetchPaginated<T>(
      PaginatedParams<T> params);
}
