import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';

abstract class StoreCategoriesRepository {
  DomainServiceType<List<CategoryEntity>> getProfileSubCategories({String? name, int? active});
  DomainServiceType<Unit> assignSubCategories(List<int> subCategoryIds);
  DomainServiceType<Unit> changeCategoriesStatus(int subCategoryId);
}
