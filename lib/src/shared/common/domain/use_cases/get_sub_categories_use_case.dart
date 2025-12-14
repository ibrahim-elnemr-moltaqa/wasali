import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/domain/repository/common_repository.dart';

@injectable
class GetSubCategoriesUseCase extends IUseCase<List<CategoryEntity>, NoParams> {
  final CommonRepository _repository;

  GetSubCategoriesUseCase(this._repository);
  @override
  DomainServiceType<List<CategoryEntity>> call(NoParams params) {
    return _repository.getSubCategories();
  }
}
