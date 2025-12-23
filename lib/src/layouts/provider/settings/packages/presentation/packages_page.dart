import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/media/network_image.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_state.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/widget/package_item_widget.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizer.packages), // Assuming key
      ),
      body: BlocProvider(
        create: (context) => PackagesSubscriptionsCubit()..getPackages(),
        child:
            BlocBuilder<PackagesSubscriptionsCubit, PackagesSubscriptionsState>(
          builder: (context, state) {
            return HandleResponseWidget(
              status: state.packagesState,
              onRetry: () =>
                  context.read<PackagesSubscriptionsCubit>().getPackages(),
              successWithoutDataBuilder: () {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppMedia(path: AppIllustrations.emptyOrders),
                    // Text(appLocalizer.no_subscription)
                  ],
                ).center;
              },
              onSuccess: (data) {
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: data?.length ?? 0,
                  separatorBuilder: (context, index) => const Gap(16),
                  itemBuilder: (context, index) {
                    return PackageItemWidget(
                      package: data?[index],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
