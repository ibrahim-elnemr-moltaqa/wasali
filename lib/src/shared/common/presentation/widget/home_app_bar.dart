import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/presentation/widget/cart_count_icon_widget.dart';
import 'package:wasli/src/shared/google_maps/domain/models/address_entity.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  ValueNotifier<MapAddressEntity?> locationAddress = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAuthenticationBloc, AppAuthenticationState>(
      builder: (context, state) {
        RoleEnum role = RoleEnum.client;
        CachedUser? user;
        if (state is AuthAuthenticatedState) {
          role = state.role;
          user = state.user;
        } else if (state is GuestState) {
          role = state.role;
        }

        return Row(
          children: [
            _getPersonImage(user),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user?.name ?? appLocalizer.welcomeIn,
                      style: TextStyles.bold14),
                  const SizedBox(height: 4),
                  ValueListenableBuilder(
                      valueListenable: locationAddress,
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            AppSvgIcon(
                              path: AppIcons.fillLocation,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                locationAddress.value?.address ??
                                    (role != RoleEnum.guest
                                        ? appLocalizer.selectDeliveryAddress
                                        : appLocalizer.selectLocation),
                                style: TextStyles.regular12.copyWith(
                                  color: AppColors.grey2Color,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ).onTapScaleAnimation(onTap: () {
                          AppRouter.pushNamed(AppRoutes.mapPage).then((value) {
                            if (value == null) return;
                            locationAddress.value = value as MapAddressEntity;
                          });
                        });
                      })
                ],
              ),
            ),
            const Spacer(),
            Row(children: _getActions(role)),
          ],
        );
      },
    );
  }

  Widget _getPersonImage(CachedUser? user) {
    if (user != null && user.avatar != null && user.avatar!.isNotEmpty) {
      return AppImage(
        path: user.avatar!,
        height: 44,
        width: 44,
        radius: 12,
      );
    } else {
      return AppSvgIcon(
        path: AppIcons.profile,
        size: 30,
      ).setBorder(
        radius: 12,
        padding: const EdgeInsets.all(8),
        color: AppColors.borderColor,
      );
    }
  }
}

List<Widget> _getActions(RoleEnum role) {
  if (role == RoleEnum.client) {
    return [
      AppSvgIcon(
        path: AppIcons.searchIc,
        size: 20,
      )
          .setBorder(
            radius: 12,
            padding: const EdgeInsets.all(8),
          )
          .onTapScaleAnimation(
              onTap: () => AppRouter.pushNamed(AppRoutes.searchPage)),
      const SizedBox(width: 12),
      const CartCountIconWidget(
        padding: 0,
      )
    ];
  } else if (role == RoleEnum.provider) {
    return [
      AppSvgIcon(
        path: AppIcons.notificationIc,
      ).setBorder(
        radius: 12,
        padding: const EdgeInsets.all(8),
      )
    ];
  } else {
    return [];
  }
}
