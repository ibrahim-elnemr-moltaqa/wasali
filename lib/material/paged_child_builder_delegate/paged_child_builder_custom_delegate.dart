// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:wasli/core/core.dart';
// import '../app_fail_widget.dart';
// import '../app_loading_widget.dart';

// class PagedChildBuilderCustomDelegate<ItemType>
//     extends PagedChildBuilderDelegate<ItemType> {
//   PagedChildBuilderCustomDelegate(
//       {required this.controller,
//       required super.itemBuilder,
//       this.firstPageProgressBuilder,
//       this.firstPageFailBuilder,
//       this.noItemsFoundBuilder});

//   final MyPagingController<ItemType> controller;
//   final WidgetBuilder? firstPageProgressBuilder;
//   final WidgetBuilder? noItemsFoundBuilder;
//   final WidgetBuilder? firstPageFailBuilder;

//   @override
//   WidgetBuilder? get firstPageErrorIndicatorBuilder =>
//       firstPageFailBuilder ??
//       (context) {
//         return AppFailWidget(
//           showIllustration: true,
//           onRetry: () {
//             controller.refresh();
//           },
//         );
//       };

//   @override
//   WidgetBuilder? get firstPageProgressIndicatorBuilder =>
//       this.firstPageProgressBuilder ?? (context) => const AppLoadingWidget();

//   @override
//   WidgetBuilder? get noItemsFoundIndicatorBuilder =>
//       noItemsFoundBuilder ??
//       (context) => Center(
//             child: Text(
//               appLocalizer.noResultFound,
//               style: TextStyles.medium15(color: AppColors.blue400),
//             ),
//           );

//   @override
//   WidgetBuilder? get newPageProgressIndicatorBuilder => (context) {
//         return Center(
//           child: UnconstrainedBox(
//             child: Container(
//               alignment: Alignment.center,
//               margin: const EdgeInsets.all(16),
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: AppColors.mainColor, width: 1.5)),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(appLocalizer.loadMore,
//                       textAlign: TextAlign.start,
//                       style: TextStyles.semiBold12()
//                           .copyWith(color: AppColors.mainColor)
//                           .copyWith(height: 1)),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   SizedBox(
//                     height: 10,
//                     width: 10,
//                     child: CircularProgressIndicator(
//                       color: AppColors.mainColor,
//                       strokeWidth: 2.5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       };

//   @override
//   WidgetBuilder? get newPageErrorIndicatorBuilder => (context) {
//         return GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: () {
//             controller.retryLastFailedRequest();
//           },
//           child: Center(
//             child: UnconstrainedBox(
//               child: Container(
//                 alignment: Alignment.center,
//                 margin: const EdgeInsets.all(16),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: AppColors.error200, width: 1.5)),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(appLocalizer.failToLoad,
//                         textAlign: TextAlign.start,
//                         style: TextStyles.semiBold12()
//                             .copyWith(color: AppColors.error200)
//                             .copyWith(height: 1)),
//                     const SizedBox(
//                       width: 6,
//                     ),
//                     const Icon(
//                       Icons.warning_amber_rounded,
//                       color: AppColors.error200,
//                       size: 16,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       };

//   @override
//   bool get animateTransitions => true;
// }
