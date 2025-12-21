import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/providers/data/data_source/providers_data_source.dart';
import 'package:wasli/src/layouts/client/providers/domain/repository/providers_repository.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

@Injectable(as: ProvidersRepository)
class ProvidersRepositoryImpl implements ProvidersRepository {
  final ProvidersDataSource _dataSource;

  ProvidersRepositoryImpl(this._dataSource);

}
