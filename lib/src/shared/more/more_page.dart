import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_cubit.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/data/models/more_tile_model.dart';
import 'package:wasli/src/shared/more/widgets/guest_more_widget.dart';
import 'package:wasli/src/shared/more/widgets/more_app_bar_widget.dart';
import 'package:wasli/src/shared/more/widgets/package_subscription_widget.dart';

import '../../../core/core.dart';
import '../../../material/auth_states/logged_user_checker_widget.dart';
import 'widgets/tile_card.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PackagesSubscriptionsCubit()..getSubscriptions(),
      child: Scaffold(
        body: SingleChildScrollView(
            padding: Dimensions.pageMargins,
            child: Column(
              children: [
                LoggedUserCheckerWidget(
                  loggedBuilder: (user) {
                    return MoreAppBarWidget(
                      user: user,
                    );
                  },
                  guestWidget: const MoreAppBarWidget(),
                ),
                const SizedBox(height: 20),
                BlocBuilder<AppAuthenticationBloc, AppAuthenticationState>(
                  buildWhen: (previous, current) =>
                      current is AuthAuthenticatedState ||
                      current is GuestState,
                  builder: (context, state) {
                    RoleEnum role;
                    if (state is AuthAuthenticatedState) {
                      role = state.role;
                    } else if (state is GuestState) {
                      role = state.role;
                    } else {
                      role = RoleEnum.guest;
                    }
                    return Column(spacing: 8, children: [
                      Visibility(
                          visible: role == RoleEnum.provider,
                          child: const PackageSubscriptionWidget()),
                      Visibility(
                          visible: role == RoleEnum.guest,
                          child: const GuestMoreWidget()),
                      const SizedBox(
                        height: 8,
                      ),
                      ...MoreTileModel.loadRoleMoreItems(role, context).map(
                          (e) => e.needAuth
                              ? LoggedUserCheckerWidget(
                                  loggedBuilder: (user) =>
                                      TileCard(tileModel: e))
                              : TileCard(tileModel: e))
                    ]);
                  },
                ),
              ],
            )).withSafeArea(),
      ),
    );
  }
}
