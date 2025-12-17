import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/api_size_model.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/sizes_repository.dart';

@Injectable(as: SizesRepository)
class SizesRepositoryImpl implements SizesRepository {
  final DioHelper _dioHelper;

  SizesRepositoryImpl(this._dioHelper);
  @override
  DomainServiceType<List<ApiSizeModel>> getSizes() async {
    return await failureCollect(() async {
      final response = await _dioHelper.get(url: 'sizes');
      return Right(apiSizeModelFromJson(response['data']['data']));
    });
  }

  @override
  DomainServiceType<Unit> changeSizeStatus({required int sizeId}) async {
    return await failureCollect(() async {
      await _dioHelper.post(url: 'change_status/$sizeId');

      return const Right(unit);
    });
  }

  @override
  DomainServiceType<SizeEntity> createSize({required String sizeName}) async {
    return await failureCollect(() async {
      final response =
          await _dioHelper.post(url: 'sizes', body: {'name': sizeName});
      final result = ApiSizeModel.fromJson(response['data']['Size']);
      return Right(result);
    });
  }

  @override
  DomainServiceType<Unit> deleteSize({required int sizeId}) async {
    return await failureCollect(() async {
      await _dioHelper.delete(url: 'sizes/$sizeId');
      return const Right(unit);
    });
  }

  @override
  DomainServiceType<SizeEntity> getSize({required int sizeId}) async {
    return await failureCollect(() async {
      final response = await _dioHelper.get(url: 'sizes/$sizeId');
      final result = ApiSizeModel.fromJson(response['data']['Size']);
      return Right(result);
    });
  }

  @override
  DomainServiceType<SizeEntity> updateSize({required String name}) async {
    return await failureCollect(() async {
      final response = await _dioHelper
          .put(url: 'sizes', body: {'name': name, '_method': 'put'});
      final result = ApiSizeModel.fromJson(response['data']['Size']);
      return Right(result);
    });
  }
}
