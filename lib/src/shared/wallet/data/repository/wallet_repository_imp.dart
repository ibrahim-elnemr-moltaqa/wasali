import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repository/wallet_repository.dart';

@Injectable(as: WalletRepository)
class WalletRepositoryImp implements WalletRepository {
  final DioHelper dioHelper;

  const WalletRepositoryImp(this.dioHelper);

  @override
  DomainServiceType<List<TransactionEntity>> getTransactions() async {
    return await failerCollect(
      () async {
        await Future.delayed(const Duration(seconds: 5));
        final dumyData = List.generate(
          10,
          (index) => TransactionEntity(
            id: index,
            amount: index * 33,
            date: DateTime.now().add(Duration(days: index * 5)),
            name: "دفع طلب",
            type: TransactionTypeEnum.values[index % 4],
          ),
        );
        return Right(dumyData);
      },
    );
  }

  @override
  DomainServiceType<void> withdrawBalance() async {
    return await failerCollect(
      () async {
        await Future.delayed(const Duration(seconds: 5));
        return const Right(null);
      },
    );
  }

  @override
  DomainServiceType<String> charageBalance(int amount) async {
    return await failerCollect(
      () async {
        await Future.delayed(const Duration(seconds: 5));
        return const Right("null");
      },
    );
  }
}
