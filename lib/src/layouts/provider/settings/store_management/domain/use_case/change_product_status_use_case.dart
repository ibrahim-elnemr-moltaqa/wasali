import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/store_products_repository.dart';

@injectable
class ChangeProductStatusUseCase extends IUseCase<Unit, int> {
  final StoreProductsRepository _repository;

  ChangeProductStatusUseCase(this._repository);

  @override
  DomainServiceType<Unit> call(int params) {
    return _repository.changeProductStatus(params);
  }
}
