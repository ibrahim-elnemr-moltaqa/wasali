import '../../../../material/media/app_image.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../../../../material/app_fail_widget.dart';
import '../../../../material/app_loading_widget.dart';
import '../domain/entities/norification_entity.dart';
import 'notifications_cubit.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NotifiactionDialog extends StatefulWidget {
  final NotificationsCubit cubit;
  const NotifiactionDialog({super.key, required this.cubit});

  @override
  State<NotifiactionDialog> createState() => _NotifiactionDialogState();
}

class _NotifiactionDialogState extends State<NotifiactionDialog> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   widget.cubit.getNotifications(1);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => AppRouter.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
        title: Text(
          appLocalizer.notifications,
          style: TextStyles.semiBold16,
        ),
        centerTitle: true,
      ),
      body: BlocSelector<NotificationsCubit, NotificationsState,
          Async<List<NotificationEntity>>>(
        selector: (state) => state.notificationsState,
        bloc: widget.cubit,
        builder: (context, state) {
          if (state.isSuccess) {
            final List<NotificationEntity> notifiactions = state.data ?? [];
            if (notifiactions.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage(
                      path: AppImages.emptyState,
                      height: 158,
                    ),
                    Text(
                      appLocalizer.noNotifiactionsYet,
                      style: TextStyles.medium20,
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: notifiactions.length,
                itemBuilder: (ctx, index) => Bounce(
                  onTap: () =>
                      widget.cubit.markNotificationAsRead(notifiactions[index]),
                  child: _NotificationTile(
                    model: notifiactions[index],
                  ),
                ),
              );
            }
          } else if (state.isLoading) {
            return const AppLoadingWidget();
          } else if (state.isFailure) {
            return AppFailWidget(
              margin: const EdgeInsets.all(12),
              textStyle: TextStyles.regular14,
              onRetry: () {
                context.read<NotificationsCubit>().getNotifications(1);
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final NotificationEntity model;
  static const Color activeColor = Color(0xffF7F9F9);
  const _NotificationTile({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: !model.isRead ? AppColors.backgroundColor : activeColor,
          border: Border(
            bottom: BorderSide(
              color: model.isRead ? AppColors.backgroundColor : activeColor,
            ),
          )),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: model.isRead ? AppColors.backgroundColor : activeColor,
            ),
            child: Icon(
              Iconsax.notification,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        model.title,
                        style: TextStyles.semiBold14.copyWith(
                          color: AppColors.primary900,
                        ),
                      ),
                    ),
                    Text(
                      DateTime.parse(model.createdAt).toHHMMa,
                      style: TextStyles.bold12.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  model.body,
                  style: TextStyles.regular12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
