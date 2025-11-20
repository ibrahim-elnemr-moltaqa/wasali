import '../../../core/core.dart';
import '../../app_fail_widget.dart';
import 'paginated_scroll_view_cubit.dart';
import '../../spin_kit_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatedListView<T> extends StatefulWidget {
  final PaginationCubit<T> cubit;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final bool reverse;
  final Widget? loadingWidget;
  final Widget? itemLoadingWidget;
  const PaginatedListView({
    super.key,
    required this.cubit,
    required this.itemBuilder,
    this.controller,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.loadingWidget,
    this.itemLoadingWidget,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    widget.cubit.loadInitial();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        widget.cubit.hasMore &&
        !widget.cubit.state.isLoading) {
      widget.cubit.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationCubit<T>, Async<List<T>>>(
      bloc: widget.cubit,
      builder: (context, state) {
        if (state.isLoading && widget.cubit.items.isEmpty) {
          return widget.loadingWidget ??
              const Center(child: SpinKitLoadingWidget());
        }
        if (state.isFailure) {
          return AppFailWidget(
            onRetry: () => widget.cubit.loadMore(),
          );
        }

        final items = widget.cubit.items;
        final hasMore = widget.cubit.hasMore;

        return ListView.builder(
          controller: _scrollController,
          physics: widget.physics,
          padding: widget.padding,
          shrinkWrap: widget.shrinkWrap,
          scrollDirection: widget.scrollDirection,
          reverse: widget.reverse,
          itemCount: items.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < items.length) {
              return widget.itemBuilder(context, items[index]);
            } else {
              return widget.itemLoadingWidget ??
                  widget.loadingWidget ??
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: SpinKitLoadingWidget()),
                  );
            }
          },
        );
      },
    );
  }
}

class PaginatedGridView<T> extends StatefulWidget {
  final PaginationCubit<T> cubit;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final SliverGridDelegate gridDelegate;

  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final bool reverse;
  final Widget? loadingWidget;
  final Widget? itemLoadingWidget;

  const PaginatedGridView({
    super.key,
    required this.cubit,
    required this.itemBuilder,
    required this.gridDelegate,
    this.controller,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.loadingWidget,
    this.itemLoadingWidget,
  });

  @override
  State<PaginatedGridView<T>> createState() => _PaginatedGridViewState<T>();
}

class _PaginatedGridViewState<T> extends State<PaginatedGridView<T>> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    widget.cubit.loadInitial();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        widget.cubit.hasMore &&
        !widget.cubit.state.isLoading) {
      widget.cubit.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationCubit<T>, Async<List<T>>>(
      bloc: widget.cubit,
      builder: (context, state) {
        if (state.isLoading && widget.cubit.items.isEmpty) {
          return widget.loadingWidget ??
              const Center(
                child: SpinKitLoadingWidget(),
              );
        }
        if (state.isFailure) {
          return AppFailWidget(
            onRetry: () => widget.cubit.loadMore(),
          );
        }

        final items = widget.cubit.items;
        final hasMore = widget.cubit.hasMore;

        return GridView.builder(
          controller: _scrollController,
          gridDelegate: widget.gridDelegate,
          physics: widget.physics,
          padding: widget.padding,
          shrinkWrap: widget.shrinkWrap,
          scrollDirection: widget.scrollDirection,
          reverse: widget.reverse,
          itemCount: items.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < items.length) {
              return widget.itemBuilder(context, items[index]);
            } else {
              return widget.itemLoadingWidget ??
                  widget.loadingWidget ??
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: SpinKitLoadingWidget()),
                  );
            }
          },
        );
      },
    );
  }
}
