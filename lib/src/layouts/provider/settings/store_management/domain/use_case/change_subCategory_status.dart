import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/store_categories_repository.dart';

@injectable
class ChangeSubCategoryStatusUseCase extends IUseCase<Unit, int> {
  final StoreCategoriesRepository repository;

  ChangeSubCategoryStatusUseCase(this.repository);

  @override
  DomainServiceType<Unit> call(int params) {
    return repository.changeCategoriesStatus(params);
  }
}
