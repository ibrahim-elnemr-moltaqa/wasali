import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/spin_kit_loading_widget.dart';
import 'package:wasli/src/layouts/client/search/presentation/widgets/search_store_card.dart';
import 'package:wasli/src/shared/common/presentation/widget/cart_count_icon_widget.dart';

import '../../../../../../core/core.dart';
import 'cubit/search_cubit.dart';
import 'cubit/search_state.dart';
import 'widgets/search_widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..loadInitialData(),
      child: const _SearchPageView(),
    );
  }
}

class _SearchPageView extends StatefulWidget {
  const _SearchPageView();

  @override
  State<_SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<_SearchPageView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black)
            .setBorder(
              radius: 12,
            )
            .paddingAll(8),
        actions: [const CartCountIconWidget()],
        title: AppTextFormField(
          controller: _searchController,
          hintText: appLocalizer.searchForProduct,
          prefixIcon: (_) => AppSvgIcon(
            path: AppIcons.search,
            color: AppColors.greyColor,
          ),
          onFieldSubmitted: (query) {
            context.read<SearchCubit>().search(query);
          },
          onChanged: (text) {
            if (text.isEmpty) {
              context.read<SearchCubit>().clearSearch();
            }
          },
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state.query.isNotEmpty && state.searchResult.isSuccess) {
            return _buildSearchResults(context, state);
          } else if (state.query.isNotEmpty && state.searchResult.isLoading) {
            return const SpinKitLoadingWidget();
          }

          return _buildInitialView(context, state);
        },
      ),
    );
  }

  Widget _buildInitialView(BuildContext context, SearchState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.recent.isSuccess) ...[
            SearchSectionHeader(title: appLocalizer.recentlySearched),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: state.recent.data!.map((term) {
                return SearchChip(
                  label: term,
                  icon: AppIcons.history,
                  onTap: () {
                    _searchController.text = term;
                    context.read<SearchCubit>().search(term);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],
          if (state.popular.isSuccess) ...[
            SearchSectionHeader(title: appLocalizer.mostSearched),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: state.popular.data!.map((term) {
                return SearchChip(
                  label: term,
                  icon: AppIcons.trend,
                  onTap: () {
                    _searchController.text = term;
                    context.read<SearchCubit>().search(term);
                  },
                );
              }).toList(),
            ),
          ],
          if (state.recent.isLoading || state.popular.isLoading)
            const Center(child: SpinKitLoadingWidget()),
        ],
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context, SearchState state) {
    final results = state.searchResult.data!;

    return CustomScrollView(
      slivers: [
        if (results.restaurants.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _buildSectionHeader(
                context, appLocalizer.restaurants, results.restaurants.length),
          ),
          SliverList.separated(
            itemCount: results.restaurants.length,
            itemBuilder: (context, index) {
              return SearchStoreCard(store: results.restaurants[index]);
            },
            separatorBuilder: (context, index) => Divider(
              color: AppColors.lightGreyColor,
            ).paddingVertical(8),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 24,
            ),
            AppButton(text: appLocalizer.showMoreRestaurants, onPressed: () {})
                .paddingBottom(24),
          ]))
        ],
        if (results.supermarkets.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _buildSectionHeader(context, appLocalizer.supermarkets,
                results.supermarkets.length),
          ),
          SliverList.separated(
            itemCount: results.supermarkets.length,
            itemBuilder: (context, index) {
              return SearchStoreCard(store: results.supermarkets[index]);
            },
            separatorBuilder: (context, index) => Divider(
              color: AppColors.lightGreyColor,
            ).paddingVertical(8),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 24,
            ),
            AppButton(text: appLocalizer.showMoreSupermarkets, onPressed: () {})
                .paddingBottom(24),
          ]))
        ],
      ],
    ).paddingAll(20);
  }

  Widget _buildSectionHeader(BuildContext context, String title, int count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
