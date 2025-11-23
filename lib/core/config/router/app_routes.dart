import '../../../src/shared/more/settings/settings_page.dart';
import '../../../src/shared/more/about_us/about_us_page.dart';

class AppRoutes {
  const AppRoutes._();

  static const home = '/';
  static const mainPage = '/MainPage';

  /// Authentication
  ///
  static const login = '/LoginPage';
  static const otp = '/OtpScreen';
  static const studentOtp = '/StudentOtpPage';
  static const forgetPassword = '/ForgetPasswordPage';
  static const resetPassword = '/ResetPasswordPage';
  static const updatePasswordPage = '/UpdatePasswordPage';
  static const updatePhonePage = '/UpdatePhonePage';

  /// USER
  ///
  static const clientRegister = '/ClientRegisterPage';

  /// Provider
  ///
  static const providerRegister = '/ProviderRegisterPage';

  /// Delivery
  ///
  static const deliveryRegister = '/DeliveryRegisterPage';

  /// Static Pages
  ///
  static const staticPage = '/StaticPage';
  static const contactPage = '/ContactPage';
  static const faqsPage = '/FaqsPage';
  static const changeLanguage = '/ChangeLanguagePage';
  static const paymentWebView = '/PaymentWebViewPage';
  static const aboutUsPage = AboutUsPage.routeName;
  static const notificationsPage = "/notifications";
  static const settingsPage = SettingsPage.routeName;

  /// Service
  ///
  static const requestServicePage = '/RequestServicePage';

  /// Chat
  ///
  static const chatDetailsPage = '/ChatDetailsPage';

  /// Map
  ///
  static const mapPage = '/MapPage';
}
