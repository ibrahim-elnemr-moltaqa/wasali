import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/home/presentation/client_home_page.dart';
import 'package:wasli/src/layouts/provider/home/presentation/page/provider_home_page.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/more/more_page.dart';

class MainPageTabEntity {
  final int index;
  final String name;
  final String icon;
  final String activeIcon;
  final Widget child;
  const MainPageTabEntity({
    required this.index,
    required this.name,
    required this.icon,
    required this.activeIcon,
    required this.child,
  });

  static List<MainPageTabEntity> getTaps({required RoleEnum type}) {
    if (type == RoleEnum.client) {
      return clientTaps;
    } else if (type == RoleEnum.delivery) {
      return deliveryTaps;
    } else if (type == RoleEnum.provider) {
      return providerTaps;
    } else {
      return [];
    }
  }
}

List<MainPageTabEntity> clientTaps = [
  MainPageTabEntity(
    index: 0,
    name: appLocalizer.home,
    icon: AppIcons.homeNav,
    activeIcon: AppIcons.homeNavActive,
    child: const ClientHomePage(),
  ),
  MainPageTabEntity(
    index: 1,
    name: appLocalizer.orders,
    icon: AppIcons.orderNav,
    activeIcon: AppIcons.ordersNavActive,
    child: const Center(child: Text('Orders')),
  ),
  more(2),
];

List<MainPageTabEntity> deliveryTaps = [
  MainPageTabEntity(
    index: 0,
    name: appLocalizer.home,
    icon: AppIcons.homeNav,
    activeIcon: AppIcons.homeNavActive,
    child: const Center(child: Text('Home')),
  ),
  MainPageTabEntity(
    index: 1,
    name: appLocalizer.orders,
    icon: AppIcons.orderNav,
    activeIcon: AppIcons.ordersNavActive,
    child: const Center(child: Text('Orders')),
  ),
  MainPageTabEntity(
    index: 2,
    name: appLocalizer.wallet,
    icon: AppIcons.walletNav,
    activeIcon: AppIcons.walletNavActive,
    child: const Center(child: Text('Wallet')),
  ),
  more(3)
];
List<MainPageTabEntity> providerTaps = [
  MainPageTabEntity(
    index: 0,
    name: appLocalizer.home,
    icon: AppIcons.homeNav,
    activeIcon: AppIcons.homeNavActive,
    child: const ProviderHomePage(),
  ),
  MainPageTabEntity(
    index: 1,
    name: appLocalizer.orders,
    icon: AppIcons.orderNav,
    activeIcon: AppIcons.ordersNavActive,
    child: const Center(child: Text('Orders')),
  ),
  MainPageTabEntity(
    index: 2,
    name: appLocalizer.wallet,
    icon: AppIcons.walletNav,
    activeIcon: AppIcons.walletNavActive,
    child: const Center(child: Text('Wallet')),
  ),
  MainPageTabEntity(
    index: 3,
    name: appLocalizer.offers,
    icon: AppIcons.offersNav,
    activeIcon: AppIcons.offersNavActive,
    child: const Center(child: Text('Offers')),
  ),
  more(4)
];

MainPageTabEntity more(int index) {
  return MainPageTabEntity(
    index: index,
    name: appLocalizer.more,
    icon: AppIcons.moreNav,
    activeIcon: AppIcons.moreNavActive,
    child: const MorePage(),
  );
}
