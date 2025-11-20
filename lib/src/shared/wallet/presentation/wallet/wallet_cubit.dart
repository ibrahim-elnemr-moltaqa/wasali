import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/use_case/get_transactions_use_case.dart';
import '../../domain/use_case/withdraw_balance_use_case.dart';

part "wallet_state.dart";

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState.initial());

  final GetTransactionsUseCase _getTransactionUseCase =
      injector<GetTransactionsUseCase>();
  final WithdrawBalanceUseCase _withdrawBalanceUseCase =
      injector<WithdrawBalanceUseCase>();

  void getTransactions() async {
    emit(state.copyWith(transactionsState: const Async.loading()));
    final result = await _getTransactionUseCase(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          transactionsState: Async.failure(failure),
        ),
      ),
      (data) => emit(
        state.copyWith(
          transactionsState: Async.success(data),
          balanceState: const Async.success(7000),
        ),
      ),
    );
  }

  void withdrawBalance() async {
    emit(state.copyWith(withDrawState: const Async.loading()));
    final result = await _withdrawBalanceUseCase(NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          withDrawState: Async.failure(failure),
        ),
      ),
      (_) => emit(
        state.copyWith(
          withDrawState: const Async.successWithoutData(),
        ),
      ),
    );
    emit(state.copyWith(withDrawState: const Async.initial()));
  }

  @override
  void emit(WalletState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
