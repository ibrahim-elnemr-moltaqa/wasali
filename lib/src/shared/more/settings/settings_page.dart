import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/auth_states/guest_checker_widget.dart';
import 'package:wasli/material/change_language/change_language_bottom_sheet.dart';
import 'package:wasli/src/shared/common/data/models/more_tile_model.dart';
import 'package:flutter/material.dart';
import 'package:wasli/src/shared/more/settings/widget/notification_switch.dart';

import '../widgets/tile_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String routeName = '/settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appLocalizer.settings),
        ),
        body: Padding(
          padding: Dimensions.pageMargins,
          child: Column(
            spacing: 8,
            children: [
              MoreTileModel(
                title: appLocalizer.accountSettings,
                icon: AppIcons.user,
                onTap: () => AppRouter.pushNamed(AppRoutes.clientEditProfile),
              ),
              MoreTileModel(
                title: appLocalizer.language,
                icon: AppIcons.languageIc,
                onTap: () => ChangeLanguageBottomSheet.show(context),
              ),
              MoreTileModel(
                title: appLocalizer.notifications,
                icon: AppIcons.bellIc,
                trailing: const NotificationSwitch(),
              ),
            ]
                .map((e) => e.icon == AppIcons.bellIc
                    ? GuestCheckerWidget(child: TileCard(tileModel: e))
                    : TileCard(tileModel: e))
                .toList(),
          ),
        ));
  }
}
