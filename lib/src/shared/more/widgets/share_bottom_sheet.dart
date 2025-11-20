// part of '../more_page.dart';

// class ShareBottomSheet extends StatelessWidget {
//   const ShareBottomSheet({super.key});
//   static Future<void> show(BuildContext context) async => await showAppModalBottomSheet(
//         context: context,
//         child: const ShareBottomSheet(),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ContactUsCubit()..getData(),
//       child: BlocBuilder<ContactUsCubit, ContactUsState>(
//         builder: (context, state) {
//           if (state.dataState.isLoading) {
//             return const Padding(
//               padding: EdgeInsets.only(
//                 top: 20,
//               ),
//               child: SpinKitLoadingWidget(),
//             );
//           } else if (state.dataState.isFailure) {
//             return Padding(
//               padding: const EdgeInsets.only(
//                 top: 20,
//               ),
//               child: AppFailWidget(
//                 onRetry: () {
//                   context.read<ContactUsCubit>().getData();
//                 },
//               ),
//             );
//           }
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
          
//                   Text(
//                     appLocalizer.shareApp,
//                 style: TextStyles.regular20,
//                   ),
//               const SizedBox(height: 12),
//               Text.rich(
//                 TextSpan(children: [
//                   TextSpan(text: appLocalizer.shareAppHint),
//                   const TextSpan(text: ' '),
//                   TextSpan(
//                     text: appLocalizer.via,
//                     style: TextStyles.light14.copyWith(color: AppColors.primary),
//                   )
//                 ]),
//                 style: TextStyles.light14.copyWith(color: AppColors.secondary800),
//               ),
                 
             
            
//               const SizedBox(
//                 height: 20,
//               ),
//               // SingleChildScrollView(
//               //   scrollDirection: Axis.horizontal,
//               //   child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.center,
//               //       spacing: 8,
//               //       children: ProviderDetailsEntity
//               //           .example.socialMediaLinks!.getSocialLinks
//               //           .map(
//               //         (url) {
//               //           return PopularSitesLinksUtils(url).builder(
//               //             context,
//               //             (url, launchFun, siteWidget) {
//               //               return _SocialCard(
//               //                 text:
//               //                     PopularSitesLinksUtils(url).getSiteType.name,
//               //                 image: siteWidget,
//               //                 onTap: () => onTapSocial(
//               //                   context,
//               //                   url,
//               //                   state.dataState.data?.getStoreLink ?? "",
//               //                 ),
//               //               );
//               //             },
//               //           );
//               //         },
//               //       ).toList()),
//               // ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Container(
//                 // padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: AppColors.secondary100),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         behavior: HitTestBehavior.opaque,
//                         onTap: () => copyToClipboard(context, state.dataState.data?.getStoreLink ?? ""),
//                         child: Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color: AppColors.primary,
//                             borderRadius: const BorderRadiusDirectional.horizontal(
//                               start: Radius.circular(8),
//                             ),
//                           ),
//                           child: Text(
//                             appLocalizer.copyLink,
//                             style: TextStyles.regular14.copyWith(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Text(
//                           state.dataState.data?.getStoreLink ?? "www. example.com",
//                           textAlign: TextAlign.end,
//                           style: TextStyles.regular14.copyWith(color: AppColors.text3, overflow: TextOverflow.ellipsis),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   void onTapSocial(
//       BuildContext context, String socialURL, String appURL) async {
//     await copyToClipboard(context, appURL);
//     await LaunchUrlUtils.openUrl(
//       url: PopularSitesLinksUtils(socialURL).getSiteType.baseUrl,
//     );
//   }

//   Future<void> copyToClipboard(BuildContext context, String text) async {
//     await Clipboard.setData(ClipboardData(text: text));
//     if (context.mounted) {
//       AppToasts.success(context, message: appLocalizer.linkCopied);
//     }
//   }
// }

// class _SocialCard extends StatelessWidget {
//   final String text;
//   final Widget image;
//   final void Function()? onTap;
//   const _SocialCard({
//     required this.text,
//     required this.image,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Bounce(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: AppColors.secondary50, shape: BoxShape.circle),
//         alignment: Alignment.center,
//         child: SizedBox(
//           width: 32,
//           height: 32,
//           child: Center(
//             child: image,
//           ),
//         ),
//       ),
//     );
//   }
// }
