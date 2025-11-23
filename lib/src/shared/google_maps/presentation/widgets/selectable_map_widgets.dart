part of "../maps_main_page.dart";

class _SelectableMapWidgets extends StatelessWidget {
  const _SelectableMapWidgets();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const MapsAppBarWidget(),
        BlocBuilder<MapsMainCubit, MapsMainState>(
          buildWhen: (previous, current) =>
              previous.locationState != current.locationState,
          builder: (context, state) {
            final locationData = state.locationState.data;
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(appLocalizer.address, style: TextStyles.bold14),
                  const SizedBox(
                    height: 12,
                  ),
                  HandleResponseWidget(
                      status: state.locationState,
                      onSuccess: (_) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSvgIcon(
                              path: AppIcons.fillLocation,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    locationData?.component?.streetName ?? '',
                                    style: TextStyles.bold12,
                                  ),
                                  Text(
                                    '${locationData?.component?.city ?? ''},${locationData?.component?.area},  ${locationData?.component?.country}',
                                    style: TextStyles.regular12.copyWith(
                                      color: AppColors.text1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  AppButton(
                    text: appLocalizer.confirmAddress,
                    onPressed: locationData != null
                        ? () {
                            Navigator.of(context).pop(locationData);
                          }
                        : null,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
