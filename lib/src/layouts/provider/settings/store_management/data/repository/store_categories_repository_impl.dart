import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/store_categories_repository.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';

@Injectable(as: StoreCategoriesRepository)
class StoreCategoriesRepositoryImpl implements StoreCategoriesRepository {
  final DioHelper _dioHelper;

  StoreCategoriesRepositoryImpl(this._dioHelper);

  @override
  DomainServiceType<List<CategoryEntity>> getProfileSubCategories(
      {String? name, int? active}) async {
    return await failureCollect(() async {
      final response = await _dioHelper.get(
        url: 'profle-sub-categories',
        queryParameters: {
          if (name != null) 'name': name,
          if (active != null) 'is_active': active,
        },
      );
      final List<dynamic> data = response['data']['sub_categories'];
      return Right(data.map((x) => CategoryEntity.fromJson(x)).toList());
    });
  }

  @override
  DomainServiceType<Unit> assignSubCategories(List<int> subCategoryIds) async {
    return await failureCollect(() async {
      final Map<String, dynamic> body = {};
      for (int i = 0; i < subCategoryIds.length; i++) {
        body['sub_category[$i]'] = subCategoryIds[i];
      }
      await _dioHelper.post(url: 'assign-sub-categorey', body: body);
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<Unit> changeCategoriesStatus(int subCategoryId) async {
    return await failureCollect(() async {
      await _dioHelper.post(url: 'sub_category/change_status/$subCategoryId');
      return const Right(unit);
    });
  }
}
