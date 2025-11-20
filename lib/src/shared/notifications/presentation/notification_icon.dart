// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wasli/core/core.dart';
// import 'package:wasli/material/media/svg_icon.dart';
// import 'package:wasli/material/overlay/anchor_tile.dart';
// import 'package:wasli/src/notifications/presentation/notifications_cubit.dart';

// import 'notifications_dialog.dart';

// class NotificationIcon extends StatefulWidget {
//   const NotificationIcon({super.key});

//   @override
//   State<NotificationIcon> createState() => _NotificationIconState();
// }

// class _NotificationIconState extends State<NotificationIcon> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<NotificationsCubit>().getNotifications(1);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocSelector<NotificationsCubit, NotificationsState, int?>(
//       selector: (state) {
//         return state.notificationsCountState.data;
//       },
//       builder: (context, count) {
//         final bool hasNewNotifiactions = count != null && count > 0;
//         return AnchorTile(
//           align: AlignmentDirectional.centerEnd,
//           dx: .3,
//           minChildrenWidth: 260,
//           headerText: appLocalizer.notifications,
//           children: [
//             ConstrainedBox(
//                 constraints: const BoxConstraints(
//                   maxWidth: 260,
//                   minHeight: 200,
//                 ),
//                 child: const NotifiactionDialog()),
//           ],
//           child: Container(
//               height: 28,
//               width: 28,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.primary600,
//                     offset: Offset(4, 2),
//                     blurRadius: 0,
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(4.5),
//                       child: AppSvgIcon(path: "AppIcons.notificationIc"),
//                     ),
//                   ),
//                   if (hasNewNotifiactions)
//                     Container(
//                       height: 4,
//                       width: 4,
//                       margin: const EdgeInsetsDirectional.only(
//                         start: 9,
//                         top: 7,
//                       ),
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: AppColors.red800,
//                       ),
//                     )
//                 ],
//               )),
//         );
//       },
//     );
//   }
// }
