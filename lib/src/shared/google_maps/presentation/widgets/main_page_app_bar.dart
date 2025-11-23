import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/material/media/svg_icon.dart';
import '../../domain/models/address_entity.dart';
import '../maps_main_cubit.dart';
import '../search/maps_search_page.dart';

class MapsAppBarWidget extends StatelessWidget {
  const MapsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(14)),
          child: BackButton(
            onPressed: () => AppRouter.pop(),
          ),
        ),
      ),
      title: Text(appLocalizer.your_location_on_map),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvgIcon(
                path: AppIcons.searchIc,
              ),
            ),
          ).onTapScaleAnimation(onTap: () {
            Navigator.push(context, FadeTransitionRoute(child: (_) {
              return MapsSearchPage(
                initialAddress:
                    context.read<MapsMainCubit>().state.locationState.data,
              );
            })).then((value) {
              if (value != null && value is MapAddressEntity) {
                if (!context.mounted) return;
                context.read<MapsMainCubit>().setLocationAddressData(value);
              }
            });
          }),
        )
      ],
    );
  }
}