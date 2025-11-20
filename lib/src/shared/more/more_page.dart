import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/shared/more/widgets/rate_app_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../material/widgets/home_pages_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/config/router/app_routes.dart';
import '../../../core/core.dart';
import '../../../core/utils/permissions/permissions_handler.dart';
import '../../../material/auth_states/logged_user_checker_widget.dart';
import '../auth/presentation/delete_account/delete_account_bottom_sheet.dart';
import '../auth/presentation/logout/logout_page.dart';
import 'widgets/tile_card.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  List<TileModel> items(BuildContext context) => [
        // TileModel(
        //   title: appLocalizer.aboutApp,
        //   icon: AppIcons.aboutIc,
        //   onTap: () => AppRouter.push(
        //       const StaticPage(pageType: StaticPageTypeEnum.aboutUs)),
        // ),
        // TileModel(
        //   title: appLocalizer.privacyPolicy,
        //   icon: AppIcons.privacyIc,
        //   onTap: () => AppRouter.push(
        //       const StaticPage(pageType: StaticPageTypeEnum.privacyPolicy)),
        // ),
        // TileModel(
        //   title: appLocalizer.termsAndConditions,
        //   icon: AppIcons.termsIc,
        //   onTap: () => AppRouter.push(const StaticPage(
        //       pageType: StaticPageTypeEnum.termsAndConditions)),
        // ),
        TileModel(
          title: appLocalizer.contactUs,
          icon: AppIcons.callIcSvg,
          onTap: () => AppRouter.pushNamed(AppRoutes.contactPage),
        ),
        TileModel(
          title: appLocalizer.settings,
          icon: AppIcons.settingsIc,
          onTap: () => AppRouter.pushNamed(AppRoutes.settingsPage),
        ),
        TileModel(
            title: appLocalizer.becomeProvider,
            icon: AppIcons.replaceIc,
            onTap: () =>
                launchUrl(Uri.parse('https://bonian.moltaqadev.com/register'))),
        TileModel(
          title: appLocalizer.logOut,
          icon: AppIcons.logoutIcCopy,
          color: AppColors.error,
          needAuth: true,
          onTap: () => LogoutPage.showBottomSheet(context),
        ),
        TileModel(
          title: appLocalizer.deleteAccount,
          icon: AppIcons.deleteAccountIc,
          color: AppColors.error,
          needAuth: true,
          onTap: () => DeleteAccountBottomSheet.show(context),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalizer.more,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: Dimensions.pageMargins,
          child: Column(
            children: [
              const _ProfileTile(),
              const SizedBox(height: 20),
              const _RateShareApp(),
              const SizedBox(height: 20),
              Column(
                spacing: 8,
                children: items(context)
                    .map((e) => e.needAuth
                        ? LoggedUserCheckerWidget(
                            loggedBuilder: (user) => TileCard(tileModel: e))
                        : TileCard(tileModel: e))
                    .toList(),
              ),
              const HomePagesSafeArea(),
            ],
          )),
    );
  }
}

class _RateShareApp extends StatelessWidget {
  const _RateShareApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // _ShareAndRateTile(
          //   iconPath: AppIcons.shareIcSvg,
          //   title: appLocalizer.shareApp,
          //   onTap: () => ShareBottomSheet.show(context),
          // ),
          _ShareAndRateTile(
            iconPath: AppIcons.rateAppIc,
            title: appLocalizer.rateApp,
            onTap: () => RateAppBottomSheet.show(context),
          ),
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile();

  @override
  Widget build(BuildContext context) {
    return LoggedUserCheckerWidget(
      loggedBuilder: (user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.secondary50),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: TextStyles.medium16.copyWith(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${user.mobile.code} ${user.mobile.phone.replaceFirst('0', '')}",
                    textDirection: TextDirection.ltr,
                    style: TextStyles.medium14.copyWith(),
                  ),
                ],
              ),
            ),
            // Bounce(
            //     duration: const Duration(milliseconds: 100),
            //     onTap: () => AppRouter.pushNamed(AppRoutes.accountPage),
            //     // onTap: () => UpdatePhonePage.show(context),
            //     child: AppSvgIcon(
            //         path: AppIcons.editIc,
            //         width: 20,
            //         height: 20,
            //         size: 20,
            //         color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}

class _ShareAndRateTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  const _ShareAndRateTile(
      {this.onTap, required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withAlpha(50),
            border: Border.all(color: Colors.white.withAlpha(100)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.lightGradient,
                ),
                child: AppSvgIcon(
                  path: iconPath,
                  size: 16,
                ),
              ),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: TextStyles.light10.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension OppositeDirectionality on BuildContext {
  TextDirection get oppositeDirectionality {
    final current = Directionality.of(this);
    return current == TextDirection.ltr ? TextDirection.rtl : TextDirection.ltr;
  }
}

class NotificationSwitch extends StatefulWidget {
  const NotificationSwitch({super.key});

  @override
  State<NotificationSwitch> createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch>
    with WidgetsBindingObserver {
  bool notificationSettingsEnabled = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkNotificationPermission();
  }

  Future<void> _checkNotificationPermission() async {
    final isGranted = await PermissionsHandler.checkNotificationsPermission();
    if (mounted) {
      setState(() {
        notificationSettingsEnabled = isGranted;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkNotificationPermission();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.oppositeDirectionality,
      child: Transform.scale(
        alignment: AlignmentDirectional.centerStart,
        scale: 0.53,
        child: CupertinoSwitch(
          activeTrackColor: AppColors.primary,
          value: notificationSettingsEnabled,
          onChanged: (newVal) {
            PermissionsHandler.openSettings();
            // setState(() {
            //   notificationSettingsEnabled = newVal;
            // });
          },
        ),
      ),
    );
  }
}
