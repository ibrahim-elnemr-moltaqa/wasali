import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/product_body.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/product_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/store_products_repository.dart';

@injectable
class CreateProductUseCase extends IUseCase<ProductEntity, ProductBody> {
  final StoreProductsRepository _repository;

  CreateProductUseCase(this._repository);

  @override
  DomainServiceType<ProductEntity> call(ProductBody params) {
    return _repository.createProduct(params);
  }
}
