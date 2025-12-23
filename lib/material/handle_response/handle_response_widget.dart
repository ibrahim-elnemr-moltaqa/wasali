import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/app_fail_widget.dart';
import 'package:wasli/material/spin_kit_loading_widget.dart';

class HandleResponseWidget<T> extends StatelessWidget {
  const HandleResponseWidget({
    super.key,
    required this.status,
    required this.onSuccess,
    this.onRetry,
    this.successWithoutDataBuilder,
    this.loadingWidget,
    this.initialWidget,
    this.failureWidget,
  });

  final Async<T> status;
  final Widget Function(T? data) onSuccess;
  final VoidCallback? onRetry;

  final Widget Function()? successWithoutDataBuilder;

  final Widget? loadingWidget;
  final Widget? initialWidget;
  final Widget? failureWidget;

  @override
  Widget build(BuildContext context) {
    if (status.isLoading) {
      return loadingWidget ?? const SpinKitLoadingWidget();
    }

    if (status.isFailure) {
      return AppFailWidget(
        text: status.errorMessage,
        onRetry: onRetry,
      );
    }

    if (status.isSuccess) {
      if (status.data != null) {
        if (status.data is Iterable && (status.data as Iterable).isEmpty) {
          if (successWithoutDataBuilder != null) {
            return successWithoutDataBuilder!();
          }
        } else if (status.data is Map && (status.data as Map).isEmpty) {
          if (successWithoutDataBuilder != null) {
            return successWithoutDataBuilder!();
          }
        }
        return onSuccess(status.data as T);
      } else if (status.data == null && successWithoutDataBuilder != null) {
        return successWithoutDataBuilder!();
      } else {
        return onSuccess(status.data as T);
      }
    }

    if (status.isInitial) {
      return initialWidget ?? const SizedBox.shrink();
    }

    return const SizedBox.shrink();
  }
}
