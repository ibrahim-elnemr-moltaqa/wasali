import '../../../../core/core.dart';
import '../../domain/entities/paginated_entity.dart';
import '../../domain/repositories/pagination_repo.dart';
import '../../domain/use_cases/fetch_pagination_data_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaginationRepository)
class PaginationRepoImpl extends PaginationRepository {
  final DioHelper _dioHelper;
  PaginationRepoImpl(this._dioHelper);

  @override
  DomainServiceType<PagedResponse<T>> fetchPaginated<T>(
      PaginatedParams<T> params) async {
    return failerCollect(() async {
      final results = await _dioHelper.get(
        url: params.endpoint,
        queryParameters: {
          "page": params.page,
        },
      );
      return Right(PagedResponse<T>.fromJson(results, params.fromJson));
    });
  }
}
