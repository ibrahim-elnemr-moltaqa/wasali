import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_state.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/packages_page.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/widget/package_details_info_widget.dart';

class PackageDetailsPage extends StatelessWidget {
  const PackageDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizer.packageDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocSelector<PackagesSubscriptionsCubit,
            PackagesSubscriptionsState, Async<List<SubscriptionEntity>>>(
          selector: (state) {
            return state.subscriptionsState;
          },
          builder: (context, state) {
            return Column(
              children: [
                PackageDetailsInfoWidget(subscriptionEntity: state.data?.first),
                const Spacer(),
                AppButton(
                  text: appLocalizer.renewSubscription,
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return BlocProvider.value(
                      value: context.read<PackagesSubscriptionsCubit>(),
                      child: const PackagesPage(),
                    );
                  })),
                ),
                const Gap(24),
              ],
            );
          },
        ),
      ),
    );
  }
}
