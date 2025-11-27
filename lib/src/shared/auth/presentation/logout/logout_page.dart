import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../material/buttons/app_button.dart';
import '../../../../../material/overlay/show_dialog.dart';
import '../../../../../material/overlay/show_modal_bottom_sheet.dart';
import '../../../../../material/toast/app_toast.dart';
import 'logout_cubit.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage._();

  static Future<void> showDialog(BuildContext context) async {
    return await showAppDialog(
      context: context,
      child: BlocProvider(
        create: (context) => LogOutCubit(),
        child: const LogoutPage._(),
      ),
    );
  }

  static Future<void> showBottomSheet(BuildContext context) async {
    return await showAppModalBottomSheet(
      context: context,
      child: BlocProvider(
        create: (context) => LogOutCubit(),
        child: const LogoutPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogOutCubit, Async<void>>(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizer.logOut,
                style: TextStyles.regular18.copyWith(color: AppColors.text),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.p12),
          Text(
            appLocalizer.logoutMessage,
            style: TextStyles.regular14.copyWith(color: AppColors.text1),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: Dimensions.p24),
          BlocBuilder<LogOutCubit, Async<void>>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: AppButton(
                      text: appLocalizer.cancel,
                      buttonColor: AppColors.red50,
                      isLoading: state.isLoading,
                      textStyle:
                          TextStyles.medium16.copyWith(color: AppColors.red700),
                      onPressed: () => AppRouter.pop(),
                    ),
                  ),
                  const SizedBox(width: Dimensions.p12),
                  Expanded(
                    flex: 5,
                    child: AppButton(
                      text: appLocalizer.logOut,
                      buttonColor: AppColors.red700,
                      isLoading: state.isLoading,
                      textStyle:
                          TextStyles.medium16.copyWith(color: Colors.white),
                      onPressed: context.read<LogOutCubit>().logout,
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
