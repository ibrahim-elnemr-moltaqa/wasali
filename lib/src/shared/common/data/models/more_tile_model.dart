import 'package:flutter/material.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/auth/presentation/logout/logout_page.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/domain/entity/menu/static_page_type_enum.dart';
import 'package:wasli/src/shared/common/presentation/menu/static_page/static_page.dart';

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
          ..._generalMoreList,
          MoreTileModel(
            title: appLocalizer.logOut,
            icon: AppIcons.logoutIc,
            color: AppColors.error,
            needAuth: true,
            onTap: () => LogoutPage.showBottomSheet(context),
          ),
        ];

      case RoleEnum.delivery:
        return [..._generalMoreList];

      case RoleEnum.provider:
        return [
          MoreTileModel(
            title: appLocalizer.generalStatistics,
            icon: AppIcons.charts,
            onTap: () {},
          ),
          ..._generalMoreList
        ];
      default:
        return _generalMoreList;
    }
  }

  static final List<MoreTileModel> _generalMoreList = [
    MoreTileModel(
      title: appLocalizer.aboutApp,
      icon: AppIcons.aboutIc,
      onTap: () => AppRouter.push(
          const StaticPage(pageType: StaticPageTypeEnum.aboutUs)),
    ),
    MoreTileModel(
      title: appLocalizer.termsAndConditions,
      icon: AppIcons.termsAndConditionsIc,
      onTap: () => AppRouter.push(
          const StaticPage(pageType: StaticPageTypeEnum.termsAndConditions)),
    ),
    MoreTileModel(
      title: appLocalizer.privacyPolicy,
      icon: AppIcons.privacyPolicyIc,
      onTap: () => AppRouter.push(
          const StaticPage(pageType: StaticPageTypeEnum.privacyPolicy)),
    ),
  ];
}
