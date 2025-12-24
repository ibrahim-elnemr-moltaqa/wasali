import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/register/widget/provider_register_body.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/auth_app_bar_widget.dart';

class ProviderRegisterPage extends StatelessWidget {
  const ProviderRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AuthAppBarWidget(),
      body: Stack(
        children: [
          PositionedDirectional(
              bottom: 0,
              end: 0,
              child: SvgPicture.asset(
                  AppIllustrations.prooviderDeliveryAuthButtonSection)),
          Padding(
            padding: Dimensions.hPageMargins,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Text(
                  appLocalizer.createAccount,
                  style: TextStyles.regular12,
                ),
                const SizedBox(height: 12),
                Text(
                  appLocalizer.registerWelcome,
                  style: TextStyles.regular12
                      .copyWith(color: AppColors.grey2Color),
                ),
                const SizedBox(height: 32),
                const ProviderRegisterBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
