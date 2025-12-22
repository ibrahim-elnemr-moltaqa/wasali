import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/api_product_model.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/product_body.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/store_products_repository.dart';

@Injectable(as: StoreProductsRepository)
class StoreProductsRepositoryImpl implements StoreProductsRepository {
  final DioHelper _dioHelper;

  StoreProductsRepositoryImpl(this._dioHelper);

  @override
  DomainServiceType<List<ApiProductModel>> getProducts() async {
    return await failureCollect(() async {
      final response = await _dioHelper.get(url: 'products');
      return Right(apiProductModelFromJson(response['data']['data']));
    });
  }

  @override
  DomainServiceType<ApiProductModel> createProduct(ProductBody body) async {
    return await failureCollect(() async {
      final response = await _dioHelper.post(
        url: 'products',
        body: body.toJson(),
      );
      final result = ApiProductModel.fromJson(response['data']['Product']);
      return Right(result);
    });
  }

  @override
  DomainServiceType<ApiProductModel> updateProduct(ProductBody body) async {
    return await failureCollect(() async {
      final response = await _dioHelper.post(
        url: 'products/${body.id}',
        body: body.toJson(),
      );
      final result = ApiProductModel.fromJson(response['data']['Product']);
      return Right(result);
    });
  }

  @override
  DomainServiceType<Unit> deleteProduct(int productId) async {
    return await failureCollect(() async {
      await _dioHelper.delete(url: 'products/$productId');
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<Unit> changeProductStatus(int productId) async {
    return await failureCollect(() async {
      await _dioHelper.post(url: 'change_status/$productId');
      return const Right(unit);
    });
  }
}
