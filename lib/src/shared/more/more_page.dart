import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/data/models/more_tile_model.dart';
import 'package:flutter/material.dart';
import 'package:wasli/src/shared/more/widgets/more_app_bar_widget.dart';
import '../../../core/core.dart';
import '../../../material/auth_states/logged_user_checker_widget.dart';
import 'widgets/tile_card.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: Dimensions.pageMargins,
          child: Column(
            children: [
              const MoreAppBarWidget(),
              const SizedBox(height: 20),
              Column(
                spacing: 8,
                children:
                    MoreTileModel.loadRoleMoreItems(RoleEnum.client, context)
                        .map((e) => e.needAuth
                            ? LoggedUserCheckerWidget(
                                loggedBuilder: (user) => TileCard(tileModel: e))
                            : TileCard(tileModel: e))
                        .toList(),
              ),
            ],
          )).withSafeArea(),
    );
  }
}
