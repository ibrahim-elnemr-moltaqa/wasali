import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/presentation/choose_role/widget/role_card_widget.dart';

class ChooseRolePage extends StatefulWidget {
  const ChooseRolePage({super.key});

  @override
  State<ChooseRolePage> createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
  ValueNotifier<RoleEnum?> roleNotifier = ValueNotifier(null);
  final _setRoleUseCase = SetUserRoleUseCase.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Dimensions.hPageMargins,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                appLocalizer.choose_start,
                style: TextStyles.bold18,
              ),
              Text(
                appLocalizer.choose_start_description,
                style: TextStyles.regular14,
              ),
              const SizedBox(
                height: 50,
              ),
              ValueListenableBuilder(
                  valueListenable: roleNotifier,
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        RoleCardWidget(
                          role: RoleEnum.client,
                          isSelected: roleNotifier.value == RoleEnum.client,
                          onTap: () => roleNotifier.value = RoleEnum.client,
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        RoleCardWidget(
                          role: RoleEnum.provider,
                          imageInStart: true,
                          isSelected: roleNotifier.value == RoleEnum.provider,
                          onTap: () => roleNotifier.value = RoleEnum.provider,
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        RoleCardWidget(
                          role: RoleEnum.delivery,
                          isSelected: roleNotifier.value == RoleEnum.delivery,
                          onTap: () => roleNotifier.value = RoleEnum.delivery,
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: roleNotifier,
          builder: (context, value, child) {
            return AppButton(
              text: appLocalizer.next,
              buttonColor: AppColors.primary,
              onPressed: () {
                if (value != null) {
                  _setRoleUseCase(value);
                  AppAuthenticationBloc.of(context)
                      .add(OnFinishWalkThrowEvent());
                } else {
                  AppToasts.hint(context, message: 'من فضلك اختر واحد');
                }
              },
            ).paddingAll(20);
          }),
    );
  }
}
