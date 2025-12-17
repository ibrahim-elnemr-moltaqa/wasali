import 'package:dartz/dartz.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';

abstract class SizesRepository {
  DomainServiceType<List<SizeEntity>> getSizes();
  DomainServiceType<SizeEntity> getSize({required int sizeId});
  DomainServiceType<SizeEntity> createSize({required String sizeName});
  DomainServiceType<SizeEntity> updateSize({required String name});
  DomainServiceType<Unit> deleteSize({required int sizeId});
  DomainServiceType<Unit> changeSizeStatus({required int sizeId});
}
