import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../entities/transaction_entity.dart';
import '../repository/wallet_repository.dart';

@injectable
class GetTransactionsUseCase
    extends IUseCase<List<TransactionEntity>, NoParams> {
  final WalletRepository _repository;

  GetTransactionsUseCase(this._repository);
  @override
  Future<Either<Failure, List<TransactionEntity>>> call(NoParams params) async {
    return await _repository.getTransactions();
  }
}
