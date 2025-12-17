import '../../../src/shared/more/about_us/about_us_page.dart';
import '../../../src/shared/more/settings/settings_page.dart';

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

  /// CLIENT
  ///
  static const clientRegister = '/ClientRegisterPage';
  static const allProvidersPage = '/allProvidersPage';
  static const providerPage = '/providerPage';
  static const clientEditProfile = '/ClientEditProfilePage';

  /// Provider
  ///
  static const providerRegisterPage = '/ProviderRegisterPage';
  static const providerEditProfile = '/ProviderEditProfilePage';
  static const storeManagementPage = '/storeManagementPage';
  static const generalStoreSettingsPage = '/generalStoreSettingsPage';
  static const addNewProductPage = '/AddNewProductPage';
  static const workingTimePage = '/WorkingTimePage';
  static const packagesPage = '/PackagesPage';
  static const packageDetailsPage = '/PackageDetailsPage';

  /// Delivery
  ///
  static const deliveryRegisterPage = '/DeliveryRegisterPage';
  static const deliveryEditProfilePage = '/DeliveryEditProfilePage';
  static const deliveryUpdateBankDataPage = '/DeliveryUpdateBankDataPage';
  static const deliveryUpdateVehicleDataPage = '/deliveryUpdateVehicleDataPage';

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
