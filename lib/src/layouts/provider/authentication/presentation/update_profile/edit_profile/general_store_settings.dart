import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/entity/provider_entity.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/provider_authentication_cubit/profile/get_profile_cubit.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/update_profile/edit_profile/general_store_tabs/address_details_tab.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/update_profile/edit_profile/general_store_tabs/store_data_tab.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/auth_app_bar_widget.dart';

class GeneralStoreSettingsPage extends StatefulWidget {
  const GeneralStoreSettingsPage({super.key});

  @override
  State<GeneralStoreSettingsPage> createState() =>
      _GeneralStoreSettingsPageState();
}

class _GeneralStoreSettingsPageState extends State<GeneralStoreSettingsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderCubit()..getProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(appLocalizer.general_store_settings),
            leading: const ArrowBackWidget(),
            bottom: TabBar(
              indicatorPadding:
                  const EdgeInsetsGeometry.symmetric(horizontal: 20),
              dividerColor: AppColors.dividerColor,
              controller: _tabController,
              labelColor: AppColors.black,
              unselectedLabelColor: AppColors.grey2Color,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: appLocalizer.store_data,
                ),
                Tab(
                  text: appLocalizer.address_details,
                ),
              ],
            ),
          ),
          body: BlocBuilder<ProviderCubit, Async>(
            builder: (context, state) {
              return HandleResponseWidget(
                  status: state,
                  onRetry: () => context.read<ProviderCubit>().getProvider(),
                  successWithoutDataBuilder: () {
                    return Center(
                      child: Text(appLocalizer.noData),
                    );
                  },
                  onSuccess: (data) {
                    final provider = data as ProviderEntity;
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        StoreDataTab(storeDataEntity: provider.storeData ),
                        AddressDetailsTab(
                          storeAddressEntity: provider.storeAddress,
                        ),
                      ],
                    );
                  });
            },
          )),
    );
  }
}
