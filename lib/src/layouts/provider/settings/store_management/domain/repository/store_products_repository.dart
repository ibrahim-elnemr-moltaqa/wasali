import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/product_body.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/product_entity.dart';

abstract class StoreProductsRepository {
  DomainServiceType<List<ProductEntity>> getProducts();
  DomainServiceType<ProductEntity> createProduct(ProductBody body);
  DomainServiceType<ProductEntity> updateProduct(ProductBody body);
  DomainServiceType<Unit> deleteProduct(int productId);
  DomainServiceType<Unit> changeProductStatus(int productId);
}
