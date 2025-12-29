import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/repository/common_repository.dart';

@injectable
class GetMainCategoriesUseCase
    extends IUseCase<List<CategoryEntity>, NoParams> {
  GetMainCategoriesUseCase(this._repository);
  final CommonRepository _repository;
  @override
  DomainServiceType<List<CategoryEntity>> call(NoParams countryId) {
    return _repository.getMainCategories();
  }
}
