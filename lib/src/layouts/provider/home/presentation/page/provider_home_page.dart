import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/layouts/provider/home/presentation/widget/new_orders_list_widget.dart';
import 'package:wasli/src/layouts/provider/home/presentation/widget/recieve_orders_toggle.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/presentation/widget/home_app_bar.dart';

class ProviderHomePage extends StatelessWidget {
  const ProviderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(24),
          const HomeAppBar(title: 'بابا جونز', role: RoleEnum.provider)
              .zoomIn(),
          const Gap(24),
          const ReceiveOrdersToggle(),
          const Gap(24),
          const NewOrdersListWidget(),
          const Gap(100),
        ],
      ).paddingHorizontal(20).withSafeArea(),
    );
  }
}
