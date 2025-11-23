part of "../search/maps_search_page.dart";

class _MapsSearchAppBarWidget extends StatelessWidget {
  const _MapsSearchAppBarWidget(
      {required this.searchController, required this.onChange});
  final TextEditingController searchController;
  final void Function(String? text) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(14)),
          child: BackButton(
            onPressed: () => AppRouter.pop(),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: AppTextFormField(
                controller: searchController,
                inputType: TextInputType.text,
                hintText: appLocalizer.search_street_or_area,
                onChanged: onChange,
                prefixIcon: (isFocused) => AppSvgIcon(
                      path: AppIcons.searchIc,
                      color: AppColors.greyColor,
                      size: 16,
                    ))),
      ],
    );
  }
}
