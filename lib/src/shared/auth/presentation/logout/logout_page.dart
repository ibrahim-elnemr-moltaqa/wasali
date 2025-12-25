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
          Text(
            appLocalizer.wantToLogoutQuestion,
            style: TextStyles.regular18.copyWith(color: AppColors.text),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Dimensions.p12),
          Text(
            appLocalizer.youCanAlwaysComeBackLoginLater,
            style: TextStyles.regular14.copyWith(color: AppColors.text1),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Dimensions.p24),
          BlocBuilder<LogOutCubit, Async<void>>(
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
                      text: appLocalizer.logOut,
                      buttonColor: AppColors.lightGreyColor,
                      isLoading: state.isLoading,
                      textStyle: TextStyles.bold16
                          .copyWith(color: AppColors.grey2Color),
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
