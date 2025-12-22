import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/product_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/store_products_repository.dart';

@injectable
class GetProductsUseCase extends IUseCase<List<ProductEntity>, NoParams> {
  final StoreProductsRepository _repository;

  GetProductsUseCase(this._repository);

  @override
  DomainServiceType<List<ProductEntity>> call(NoParams params) {
    return _repository.getProducts();
  }
}
