import '../../domain/entities/transaction_entity.dart';

class ApiTransactionModel extends TransactionEntity {
  const ApiTransactionModel({
    required super.id,
    required super.name,
    required super.date,
    required super.amount,
    required super.type,
  });
}
