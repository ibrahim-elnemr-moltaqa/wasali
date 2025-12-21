import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';

class GuestMoreWidget extends StatelessWidget {
  const GuestMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appLocalizer.welcomeIn,
                  style: TextStyles.bold14.copyWith(color: Colors.white)),
              const Gap(4),
              Text('ادخل إلى حسابك لتتمكن من إدارة طلباتك بسهولة',
                  style: TextStyles.regular12.copyWith(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: AppButton(
              text: appLocalizer.login,
              onPressed: () {
                AppAuthenticationBloc.of(context).add(ChooseRoleEvent());
              }),
        )
      ],
    ).setContainerToView(
      color: AppColors.black,
      padding: const EdgeInsets.all(12),
      height: 91,
      width: double.infinity,
      radius: 12,
    );
  }
}
