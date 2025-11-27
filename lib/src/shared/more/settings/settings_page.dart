import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/auth_states/guest_checker_widget.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/data/models/more_tile_model.dart';

import '../widgets/tile_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String routeName = '/settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appLocalizer.accountSettings),
        ),
        body: Padding(
          padding: Dimensions.pageMargins,
          child: BlocBuilder<AppAuthenticationBloc, AppAuthenticationState>(
            buildWhen: (previous, current) => current is AuthAuthenticatedState,
            builder: (context, state) {
              final role =
                  state is AuthAuthenticatedState ? state.role : RoleEnum.guest;
              return Column(
                spacing: 8,
                children: MoreTileModel.loadSettingsRoleItems(role, context)
                    .map((e) => e.needAuth == true
                        ? GuestCheckerWidget(child: TileCard(tileModel: e))
                        : TileCard(tileModel: e))
                    .toList(),
              );
            },
          ),
        ));
  }
}
