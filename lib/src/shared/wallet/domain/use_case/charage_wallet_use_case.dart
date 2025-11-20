import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../repository/wallet_repository.dart';

@injectable
class CharageWalletUseCase extends IUseCase<String, int> {
  final WalletRepository _repository;

  CharageWalletUseCase(this._repository);
  @override
  Future<Either<Failure, String>> call(int params) async {
    return await _repository.charageBalance(params);
  }
}
