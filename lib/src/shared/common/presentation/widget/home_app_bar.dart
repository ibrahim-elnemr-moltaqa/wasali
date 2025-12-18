import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/network_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/presentation/widget/cart_count_icon_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAuthenticationBloc, AppAuthenticationState>(
      builder: (context, state) {
        RoleEnum role = RoleEnum.client;
        String? title;

        if (state is AuthAuthenticatedState) {
          role = state.role;
          title = state.user.name;
        } else if (state is GuestState) {
          role = state.role;
          title = appLocalizer.welcomeIn;
        }

        return Row(
          children: [
            _getPersonImage(role),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? appLocalizer.welcomeIn, style: TextStyles.bold14),
                const SizedBox(height: 4),
                Row(
                  children: [
                    AppSvgIcon(
                      path: AppIcons.fillLocation,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      role != RoleEnum.guest
                          ? appLocalizer.selectDeliveryAddress
                          : appLocalizer.selectLocation,
                      style: TextStyles.regular12.copyWith(
                        color: AppColors.grey2Color,
                      ),
                    )
                  ],
                ).onTapScaleAnimation(onTap: () {
                  AppRouter.pushNamed(AppRoutes.mapPage);
                })
              ],
            ),
            const Spacer(),
            Row(children: _getActions(role)),
          ],
        );
      },
    );
  }

  Widget _getPersonImage(RoleEnum role) {
    if (role == RoleEnum.client) {
      return AppSvgIcon(
        path: AppIcons.profile,
        size: 24,
        color: AppColors.greyColor,
      ).setBorder(
        radius: 12,
        padding: const EdgeInsets.all(12),
      );
    } else if (role == RoleEnum.provider) {
      return const AppMedia(
        path: AppConstants.networkImageTest,
        fit: BoxFit.cover,
        height: 44,
        width: 44,
        radius: 12,
      );
    } else {
      return const SizedBox.shrink();
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
}
