import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import '../../../../../material/app_fail_widget.dart';
import '../../../../../material/app_loading_widget.dart';
import '../../../../../material/buttons/app_button.dart';
import '../../../../../material/shimmer/shimmer_effect_widget.dart';
import '../../../../../material/toast/app_toast.dart';
import '../../../../../material/widgets/riyal_price_text.dart';
import '../../domain/entities/transaction_entity.dart';
import 'wallet_cubit.dart';
import '../widgets/transaction_loading_card.dart';

import '../widgets/transaction_card.dart';

class TeacherWalletPage extends StatelessWidget {
  const TeacherWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit()..getTransactions(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizer.wallet),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList.list(children: [
                const SizedBox(height: 20),
                const _BalanceWidget(),
                const SizedBox(height: 40),
                Row(
                  spacing: 4,
                  children: [
                    // AppSvgIcon(path: AppIcons.noteFavoriteIc),
                    Text(
                      appLocalizer.walletHistory,
                      style:
                          TextStyles.regular16.copyWith(color: AppColors.text),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              elevation: 0,
                              shape: LinearBorder.bottom(
                                  side: BorderSide(color: AppColors.primary)),
                              minimumSize: const Size(60, 40),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Row(
                              spacing: 4,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // AppSvgIcon(path: AppIcons.refreshTimerIc),
                                Text(appLocalizer.hideHistory,
                                    style: TextStyles.regular14.copyWith(
                                        color: AppColors.primary, height: 1)),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ]),
              BlocSelector<WalletCubit, WalletState,
                  Async<List<TransactionEntity>>>(
                selector: (state) {
                  return state.transactionsState;
                },
                builder: (context, state) {
                  final List<TransactionEntity> transations = state.data ?? [];
                  if (state.isLoading) {
                    return SliverList.separated(
                      itemCount: 4,
                      itemBuilder: (context, index) =>
                          const TransactionLoadingCard(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 4);
                      },
                    );
                  } else if (state.isFailure) {
                    return SliverFillRemaining(
                      child: AppFailWidget(
                        onRetry: () {
                          context.read<WalletCubit>().getTransactions();
                        },
                      ),
                    );
                  } else if (transations.isEmpty) {
                    return SliverFillRemaining(
                        child: Center(
                      child: Text(
                        appLocalizer.noWalletHistory,
                        style:
                            TextStyles.medium16.copyWith(color: AppColors.text),
                      ),
                    ));
                  }
                  return SliverList.separated(
                    itemCount: transations.length,
                    itemBuilder: (context, index) {
                      final transaction = transations[index];
                      return TransactionCard(
                        transaction: transaction,
                        getDateFormatted: (date) => date.EDMMMHMMA,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 4);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const _WithDrawButton(),
      ),
    );
  }
}

class _BalanceWidget extends StatelessWidget {
  const _BalanceWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AppSvgIcon(path: AppIcons.dollarCircleIc),
            Flexible(
              child: Text(
                appLocalizer.totalProfitServiceProvider,
                style: TextStyles.regular14.copyWith(color: AppColors.text),
              ),
            )
          ],
        ),
        BlocSelector<WalletCubit, WalletState, Async<double>>(
          selector: (state) {
            return state.balanceState;
          },
          builder: (context, state) {
            if (state.isSuccess == false) {
              return ShimmerWidget(
                child: RiyalPriceText(
                  price: "00.0",
                  priceTextStyle:
                      TextStyles.bold24.copyWith(color: AppColors.text),
                  textAlign: TextAlign.center,
                  currencyTextStyle: TextStyles.regular12
                      .copyWith(color: AppColors.primary, height: 2.5),
                ),
              );
            }
            final balance = state.data ?? 0;
            return RiyalPriceText(
              price: balance.toString(),
              priceTextStyle: TextStyles.bold24.copyWith(color: AppColors.text),
              textAlign: TextAlign.center,
              currencyTextStyle: TextStyles.regular12
                  .copyWith(color: AppColors.primary, height: 2.5),
            );
          },
        ),
      ],
    );
  }
}

class _WithDrawButton extends StatelessWidget {
  const _WithDrawButton();

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletCubit, WalletState>(
        listener: (context, state) {
          if (state.withDrawState.isSuccess) {
            AppLoadingWidget.removeOverlay();
            AppToasts.success(context,
                message: appLocalizer.withdrawSuccessMessage);
          } else if (state.withDrawState.isLoading) {
            AppLoadingWidget.overlay();
          } else if (state.withDrawState.isFailure) {
            AppToasts.error(context,
                message: state.withDrawState.errorMessage ?? '');
            AppLoadingWidget.removeOverlay();
          }
        },
        child: Container(
          color: AppColors.backgroundColor2,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: SafeArea(
            top: false,
            child: AppButton(
              text: appLocalizer.withdraw,
              onPressed: () {
                context.read<WalletCubit>().withdrawBalance();
              },
            ),
          ),
        ));
  }
}
