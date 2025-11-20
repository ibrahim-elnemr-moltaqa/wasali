import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import '../../../../../material/buttons/app_button.dart';
import '../../../../../material/inputs/app_text_form_field.dart';
import '../../../../../material/overlay/show_modal_bottom_sheet.dart';
import '../../../../../material/toast/app_toast.dart';
import 'charage_wallet_cubit.dart';
import '../payment_web_view/payment_webview_page.dart';

class CharageWalletBottomSheet extends StatefulWidget {
  const CharageWalletBottomSheet._();

  static const String routeName = '/CharageWalletBottomSheet';

  static void show(BuildContext context) async {
    return await showAppModalBottomSheet(
      context: context,
      routeSettings: const RouteSettings(name: routeName),
      child: BlocProvider(
        create: (context) => CharageWalletCubit(),
        child: const CharageWalletBottomSheet._(),
      ),
    );
  }

  @override
  State<CharageWalletBottomSheet> createState() =>
      _CharageWalletBottomSheetState();
}

class _CharageWalletBottomSheetState extends State<CharageWalletBottomSheet> {
  final amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onSubmit() {
    final isValidForm = formKey.currentState?.validate() ?? false;
    if (isValidForm) {
      context.read<CharageWalletCubit>().chargeWallet(
            int.parse(amountController.text),
          );
    }
  }

  void onSuccess(String url) {
    Navigator.pushNamed(context, AppRoutes.paymentWebView,
        arguments: PaymentWebViewPage(
          paymentUrl: url,
          onFail: () {
            Navigator.of(context).popUntil(
              (route) =>
                  route.settings.name == CharageWalletBottomSheet.routeName,
            );
            AppToasts.error(context, message: appLocalizer.paymentFailMessage);
          },
          onSuccess: () {
            // Navigator.of(context).popUntil(
            //   (route) =>
            //       (route.settings.name == AppRoutes.wallet) ,
            // );
            _CharageWalletSuccessBottomSheet.show(context);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharageWalletCubit, CharageWalletState>(
      listener: (context, state) {
        if (state.isSuccess) {
          onSuccess(state.data ?? '');
        } else if (state.isFailure) {
          AppToasts.error(context, message: state.errorMessage ?? '');
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // AppSvgIcon(path: AppIcons.walletMoneyIc),
              const SizedBox(height: 12),
              Text(
                appLocalizer.walletTopUp,
                style: TextStyles.medium18.copyWith(color: AppColors.text),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  appLocalizer.enterTopUpAmount,
                  style: TextStyles.regular14.copyWith(color: AppColors.text),
                ),
              ),
              const SizedBox(height: 12),
              AppTextFormField(
                readOnly: state.isLoading,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  EnglishNumbersFormatter(),
                  NoContainSpaceFormatter(),
                ],
                controller: amountController,
                label: appLocalizer.amountValue,
                labelTextStyle:
                    TextStyles.medium14.copyWith(color: AppColors.text),
                hintText: "0",
                maxLength: 6,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                validate: (text) => Validator(text).defaultValidator,
              ),
              const SizedBox(height: 24),
              AppButton(
                onPressed: onSubmit,
                text: appLocalizer.pay,
                isLoading: state.isLoading,
              )
            ],
          ),
        );
      },
    );
  }
}

class _CharageWalletSuccessBottomSheet extends StatelessWidget {
  const _CharageWalletSuccessBottomSheet._();

  static void show(BuildContext context) async {
    return await showAppTopModalSheet(
      context: context,
      child: const _CharageWalletSuccessBottomSheet._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        // AppSvgIcon(path: AppIllustrations.walletIllustration),
        const SizedBox(height: 12),
        Text(
          appLocalizer.walletChargedSuccess,
          style: TextStyles.regular14.copyWith(color: AppColors.text),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
