import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/shared/auth/domain/use_case/can_update_phone_use_case.dart';
import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wasli/src/shared/auth/presentation/update_phone/update_phone_cubit.dart';
import 'package:wasli/src/shared/common/presentation/widget/custom_app_bar.dart';

class UpdatePhonePage extends StatefulWidget {
  const UpdatePhonePage({super.key});

  @override
  State<UpdatePhonePage> createState() => _UpdatePhonePageState();
}

class _UpdatePhonePageState extends State<UpdatePhonePage> {
  IntelPhoneNumberEntity? phone;
  final formKey = GlobalKey<FormState>();

  void onSave(BuildContext context) {
    final isValidForm = formKey.currentState?.validate() ?? false;
    if (isValidForm && phone != null) {
      final params = CanUpdatePhoneParams(
          phone: phone!.getPhoneEntity.numberWithZeroIfNot);
      context.read<UpdatePhoneCubit>().canUpdate(params);
    }
  }

  void _onSuccess() {
    if (phone == null) return;
    AppRouter.pushNamed(AppRoutes.otp,
        arguments: OtpScreenArguments(
            phone: phone!, caseEnum: OtpScreenCaseEnum.updatePhone));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: Text(appLocalizer.changePhoneNumber),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => UpdatePhoneCubit(),
        child: BlocListener<UpdatePhoneCubit, Async<void>>(
          listener: (context, state) {
            if (state.isSuccess) {
              AppLoadingWidget.removeOverlay();
              _onSuccess();
            } else if (state.isFailure) {
              AppLoadingWidget.removeOverlay();
              AppToasts.error(context, message: state.errorMessage ?? '');
            } else if (state.isLoading) {
              AppLoadingWidget.overlay();
            }
          },
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12,
              children: [
                IntelPhoneField(
                  label: appLocalizer.new_phone_number,
                  initialValue: phone,
                  onChange: (phoneNumber) {
                    setState(() {
                      phone = phoneNumber;
                    });
                  },
                ),
                Builder(builder: (context) {
                  return AppButton(
                    text: appLocalizer.change,
                    onPressed: () => onSave(context),
                  );
                }),
                const SizedBox(height: 8),
              ],
            ).paddingHorizontal(20),
          ),
        ),
      ),
    );
  }
}
