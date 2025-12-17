import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wasli/src/layouts/client/profile/client_edit_profile_page.dart';
import 'package:wasli/src/layouts/client/providers/presentation/page/all_providers_page.dart';
import 'package:wasli/src/layouts/client/providers/presentation/page/provider_page.dart';
import 'package:wasli/src/layouts/client/register/presentation/user_register_page.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/register/delivery_register_screen.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/update_profile/delivery_update_profile_page.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/update_profile/delviery_update_bank_data_page.dart';
import 'package:wasli/src/layouts/delivery/authentication/presentation/update_profile/delviery_update_vehicle_data_page.dart';
import 'package:wasli/src/layouts/provider/authentication/data/enum/provider_enum.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/register/provider_register_screen.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/update_profile/edit_profile/general_store_settings.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/update_profile/edit_profile/provider_edit_profile.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/package_details_page.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/packages_page.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/add_new_product_page.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/store_management_screen.dart';
import 'package:wasli/src/layouts/provider/settings/working_days/working_days_page.dart';
import 'package:wasli/src/shared/auth/domain/use_case/verify_otp_use_case.dart';
import 'package:wasli/src/shared/auth/presentation/update_phone/update_phone_page.dart';
import 'package:wasli/src/shared/google_maps/presentation/maps_main_page.dart';
import 'package:wasli/src/shared/more/settings/settings_page.dart';

import '../../../material/change_language/change_language_page.dart';
import '../../../my_app.dart';
import '../../../src/shared/auth/presentation/login/login_page.dart';
import '../../../src/shared/auth/presentation/otp/otp_page.dart';
import '../../../src/shared/more/about_us/about_us_page.dart';
import '../../../src/shared/notifications/presentation/notifications_cubit.dart';
import '../../../src/shared/notifications/presentation/notifications_dialog.dart';
import '../../../src/shared/wallet/presentation/payment_web_view/payment_webview_page.dart';
import '../../core.dart';
import 'app_routes.dart';

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
      case AppRoutes.updatePhonePage:
        page = const UpdatePhonePage();

      ///USER
      ///
      case AppRoutes.clientRegister:
        page = const UserRegisterPage();
      case AppRoutes.allProvidersPage:
        final arguments = settings.arguments as ProviderTypeEnum;
        page = AllProvidersPage(
          providerType: arguments,
        );
      case AppRoutes.providerPage:
        page = const ProviderPage();
      case AppRoutes.clientEditProfile:
        page = const ClientEditProfilePage();

      /// DELIVERY
      ///
      case AppRoutes.deliveryRegisterPage:
        page = const DeliveryRegisterScreen();
      case AppRoutes.deliveryEditProfilePage:
        page = const DeliveryUpdateProfilePage();
      case AppRoutes.deliveryUpdateBankDataPage:
        page = const DeliveryUpdateBankDataPage();
      case AppRoutes.deliveryUpdateVehicleDataPage:
        page = const DeliveryUpdateVehicleDataPage();

      /// PROVIDER
      ///
      case AppRoutes.providerRegisterPage:
        page = const ProviderRegisterPage();
      case AppRoutes.providerEditProfile:
        page = const ProviderEditProfile();
      case AppRoutes.storeManagementPage:
        page = const StoreManagementPage();
      case AppRoutes.addNewProductPage:
        page = const AddNewProductPage();
      case AppRoutes.workingTimePage:
        page = const WorkingTimePage();
      case AppRoutes.generalStoreSettingsPage:
        page = const GeneralStoreSettingsPage();
      case AppRoutes.packagesPage:
        page = const PackagesPage();
      case AppRoutes.packageDetailsPage:
        page = const PackageDetailsPage();

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

class AppScaledBox extends StatelessWidget {
  const AppScaledBox({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaledBox(
      width: ResponsiveValue<double>(
        context,
        defaultValue: 450,
        conditionalValues: const [
          Condition.between(
            start: 0,
            end: 370,
            value: 355,
            landscapeValue: 500,
          ),
          Condition.between(
            start: 370,
            end: 450,
            value: 370,
            landscapeValue: 520,
          ),
          Condition.between(
            start: 450,
            end: 800,
            value: 440,
            landscapeValue: 780,
          ),
          Condition.between(
            start: 800,
            end: 1400,
            value: 540,
            landscapeValue: 820,
          ),
          Condition.between(
            start: 1400,
            end: 9999,
            value: 640,
            landscapeValue: 900,
          ),
        ],
      ).value,
      child: BouncingScrollWrapper.builder(context, child, dragWithMouse: true),
    );
  }
}
