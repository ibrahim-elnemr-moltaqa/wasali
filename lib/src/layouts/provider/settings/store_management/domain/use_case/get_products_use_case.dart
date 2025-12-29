import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/product_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/store_products_repository.dart';

class ManagementFetchParams extends Equatable {
  final String? name;
  final int? active;

  const ManagementFetchParams({this.name, this.active});

  @override
  List<Object?> get props => [name, active];
}

@injectable
class GetProductsUseCase
    extends IUseCase<List<ProductEntity>, ManagementFetchParams> {
  final StoreProductsRepository _repository;

  GetProductsUseCase(this._repository);

  @override
  DomainServiceType<List<ProductEntity>> call(ManagementFetchParams countryId) {
    return _repository.getProducts(
        name: countryId.name, active: countryId.active);
  }
}
