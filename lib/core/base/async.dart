part of core;

/// Async is a helper class to handle asynchronous operations.
///
/// It provides a convenient way to handle three states of an asynchronous operation.
/// The states are:
/// - Loading: The operation is in progress.
/// - Success: The operation completed successfully.
/// - Failure: The operation failed.
///
/// @Author: Moltaqa's Flutter Team

class Async<T> extends Equatable {
  final T? data;
  final Failure? failure;
  final bool _successWithoutData;
  final bool? _loading;

  const Async._(
    this.data,
    this._successWithoutData,
    this._loading,
    this.failure,
  );

  String? get errorMessage => failure?.message;

  bool get isLoading => _loading ?? false;

  bool get isSuccess =>
      (_successWithoutData || data != null) && (failure == null);

  bool get isFailure => failure != null;

  bool get isInitial =>
      (data == null) &&
      (failure == null) &&
      (_successWithoutData == false) &&
      (_loading == null);

  const Async.loading() : this._(null, false, true, null);

  const Async.success(T data) : this._(data, false, false, null);

  const Async.successWithoutData() : this._(null, true, false, null);

  const Async.failure(Failure failure) : this._(null, false, false, failure);

  const Async.initial() : this._(null, false, null, null);

  R when<R>({
    required R Function() loading,
    required R Function(Failure error) failure,
    required R Function(T data) success,
    R Function()? successWithoutData,
    R Function()? initial,
  }) {
    if (isLoading) {
      return loading();
    }
    if (isFailure) {
      return failure(this.failure!);
    }
    if (isSuccess) {
      if (data != null) {
        if (data is Iterable && (data as Iterable).isEmpty) {
          if (successWithoutData != null) return successWithoutData();
        } else if (data is Map && (data as Map).isEmpty) {
          if (successWithoutData != null) return successWithoutData();
        }
        return success(data as T);
      }

      if (successWithoutData != null) {
        return successWithoutData();
      }
      return success(data as T);
    }
    if (initial != null) {
      return initial();
    }
    return loading();
  }

  @override
  String toString() {
    return "Async : [data]: $data , [Failure]: ${failure.runtimeType} , [isFailure] : $isFailure , [isLoading] : $isLoading , [isSuccess] : $isSuccess ,[isInitial] $isInitial";
  }

  @override
  List<Object?> get props => [
        data,
        _successWithoutData,
        _loading,
        isFailure,
        isLoading,
        isSuccess,
        isInitial,
        failure,
      ];
}
