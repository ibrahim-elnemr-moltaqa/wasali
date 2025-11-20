import 'package:wasli/core/core.dart';
import '../entities/transaction_entity.dart';

abstract class WalletRepository {
  DomainServiceType<List<TransactionEntity>> getTransactions();
  DomainServiceType<void> withdrawBalance();
  DomainServiceType<String> charageBalance(int amount);
}
