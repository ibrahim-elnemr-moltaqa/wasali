

import 'package:wasli/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repository/authentication_repository.dart';



@LazySingleton()
class UpdateNameUseCase  extends IUseCase<Unit, UpdateNameParams> {
  final AuthenticationRepository repository;

  UpdateNameUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(UpdateNameParams params) async {
    return await repository.updateName(params);
  }
}
class UpdateNameParams {
  final String name;

  UpdateNameParams({required this.name}); 
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  } 
}
