part of "../maps_main_page.dart";

class _OnlyMapAddressPreviewWidget extends StatelessWidget {
  const _OnlyMapAddressPreviewWidget({
    required this.addressEntity,
    required this.onAddressTapped,
  });
  final MapAddressEntity addressEntity;
  final void Function() onAddressTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          title: Text('maps'),
          centerTitle: true,
        ),
        InkWell(
          onTap: onAddressTapped,
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appLocalizer.address_details,
                    style: TextStyles.medium16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: AppSvgIcon(
                              path: AppIcons.location,
                              size: 18,
                            ),
                          ),
                          // const Icon(
                          //   Icons.location_on_outlined,
                          //   size: 22,
                          // color: AppColors.text,
                          // ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              addressEntity.address,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.regular14,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
