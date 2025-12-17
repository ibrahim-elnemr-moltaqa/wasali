import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/repository/sizes_repository.dart';

@injectable
class DeleteSizeUseCase extends IUseCase<Unit, int> {
  final SizesRepository repository;

  DeleteSizeUseCase(this.repository);

  @override
  DomainServiceType<Unit> call(int params) {
    return repository.deleteSize(sizeId: params);
  }
}
