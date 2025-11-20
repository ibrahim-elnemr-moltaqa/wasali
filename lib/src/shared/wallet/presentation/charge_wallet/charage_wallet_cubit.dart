import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/di/di.dart';
import '../../domain/use_case/charage_wallet_use_case.dart';

typedef CharageWalletState = Async<String>;

class CharageWalletCubit extends Cubit<CharageWalletState> {
  CharageWalletCubit() : super(const Async.initial());

  final CharageWalletUseCase _charageWalletUseCase = injector();

  void chargeWallet(int amount) async {
    emit(const Async.loading());
    final result = await _charageWalletUseCase(amount);
    result.fold(
      (failer) {
        emit(Async.failure(failer));
      },
      (data) {
        emit(Async.success(data));
      },
    );
    emit(const Async.initial());
  }

  @override
  void emit(CharageWalletState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
