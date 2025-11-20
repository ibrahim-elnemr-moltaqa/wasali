import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../repository/wallet_repository.dart';

@injectable
class WithdrawBalanceUseCase extends IUseCase<void, NoParams> {
  final WalletRepository _repository;

  WithdrawBalanceUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _repository.withdrawBalance();
  }
}
