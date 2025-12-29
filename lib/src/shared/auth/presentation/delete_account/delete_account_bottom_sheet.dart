import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../material/buttons/app_button.dart';
import '../../../../../material/overlay/show_dialog.dart';
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
          AppAuthenticationBloc.of(context).add(ChooseRoleEvent());
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (state.isFailure) {
          AppToasts.error(context, message: state.errorMessage ?? '');
        }
      },
      child: Column(
        children: [
          Text(
            appLocalizer.wantToDeleteAccount,
            style: TextStyles.regular18.copyWith(color: AppColors.text),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Dimensions.p12),
          Text(
            appLocalizer.deleteAccountMessage,
            style: TextStyles.regular14.copyWith(color: AppColors.text2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Dimensions.p24),
          BlocBuilder<DeleteAccountCubit, Async<void>>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: AppButton(
                      text: appLocalizer.undo,
                      buttonColor: AppColors.primary,
                      isLoading: state.isLoading,
                      textStyle:
                          TextStyles.bold16.copyWith(color: AppColors.black),
                      onPressed: () => AppRouter.pop(),
                    ),
                  ),
                  const SizedBox(width: Dimensions.p12),
                  Expanded(
                    flex: 5,
                    child: AppButton(
                      text: appLocalizer.deleteAccount,
                      buttonColor: AppColors.lightGreyColor,
                      isLoading: state.isLoading,
                      textStyle: TextStyles.bold16
                          .copyWith(color: AppColors.grey2Color),
                      onPressed: () {
                        context.read<DeleteAccountCubit>().deleteAccount();
                      },
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
