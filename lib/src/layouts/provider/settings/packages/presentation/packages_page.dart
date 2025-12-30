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
import 'package:wasli/src/shared/common/presentation/widget/custom_app_bar.dart';

class PackagesPage extends StatefulWidget {
  const PackagesPage({super.key});

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  @override
  void initState() {
    super.initState();
    context.read<PackagesSubscriptionsCubit>().getPackages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: Text(appLocalizer.packages)),
      body: BlocBuilder<PackagesSubscriptionsCubit, PackagesSubscriptionsState>(
        buildWhen: (previous, current) =>
            previous.packagesState != current.packagesState,
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
    );
  }
}
