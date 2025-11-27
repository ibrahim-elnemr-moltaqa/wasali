import 'package:flutter/material.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/change_language/change_language_bottom_sheet.dart';
import 'package:wasli/src/shared/auth/presentation/logout/logout_page.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/domain/entity/menu/static_page_type_enum.dart';
import 'package:wasli/src/shared/common/presentation/menu/static_page/static_page.dart';
import 'package:wasli/src/shared/more/settings/widget/notification_switch.dart';

class MoreTileModel {
  final String title;
  final String icon;
  final void Function()? onTap;
  final Widget? trailing;
  final Color? color;
  final bool needAuth;
  MoreTileModel({
    required this.title,
    required this.icon,
    this.onTap,
    this.color = Colors.black,
    this.trailing,
    this.needAuth = false,
  });

  static List<MoreTileModel> loadRoleMoreItems(
      RoleEnum role, BuildContext context) {
    switch (role) {
      case RoleEnum.client:
        return [
          MoreTileModel(
            title: appLocalizer.previousOrders,
            icon: AppIcons.orderNav,
            onTap: () {},
          ),
          MoreTileModel(
            title: appLocalizer.wallet,
            icon: AppIcons.moreWallet,
            onTap: () {},
          ),
          MoreTileModel(
            title: appLocalizer.favorite,
            icon: AppIcons.favIc,
            onTap: () {},
          ),
          MoreTileModel(
            title: appLocalizer.customerSupport,
            icon: AppIcons.support,
            onTap: () => AppRouter.pushNamed(AppRoutes.contactPage),
          ),
          ..._generalMoreList(context),
        ];

      case RoleEnum.delivery:
        return [..._generalMoreList(context)];

      case RoleEnum.provider:
        return [
          MoreTileModel(
            title: appLocalizer.generalStatistics,
            icon: AppIcons.charts,
            onTap: () {},
          ),
          MoreTileModel(
            title: appLocalizer.customerSupport,
            icon: AppIcons.support,
            onTap: () => AppRouter.pushNamed(AppRoutes.contactPage),
          ),
          ..._generalMoreList(context)
        ];
      default:
        return _generalMoreList(context);
    }
  }

  static List<MoreTileModel> _generalMoreList(BuildContext context) => [
        MoreTileModel(
          title: appLocalizer.aboutApp,
          icon: AppIcons.aboutIc,
          onTap: () => AppRouter.push(
              const StaticPage(pageType: StaticPageTypeEnum.aboutUs)),
        ),
        MoreTileModel(
          title: appLocalizer.termsAndConditions,
          icon: AppIcons.termsAndConditionsIc,
          onTap: () => AppRouter.push(const StaticPage(
              pageType: StaticPageTypeEnum.termsAndConditions)),
        ),
        MoreTileModel(
          title: appLocalizer.privacyPolicy,
          icon: AppIcons.privacyPolicyIc,
          onTap: () => AppRouter.push(
              const StaticPage(pageType: StaticPageTypeEnum.privacyPolicy)),
        ),
        MoreTileModel(
          title: appLocalizer.logOut,
          icon: AppIcons.logoutIc,
          color: AppColors.error,
          needAuth: true,
          onTap: () => LogoutPage.showBottomSheet(context),
          trailing: const SizedBox.shrink(),
        ),
      ];

  //! settings role based items

  static List<MoreTileModel> loadSettingsRoleItems(
      RoleEnum role, BuildContext context) {
    switch (role) {
      case RoleEnum.client:
        return [
          MoreTileModel(
            title: appLocalizer.accountSettings,
            icon: AppIcons.user,
            onTap: () => AppRouter.pushNamed(AppRoutes.clientEditProfile),
            needAuth: true,
          ),
          MoreTileModel(
              title: appLocalizer.changePhoneNumber,
              icon: AppIcons.call,
              onTap: () => AppRouter.pushNamed(AppRoutes.updatePhonePage),
              needAuth: true),
          MoreTileModel(
              title: appLocalizer.deliveryAddresses,
              icon: AppIcons.location,
              onTap: () {},
              needAuth: true),
          MoreTileModel(
            title: appLocalizer.notifications,
            icon: AppIcons.bellIc,
            trailing: const NotificationSwitch(),
            needAuth: true,
          ),
          ...generalSettingsItems(context)
        ];
      case RoleEnum.provider:
        return [
          MoreTileModel(
            title: appLocalizer.service_provider_data,
            icon: AppIcons.user,
            onTap: () => AppRouter.pushNamed(AppRoutes.providerEditProfile),
            needAuth: true,
          ),
          MoreTileModel(
            title: appLocalizer.store_general_settings,
            icon: AppIcons.shop,
            onTap: () {},
            needAuth: true,
          ),
          MoreTileModel(
            title: appLocalizer.manage_store,
            icon: AppIcons.shop,
            onTap: () => AppRouter.pushNamed(AppRoutes.storeManagementScreen),
            needAuth: true,
          ),
          MoreTileModel(
            title: appLocalizer.working_days,
            icon: AppIcons.calendar,
            onTap: () {},
            needAuth: true,
          ),
          MoreTileModel(
            title: appLocalizer.financial_reports,
            icon: AppIcons.financialReports,
            onTap: () {},
            needAuth: true,
          ),
          MoreTileModel(
            title: appLocalizer.bank_account_data,
            icon: AppIcons.bank,
            onTap: () {},
            needAuth: true,
          ),
          ...generalSettingsItems(context)
        ];
      case RoleEnum.delivery:
        return [...generalSettingsItems(context)];
      default:
        return [];
    }
  }

  static List<MoreTileModel> generalSettingsItems(BuildContext context) {
    return [
      MoreTileModel(
        title: appLocalizer.language,
        icon: AppIcons.languageIc,
        onTap: () => ChangeLanguageBottomSheet.show(context),
      ),
      MoreTileModel(
        title: appLocalizer.country,
        icon: AppIcons.flag,
        onTap: () => ChangeLanguageBottomSheet.show(context),
      ),
    ];
  }
}
