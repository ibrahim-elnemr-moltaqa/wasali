import '../../../../../material/overlay/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.dart';
import '../../../../../material/buttons/app_button.dart';
import '../../../../../material/toast/app_toast.dart';
import 'delete_account_cubit.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet._();

  static Future<void> show(BuildContext context) async {
    return await showAppDialog(
      context: context,
      child: BlocProvider(
        create: (context) => DeleteAccountCubit(),
        child: const DeleteAccountBottomSheet._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, Async<void>>(
      listener: (context, state) {
        if (state.isSuccess) {
          AppAuthenticationBloc.of(context).add(LoggedOutEvent());
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (state.isFailure) {
          AppToasts.error(context, message: state.errorMessage ?? '');
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizer.deleteAccount,
                style: TextStyles.regular18.copyWith(color: AppColors.text),
              ),
              IconButton(
                  onPressed: () => AppRouter.pop(),
                  icon: const Icon(Icons.close))
            ],
          ),
          const SizedBox(height: Dimensions.p12),
          Text(
            appLocalizer.deleteAccountMessage,
            style: TextStyles.regular14.copyWith(color: AppColors.text2),
          ),
          const SizedBox(height: Dimensions.p24),
          BlocBuilder<DeleteAccountCubit, Async<void>>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: appLocalizer.cancel,
                      buttonColor: AppColors.red50,
                      isLoading: state.isLoading,
                      textStyle:
                          TextStyles.medium14.copyWith(color: AppColors.red700),
                      onPressed: AppRouter.pop,
                    ),
                  ),
                  const SizedBox(width: Dimensions.p12),
                  Expanded(
                    child: AppButton(
                      text: appLocalizer.agree,
                      buttonColor: AppColors.red700,
                      isLoading: state.isLoading,
                      textStyle:
                          TextStyles.regular14.copyWith(color: Colors.white),
                      onPressed:
                          context.read<DeleteAccountCubit>().deleteAccount,
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
