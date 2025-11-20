import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';

import 'package:wasli/core/core.dart';
import '../../../../../material/app_loading_widget.dart';
import '../../../../../material/buttons/app_button.dart';
import '../../../../../material/inputs/intel_phone/phone_field.dart';
import '../../../../../material/toast/app_toast.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/domain/use_case/update_phone_use_case.dart';
import '../../../auth/domain/use_case/verify_otp_use_case.dart';
import '../../../auth/presentation/otp/otp_page.dart';
import 'edit_phone_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePhonePage extends StatefulWidget {
  const UpdatePhonePage._({super.key});

  static Future<void> show(BuildContext context) async {
    showAppModalBottomSheet(context: context, child: const UpdatePhonePage._());
  }

  @override
  State<UpdatePhonePage> createState() => _UpdatePhonePageState();
}

class _UpdatePhonePageState extends State<UpdatePhonePage> {
  PhoneEntity? newPhoneNumber;
  @override
  void initState() {
    if (context.read<AppAuthenticationBloc>().state is AuthAuthenticatedState) {
      final state =
          context.read<AppAuthenticationBloc>().state as AuthAuthenticatedState;
      newPhoneNumber = state.user.mobile;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePhone(),
      child: BlocConsumer<UpdatePhone, Async>(
        listener: (context, state) {
          if (state.isLoading) {
            AppLoadingWidget.overlay();
          } else if (state.isSuccess) {
            AppLoadingWidget.removeOverlay();
            onSuccess();
          } else if (state.isFailure) {
            AppLoadingWidget.removeOverlay();
            AppToasts.error(context, message: state.errorMessage ?? '');
          }
        },
        builder: (ctx, state) => Column(
          children: [
            Text(appLocalizer.phoneNumber, style: TextStyles.regular20),
            const SizedBox(height: 12),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: appLocalizer.enterPhoneNumber),
                const TextSpan(text: ' '),
                TextSpan(
                  text: appLocalizer.belongsToYou,
                  style: TextStyles.light14.copyWith(color: AppColors.primary),
                )
              ]),
              textAlign: TextAlign.center,
              style: TextStyles.light14.copyWith(color: AppColors.secondary800),
            ),
            const SizedBox(
              height: 16,
            ),
            IntelPhoneField(
              initialValue: newPhoneNumber!.toIntelPhoneEntity(),
              onChange: (newVal) => newPhoneNumber = newVal.getPhoneEntity,
            ),
            AppButton(
              text: appLocalizer.save,
              onPressed: () => onSave(ctx),
            ),
          ],
        ),
      ),
    );
  }

  void onSave(BuildContext ctx) {
    // AppAuthenticationBloc.of(context).add(LoggedOutEvent());

    ctx.read<UpdatePhone>().updatePhone(
          UpdatePhoneParams(
            phoneEntity: newPhoneNumber!.getPhoneEntity,
          ),
        );
  }

  void onSuccess() async {
    // AppAuthenticationBloc.of(context).add(UnAuthorizedEvent());
    // OtpPage.show(
    //   context,
    //   arguments: OtpScreenArguments(
    //     caseEnum: OtpScreenCaseEnum.updatePhone,
    //     phone: newPhoneNumber!.toIntelPhoneEntity(),
    //   ),
    // );
  }
}
