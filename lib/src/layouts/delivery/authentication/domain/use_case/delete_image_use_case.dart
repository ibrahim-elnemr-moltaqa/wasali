import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/delivery/authentication/domain/repository/delivery_authentication_repository.dart';

@injectable
class DeleteImageUseCase extends IUseCase<Unit, DeleteImageParams> {
  final DeliveryAuthenticationRepository repository;

  DeleteImageUseCase(this.repository);

  @override
  DomainServiceType<Unit> call(DeleteImageParams params) async {
    return await repository.deleteImage(params.imageId, params.type);
  }
}

class DeleteImageParams {
  final int imageId;
  final String type;

  DeleteImageParams({required this.imageId, required this.type});
}
