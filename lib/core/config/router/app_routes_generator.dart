import 'package:wasli/src/layouts/delivery/register/presentation/delivery_register_screen.dart';
import 'package:wasli/src/layouts/provider/register/presentation/provider_register_screen.dart';
import 'package:wasli/src/layouts/client/register/presentation/user_register_page.dart';
import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wasli/src/shared/google_maps/presentation/maps_main_page.dart';
import 'package:wasli/src/shared/more/settings/settings_page.dart';

import '../../../src/shared/auth/presentation/login/login_page.dart';

import '../../../src/shared/notifications/presentation/notifications_cubit.dart';
import '../../../src/shared/notifications/presentation/notifications_dialog.dart';
import '../../../src/shared/more/about_us/about_us_page.dart';
import 'package:flutter/material.dart';
import '../../../material/change_language/change_language_page.dart';
import '../../../src/shared/auth/presentation/otp/otp_page.dart';

import '../../../src/shared/wallet/presentation/payment_web_view/payment_webview_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'app_routes.dart';
import '../../core.dart';
import '../../../my_app.dart';

class AppRoutesGenerator {
  const AppRoutesGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Widget page;
    switch (settings.name) {
      case AppRoutes.home:
        page = const BuilderScreen();

      /// Common and static and common pages
      ///

      case AppRoutes.changeLanguage:
        page = const ChangeLanguagePage();

      case AppRoutes.paymentWebView:
        final arguments = settings.arguments as PaymentWebViewPage;
        page = arguments;

      case AppRoutes.notificationsPage:
        final arguments = settings.arguments as NotificationsCubit;
        page = NotifiactionDialog(cubit: arguments);

      case AppRoutes.aboutUsPage:
        page = const AboutUsPage();

      /// Authentication
      ///
      case AppRoutes.login:
        page = const LoginPage();
      case AppRoutes.settingsPage:
        page = const SettingsPage();
      case AppRoutes.otp:
        final arguments = settings.arguments as OtpScreenArguments;
        page = OtpPage(arguments: arguments);

      ///USER
      ///
      case AppRoutes.clientRegister:
        page = const UserRegisterPage();

      /// DELIVERY
      ///
      case AppRoutes.deliveryRegister:
        page = const DeliveryRegisterScreen();

      /// PROVIDER
      ///
      case AppRoutes.providerRegister:
        page = const ProviderRegisterScreen();

      /// MAP
      ///
      case AppRoutes.mapPage:
        page = const MapsMainPage();

      default:
        page =
            const Scaffold(body: Center(child: Text('404 - Page not found')));
    }
    return MaterialPageRoute(
        builder: (context) => ResponsiveScaledBox(
            width: ResponsiveValue<double>(context,
                defaultValue: 450,
                conditionalValues: const [
                  Condition.between(
                      start: 0, end: 370, value: 355, landscapeValue: 500),
                  Condition.between(
                      start: 370, end: 450, value: 370, landscapeValue: 520),
                  Condition.between(
                      start: 450, end: 800, value: 440, landscapeValue: 780),
                  Condition.between(
                      start: 800, end: 1400, value: 540, landscapeValue: 820),
                  Condition.between(
                      start: 1400, end: 9999, value: 640, landscapeValue: 900),
                ]).value,
            child: BouncingScrollWrapper.builder(
              context,
              page,
              dragWithMouse: true,
            )),
        settings: settings);
  }

  static Route<dynamic> errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
            child: Text(
          '404 - Page not found',
          style: TextStyles.regular20,
        )),
      ),
    );
  }
}
