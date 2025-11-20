part of 'wallet_cubit.dart';

class WalletState extends Equatable {
  const WalletState({
    required this.transactionsState,
    required this.balanceState,
    required this.withDrawState,
  });

  final Async<List<TransactionEntity>> transactionsState;
  final Async<double> balanceState;
  final Async<void> withDrawState;

  const WalletState.initial()
      : this(
          balanceState: const Async.initial(),
          transactionsState: const Async.initial(),
          withDrawState: const Async.initial(),
        );

  WalletState copyWith({
    final Async<List<TransactionEntity>>? transactionsState,
    final Async<double>? balanceState,
    final Async<void>? withDrawState,
  }) =>
      WalletState(
        transactionsState: transactionsState ?? this.transactionsState,
        balanceState: balanceState ?? this.balanceState,
        withDrawState: withDrawState ?? this.withDrawState,
      );

  @override
  List<Object?> get props => [
        transactionsState,
        balanceState,
        withDrawState,
      ];
}
