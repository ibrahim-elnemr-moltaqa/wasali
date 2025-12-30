import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @locale.
  ///
  /// In en, this message translates to:
  /// **'ع'**
  String get locale;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Wasali'**
  String get appName;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get unexpectedError;

  /// No description provided for @unAutherizedUserExeption.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized user. Please log in again.'**
  String get unAutherizedUserExeption;

  /// No description provided for @failToLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to load. Please try again.'**
  String get failToLoad;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get somethingWentWrong;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection available.'**
  String get noInternetConnection;

  /// No description provided for @connectionIssueTryLater.
  ///
  /// In en, this message translates to:
  /// **'There was a connection issue. Please try again later.'**
  String get connectionIssueTryLater;

  /// No description provided for @noInternetFound.
  ///
  /// In en, this message translates to:
  /// **'No internet found, check your connection'**
  String get noInternetFound;

  /// No description provided for @unAuthenticatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired, please log in again.'**
  String get unAuthenticatedMessage;

  /// No description provided for @unSupportedZone.
  ///
  /// In en, this message translates to:
  /// **'This area is currently not supported for delivery.'**
  String get unSupportedZone;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @pickImageFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Pick Image From Gallery'**
  String get pickImageFromGallery;

  /// No description provided for @pickImageFromCamera.
  ///
  /// In en, this message translates to:
  /// **'Pick Image From Camera'**
  String get pickImageFromCamera;

  /// No description provided for @pickVideoFromCamera.
  ///
  /// In en, this message translates to:
  /// **'Pick Video From Camera'**
  String get pickVideoFromCamera;

  /// No description provided for @pickVideoFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Pick Video From Gallery'**
  String get pickVideoFromGallery;

  /// No description provided for @cantOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Cannot open link, make sure it\'s valid.'**
  String get cantOpenLink;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get changeLanguage;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @continue_.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @startNow.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get startNow;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @agree.
  ///
  /// In en, this message translates to:
  /// **'Agree'**
  String get agree;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @disagree.
  ///
  /// In en, this message translates to:
  /// **'Disagree'**
  String get disagree;

  /// No description provided for @search_.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search_;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get fieldRequired;

  /// No description provided for @fieldMustNotHaveSpaces.
  ///
  /// In en, this message translates to:
  /// **'This field must not have spaces.'**
  String get fieldMustNotHaveSpaces;

  /// No description provided for @invalidIban.
  ///
  /// In en, this message translates to:
  /// **'The IBAN must contain only letters and numbers, and be between 15 and 34 characters long.'**
  String get invalidIban;

  /// No description provided for @nameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Name is too short.'**
  String get nameTooShort;

  /// No description provided for @invalidEnglishName.
  ///
  /// In en, this message translates to:
  /// **'Invalid English Name'**
  String get invalidEnglishName;

  /// No description provided for @invalidArabicName.
  ///
  /// In en, this message translates to:
  /// **'Invalid Arabic Name'**
  String get invalidArabicName;

  /// No description provided for @invalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address format.'**
  String get invalidEmailFormat;

  /// No description provided for @passwordRequirements.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long, include capital letters, at least one lowercase letter and special character.'**
  String get passwordRequirements;

  /// No description provided for @passwordConfirmValidation.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation is not same'**
  String get passwordConfirmValidation;

  /// No description provided for @urlValidateMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid URL'**
  String get urlValidateMessage;

  /// No description provided for @invalidDateFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid Date Format'**
  String get invalidDateFormat;

  /// No description provided for @dateMustBeAfter.
  ///
  /// In en, this message translates to:
  /// **'Date Must Be After'**
  String get dateMustBeAfter;

  /// No description provided for @phoneFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get phoneFieldHint;

  /// No description provided for @profileImageValidation.
  ///
  /// In en, this message translates to:
  /// **'Profile image is required'**
  String get profileImageValidation;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number invalid format.'**
  String get invalidPhoneNumber;

  /// No description provided for @searchForCountry.
  ///
  /// In en, this message translates to:
  /// **'Search for country'**
  String get searchForCountry;

  /// No description provided for @noResultFound.
  ///
  /// In en, this message translates to:
  /// **'No result found'**
  String get noResultFound;

  /// No description provided for @youMustAgreeTermsAndConditionsFirst.
  ///
  /// In en, this message translates to:
  /// **'You must agree to the terms and conditions first'**
  String get youMustAgreeTermsAndConditionsFirst;

  /// No description provided for @invalidIdentityNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid identity number'**
  String get invalidIdentityNumber;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank name'**
  String get bankName;

  /// No description provided for @enterBankName.
  ///
  /// In en, this message translates to:
  /// **'Enter bank name'**
  String get enterBankName;

  /// No description provided for @ibaneNumber.
  ///
  /// In en, this message translates to:
  /// **'Ibane number'**
  String get ibaneNumber;

  /// No description provided for @enterIbaneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter ibane number'**
  String get enterIbaneNumber;

  /// No description provided for @inCorrectPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password'**
  String get inCorrectPassword;

  /// No description provided for @onboardingHeaderOne.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the'**
  String get onboardingHeaderOne;

  /// No description provided for @onboardingHeaderOne1.
  ///
  /// In en, this message translates to:
  /// **'Balcony App'**
  String get onboardingHeaderOne1;

  /// No description provided for @onboardingSubHeaderOne.
  ///
  /// In en, this message translates to:
  /// **'Discover the best places including restaurants, cafes, and hotels, and quickly view their details.'**
  String get onboardingSubHeaderOne;

  /// No description provided for @onboardingHeaderTwo.
  ///
  /// In en, this message translates to:
  /// **'Activate your subscription and enjoy'**
  String get onboardingHeaderTwo;

  /// No description provided for @onboardingHeaderTwo2.
  ///
  /// In en, this message translates to:
  /// **'the offers'**
  String get onboardingHeaderTwo2;

  /// No description provided for @onboardingSubHeaderTwo.
  ///
  /// In en, this message translates to:
  /// **'Discover the best places including restaurants, cafes, and hotels, and quickly view their details.'**
  String get onboardingSubHeaderTwo;

  /// No description provided for @onboardingHeaderThree.
  ///
  /// In en, this message translates to:
  /// **'Book event tickets'**
  String get onboardingHeaderThree;

  /// No description provided for @onboardingHeaderThree1.
  ///
  /// In en, this message translates to:
  /// **'instantly'**
  String get onboardingHeaderThree1;

  /// No description provided for @onboardingSubHeaderThree.
  ///
  /// In en, this message translates to:
  /// **'Discover the best places including restaurants, cafes, and hotels, and quickly view their details.'**
  String get onboardingSubHeaderThree;

  /// No description provided for @selectRoleDescreption.
  ///
  /// In en, this message translates to:
  /// **'Education is a continuous journey, and we are here to be a part of it. Join us on this journey by selecting your user type to proceed and complete registration!'**
  String get selectRoleDescreption;

  /// No description provided for @selectUserRole.
  ///
  /// In en, this message translates to:
  /// **'Select User Type'**
  String get selectUserRole;

  /// No description provided for @student.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get student;

  /// No description provided for @teacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get teacher;

  /// No description provided for @pleaseSelectRoleFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select user type'**
  String get pleaseSelectRoleFirst;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'The verification code will be sent to the entered phone number'**
  String get loginPhoneHint;

  /// No description provided for @welcomeback.
  ///
  /// In en, this message translates to:
  /// **'Welcome back to'**
  String get welcomeback;

  /// No description provided for @registerNow.
  ///
  /// In en, this message translates to:
  /// **'Register now'**
  String get registerNow;

  /// No description provided for @registerWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Register now at'**
  String get registerWelcome;

  /// No description provided for @teacherLoginDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome back to the login##as a service provider'**
  String get teacherLoginDescription;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @conversations.
  ///
  /// In en, this message translates to:
  /// **'conversations'**
  String get conversations;

  /// No description provided for @orderOffers.
  ///
  /// In en, this message translates to:
  /// **'Order offers'**
  String get orderOffers;

  /// No description provided for @doYouForgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Did you forget password?'**
  String get doYouForgetPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @mainServices.
  ///
  /// In en, this message translates to:
  /// **'Main services'**
  String get mainServices;

  /// No description provided for @requestService.
  ///
  /// In en, this message translates to:
  /// **'Request service'**
  String get requestService;

  /// No description provided for @requestServiceDescription.
  ///
  /// In en, this message translates to:
  /// **'Fast request your service now'**
  String get requestServiceDescription;

  /// No description provided for @welcomeIn.
  ///
  /// In en, this message translates to:
  /// **'Welcome in!'**
  String get welcomeIn;

  /// No description provided for @areYouServiceProvider.
  ///
  /// In en, this message translates to:
  /// **'Are you a service provider?'**
  String get areYouServiceProvider;

  /// No description provided for @registerAsServiceProvider.
  ///
  /// In en, this message translates to:
  /// **'Register as service provider'**
  String get registerAsServiceProvider;

  /// No description provided for @welcomeOnApp.
  ///
  /// In en, this message translates to:
  /// **'Welcome to!'**
  String get welcomeOnApp;

  /// No description provided for @loginDescription.
  ///
  /// In en, this message translates to:
  /// **'Log in or create an account to explore the app'**
  String get loginDescription;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @bestsellerServices.
  ///
  /// In en, this message translates to:
  /// **'Bestseller services'**
  String get bestsellerServices;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget password'**
  String get forgetPassword;

  /// No description provided for @forgetPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to send##the verification code'**
  String get forgetPasswordDescription;

  /// No description provided for @verificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get verificationCode;

  /// No description provided for @codeSentTo.
  ///
  /// In en, this message translates to:
  /// **'The code was sent to the number'**
  String get codeSentTo;

  /// No description provided for @dontSendCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get dontSendCode;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @verifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify code'**
  String get verifyCode;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @enterStrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter a##strong password'**
  String get enterStrongPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @teacherRegisterWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to account creation##as a service provider'**
  String get teacherRegisterWelcome;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @enterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterEmailAddress;

  /// No description provided for @agreeFor.
  ///
  /// In en, this message translates to:
  /// **'Confirmation of '**
  String get agreeFor;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About app'**
  String get aboutApp;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @completeAccountData.
  ///
  /// In en, this message translates to:
  /// **'Complete Account Information'**
  String get completeAccountData;

  /// No description provided for @newRegister.
  ///
  /// In en, this message translates to:
  /// **'New Register'**
  String get newRegister;

  /// No description provided for @step.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get step;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get from;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @writeAge.
  ///
  /// In en, this message translates to:
  /// **'Enter your age'**
  String get writeAge;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @idNumber.
  ///
  /// In en, this message translates to:
  /// **'ID Number'**
  String get idNumber;

  /// No description provided for @enterIdNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your ID number'**
  String get enterIdNumber;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select your country'**
  String get selectCountry;

  /// No description provided for @spokenLanguages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get spokenLanguages;

  /// No description provided for @selectLanguages.
  ///
  /// In en, this message translates to:
  /// **'Select the languages you speak'**
  String get selectLanguages;

  /// No description provided for @professionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Professional Information'**
  String get professionalInformation;

  /// No description provided for @aboutYou.
  ///
  /// In en, this message translates to:
  /// **'Brief Introduction About You'**
  String get aboutYou;

  /// No description provided for @writeHere.
  ///
  /// In en, this message translates to:
  /// **'Write Message Content'**
  String get writeHere;

  /// No description provided for @institution.
  ///
  /// In en, this message translates to:
  /// **'Institution'**
  String get institution;

  /// No description provided for @school.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get school;

  /// No description provided for @university.
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get university;

  /// No description provided for @educationalStages.
  ///
  /// In en, this message translates to:
  /// **'Educational Stages'**
  String get educationalStages;

  /// No description provided for @selectStage.
  ///
  /// In en, this message translates to:
  /// **'Select Stage'**
  String get selectStage;

  /// No description provided for @studyYears.
  ///
  /// In en, this message translates to:
  /// **'Study Years'**
  String get studyYears;

  /// No description provided for @selectYear.
  ///
  /// In en, this message translates to:
  /// **'Select Study Year'**
  String get selectYear;

  /// No description provided for @subjects.
  ///
  /// In en, this message translates to:
  /// **'Subjects'**
  String get subjects;

  /// No description provided for @selectSubject.
  ///
  /// In en, this message translates to:
  /// **'Select Subject'**
  String get selectSubject;

  /// No description provided for @qualification.
  ///
  /// In en, this message translates to:
  /// **'Educational Qualification'**
  String get qualification;

  /// No description provided for @uploadQualificationImage.
  ///
  /// In en, this message translates to:
  /// **'Upload qualification image'**
  String get uploadQualificationImage;

  /// No description provided for @jobTitle.
  ///
  /// In en, this message translates to:
  /// **'Job Title'**
  String get jobTitle;

  /// No description provided for @enterJobTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your job title'**
  String get enterJobTitle;

  /// No description provided for @experienceYears.
  ///
  /// In en, this message translates to:
  /// **'Years of Experience'**
  String get experienceYears;

  /// No description provided for @enterExperienceYears.
  ///
  /// In en, this message translates to:
  /// **'Enter years of experience'**
  String get enterExperienceYears;

  /// No description provided for @experienceField.
  ///
  /// In en, this message translates to:
  /// **'Field of Experience'**
  String get experienceField;

  /// No description provided for @enterExperienceField.
  ///
  /// In en, this message translates to:
  /// **'Enter field of experience'**
  String get enterExperienceField;

  /// No description provided for @introVideo.
  ///
  /// In en, this message translates to:
  /// **'Introductory Video'**
  String get introVideo;

  /// No description provided for @uploadVideo.
  ///
  /// In en, this message translates to:
  /// **'Upload an introductory video'**
  String get uploadVideo;

  /// No description provided for @cv.
  ///
  /// In en, this message translates to:
  /// **'CV'**
  String get cv;

  /// No description provided for @uploadCv.
  ///
  /// In en, this message translates to:
  /// **'Upload your CV file'**
  String get uploadCv;

  /// No description provided for @specialization.
  ///
  /// In en, this message translates to:
  /// **'Specialization'**
  String get specialization;

  /// No description provided for @selectSpecialization.
  ///
  /// In en, this message translates to:
  /// **'Select your specialization'**
  String get selectSpecialization;

  /// No description provided for @selectSubjectAgain.
  ///
  /// In en, this message translates to:
  /// **'Select Subject'**
  String get selectSubjectAgain;

  /// No description provided for @requestSubmittedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your request has been successfully submitted to the administration'**
  String get requestSubmittedMessage;

  /// No description provided for @requestPendingMessage.
  ///
  /// In en, this message translates to:
  /// **'You cannot log in, your join request is still##under review##by the administration'**
  String get requestPendingMessage;

  /// No description provided for @otpSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'OTP sent successfully'**
  String get otpSentSuccessfully;

  /// No description provided for @enterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enterVerificationCode;

  /// No description provided for @verificationCodeLengthValidation.
  ///
  /// In en, this message translates to:
  /// **'Verification code must be 4 digits'**
  String get verificationCodeLengthValidation;

  /// No description provided for @verifyCodeSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your mobile number has been successfully verified'**
  String get verifyCodeSuccessMessage;

  /// No description provided for @emailUpdateSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your email has been successfully updated'**
  String get emailUpdateSuccessMessage;

  /// No description provided for @phoneUpdateSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your phone number has been successfully updated'**
  String get phoneUpdateSuccessMessage;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @completeProfileSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your request has been successfully submitted to the administration'**
  String get completeProfileSuccessMessage;

  /// No description provided for @passwordResetSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your password has been successfully updated'**
  String get passwordResetSuccessMessage;

  /// No description provided for @joinRequestStillInReviewMessage.
  ///
  /// In en, this message translates to:
  /// **'You cannot log in. Your membership request is still under review by the administration.'**
  String get joinRequestStillInReviewMessage;

  /// No description provided for @sendJoinRequestSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your request has been successfully sent to the administration.'**
  String get sendJoinRequestSuccessMessage;

  /// No description provided for @loginAsStudentWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome back to the login##as a student'**
  String get loginAsStudentWelcomeMessage;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @studentWelcomeRegisterMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to account creation##as a student'**
  String get studentWelcomeRegisterMessage;

  /// No description provided for @studentName.
  ///
  /// In en, this message translates to:
  /// **'Student name'**
  String get studentName;

  /// No description provided for @univeristyName.
  ///
  /// In en, this message translates to:
  /// **'Univeristy name'**
  String get univeristyName;

  /// No description provided for @writeYourUniveristyName.
  ///
  /// In en, this message translates to:
  /// **'Write your univeristy name'**
  String get writeYourUniveristyName;

  /// No description provided for @schoolName.
  ///
  /// In en, this message translates to:
  /// **'School name'**
  String get schoolName;

  /// No description provided for @enterYourSchoolName.
  ///
  /// In en, this message translates to:
  /// **'Enter your school name'**
  String get enterYourSchoolName;

  /// No description provided for @selectStageFirst.
  ///
  /// In en, this message translates to:
  /// **'Select Educational Stage First'**
  String get selectStageFirst;

  /// No description provided for @registerSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully created'**
  String get registerSuccessMessage;

  /// No description provided for @selectWhoLearning.
  ///
  /// In en, this message translates to:
  /// **'Select who##learning'**
  String get selectWhoLearning;

  /// No description provided for @videoValidation.
  ///
  /// In en, this message translates to:
  /// **'Video must be mp4'**
  String get videoValidation;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @schoolBag.
  ///
  /// In en, this message translates to:
  /// **'School bag'**
  String get schoolBag;

  /// No description provided for @table.
  ///
  /// In en, this message translates to:
  /// **'Table'**
  String get table;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get myAccount;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get myOrders;

  /// No description provided for @myFiles.
  ///
  /// In en, this message translates to:
  /// **'My files'**
  String get myFiles;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @faqs.
  ///
  /// In en, this message translates to:
  /// **'Faqs'**
  String get faqs;

  /// No description provided for @chnageLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get chnageLanguage;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @logoutMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutMessage;

  /// No description provided for @deleteAccountMessage.
  ///
  /// In en, this message translates to:
  /// **'All your data will be permanently deleted and you will not be able to recover it.'**
  String get deleteAccountMessage;

  /// No description provided for @profileUpdateSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your profile has been successfully updated'**
  String get profileUpdateSuccessMessage;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth date'**
  String get birthDate;

  /// No description provided for @birthDateHint.
  ///
  /// In en, this message translates to:
  /// **'Day/Month/Year'**
  String get birthDateHint;

  /// No description provided for @bankDataUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your bank data has been successfully updated'**
  String get bankDataUpdatedSuccess;

  /// No description provided for @currentLanguage.
  ///
  /// In en, this message translates to:
  /// **'Current language'**
  String get currentLanguage;

  /// No description provided for @changePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Change phone number'**
  String get changePhoneNumber;

  /// No description provided for @updatePassword.
  ///
  /// In en, this message translates to:
  /// **'Update password'**
  String get updatePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPassword;

  /// No description provided for @addAnotherAccount.
  ///
  /// In en, this message translates to:
  /// **'Add another account'**
  String get addAnotherAccount;

  /// No description provided for @switchAccount.
  ///
  /// In en, this message translates to:
  /// **'Switch account'**
  String get switchAccount;

  /// No description provided for @addBelowData.
  ///
  /// In en, this message translates to:
  /// **'Add below##data'**
  String get addBelowData;

  /// No description provided for @accountAddedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully added ! '**
  String get accountAddedSuccessMessage;

  /// No description provided for @selectAccount.
  ///
  /// In en, this message translates to:
  /// **'Select##account'**
  String get selectAccount;

  /// No description provided for @noAccountsFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'No accounts found'**
  String get noAccountsFoundMessage;

  /// No description provided for @bankAccountDetails.
  ///
  /// In en, this message translates to:
  /// **'Bank account details'**
  String get bankAccountDetails;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome '**
  String get welcome;

  /// No description provided for @seacrchFor.
  ///
  /// In en, this message translates to:
  /// **'Search for'**
  String get seacrchFor;

  /// No description provided for @logInFirst.
  ///
  /// In en, this message translates to:
  /// **'You must log in first'**
  String get logInFirst;

  /// No description provided for @guestMessage.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account to manage your requests easily'**
  String get guestMessage;

  /// No description provided for @yourMessageSendSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your message has been successfully sent'**
  String get yourMessageSendSuccessMessage;

  /// No description provided for @linkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link Copied!'**
  String get linkCopied;

  /// No description provided for @contactWays.
  ///
  /// In en, this message translates to:
  /// **'Contact ways'**
  String get contactWays;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact information'**
  String get contactInformation;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send message'**
  String get sendMessage;

  /// No description provided for @messageType.
  ///
  /// In en, this message translates to:
  /// **'Message type'**
  String get messageType;

  /// No description provided for @selectMessageType.
  ///
  /// In en, this message translates to:
  /// **'Select message type'**
  String get selectMessageType;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @newTitle.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newTitle;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No Data For Now'**
  String get noData;

  /// No description provided for @suggestion.
  ///
  /// In en, this message translates to:
  /// **'Suggestion'**
  String get suggestion;

  /// No description provided for @inquiry.
  ///
  /// In en, this message translates to:
  /// **'Inquiry'**
  String get inquiry;

  /// No description provided for @complaint.
  ///
  /// In en, this message translates to:
  /// **'Complaint'**
  String get complaint;

  /// No description provided for @contactUsSuccessHeader.
  ///
  /// In en, this message translates to:
  /// **'Your message has been successfully sent to the administration.'**
  String get contactUsSuccessHeader;

  /// No description provided for @contactUsSuccessSubHeader.
  ///
  /// In en, this message translates to:
  /// **'Thank you for sharing your opinion and contacting us.'**
  String get contactUsSuccessSubHeader;

  /// No description provided for @geustHint.
  ///
  /// In en, this message translates to:
  /// **'You can enjoy the app’s services by logging in.'**
  String get geustHint;

  /// No description provided for @welcomeMr.
  ///
  /// In en, this message translates to:
  /// **'Welcome Mr'**
  String get welcomeMr;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @addnew.
  ///
  /// In en, this message translates to:
  /// **'Add new'**
  String get addnew;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @acccountInformation.
  ///
  /// In en, this message translates to:
  /// **'Account information'**
  String get acccountInformation;

  /// No description provided for @staticPages.
  ///
  /// In en, this message translates to:
  /// **'Static pages'**
  String get staticPages;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account settings'**
  String get accountSettings;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @ibanInfo.
  ///
  /// In en, this message translates to:
  /// **'IBAN information'**
  String get ibanInfo;

  /// No description provided for @proffessionalInfo.
  ///
  /// In en, this message translates to:
  /// **'Professional information'**
  String get proffessionalInfo;

  /// No description provided for @onlineLectures.
  ///
  /// In en, this message translates to:
  /// **'Online lectures'**
  String get onlineLectures;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @upcommingLecturesCount.
  ///
  /// In en, this message translates to:
  /// **'Upcomming\nlectures count'**
  String get upcommingLecturesCount;

  /// No description provided for @ordersWatingDeliveryCount.
  ///
  /// In en, this message translates to:
  /// **'Orders\nwating delivery count'**
  String get ordersWatingDeliveryCount;

  /// No description provided for @lecture.
  ///
  /// In en, this message translates to:
  /// **'Lecture'**
  String get lecture;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @scheduledLecturesToday.
  ///
  /// In en, this message translates to:
  /// **'Scheduled lectures for today'**
  String get scheduledLecturesToday;

  /// No description provided for @noScheduledLecturesToday.
  ///
  /// In en, this message translates to:
  /// **'No scheduled lectures for today.'**
  String get noScheduledLecturesToday;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @noRequestsToday.
  ///
  /// In en, this message translates to:
  /// **'No requests for today.'**
  String get noRequestsToday;

  /// No description provided for @workingTime.
  ///
  /// In en, this message translates to:
  /// **'Working Times'**
  String get workingTime;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @lectureTime.
  ///
  /// In en, this message translates to:
  /// **'Lecture time'**
  String get lectureTime;

  /// No description provided for @lectureType.
  ///
  /// In en, this message translates to:
  /// **'Lecture type'**
  String get lectureType;

  /// No description provided for @joinNow.
  ///
  /// In en, this message translates to:
  /// **'Join now'**
  String get joinNow;

  /// No description provided for @requestCreationDate.
  ///
  /// In en, this message translates to:
  /// **'Request creation date'**
  String get requestCreationDate;

  /// No description provided for @deliveryDate.
  ///
  /// In en, this message translates to:
  /// **'Delivery date'**
  String get deliveryDate;

  /// No description provided for @pendingHelpRequests.
  ///
  /// In en, this message translates to:
  /// **'Help requests awaiting offers'**
  String get pendingHelpRequests;

  /// No description provided for @projectType.
  ///
  /// In en, this message translates to:
  /// **'Project type'**
  String get projectType;

  /// No description provided for @educationalQualifications.
  ///
  /// In en, this message translates to:
  /// **'Educational qualifications'**
  String get educationalQualifications;

  /// No description provided for @areYouShadowTeacher.
  ///
  /// In en, this message translates to:
  /// **'are you a shadow teacher?'**
  String get areYouShadowTeacher;

  /// No description provided for @totalProfitServiceProvider.
  ///
  /// In en, this message translates to:
  /// **'Total profit service provider'**
  String get totalProfitServiceProvider;

  /// No description provided for @hideHistory.
  ///
  /// In en, this message translates to:
  /// **'Hide history'**
  String get hideHistory;

  /// No description provided for @walletHistory.
  ///
  /// In en, this message translates to:
  /// **'Wallet history'**
  String get walletHistory;

  /// No description provided for @noWalletHistory.
  ///
  /// In en, this message translates to:
  /// **'No wallet history yet'**
  String get noWalletHistory;

  /// No description provided for @withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdraw;

  /// No description provided for @withdrawSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your withdrawal request has been successfully sent to the administration.'**
  String get withdrawSuccessMessage;

  /// No description provided for @addNewOnlineLecture.
  ///
  /// In en, this message translates to:
  /// **'Add new online lecture'**
  String get addNewOnlineLecture;

  /// No description provided for @walletChargedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Wallet charged successfully!'**
  String get walletChargedSuccess;

  /// No description provided for @walletTopUp.
  ///
  /// In en, this message translates to:
  /// **'Wallet Top-Up'**
  String get walletTopUp;

  /// No description provided for @enterTopUpAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter the amount to top up'**
  String get enterTopUpAmount;

  /// No description provided for @amountValue.
  ///
  /// In en, this message translates to:
  /// **'Amount value'**
  String get amountValue;

  /// No description provided for @enterBankDetails.
  ///
  /// In en, this message translates to:
  /// **'Please enter your bank account details'**
  String get enterBankDetails;

  /// No description provided for @aviableBalance.
  ///
  /// In en, this message translates to:
  /// **'Aviable balance'**
  String get aviableBalance;

  /// No description provided for @myWallet.
  ///
  /// In en, this message translates to:
  /// **'My wallet'**
  String get myWallet;

  /// No description provided for @paymentFailMessage.
  ///
  /// In en, this message translates to:
  /// **'Payment failed, please try again'**
  String get paymentFailMessage;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @eventsBooking.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get eventsBooking;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @mainCategories.
  ///
  /// In en, this message translates to:
  /// **'Main Category'**
  String get mainCategories;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLess;

  /// No description provided for @shopNow.
  ///
  /// In en, this message translates to:
  /// **'Shop Now'**
  String get shopNow;

  /// No description provided for @mySubscription.
  ///
  /// In en, this message translates to:
  /// **'My Subscription'**
  String get mySubscription;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareApp;

  /// No description provided for @rateApp.
  ///
  /// In en, this message translates to:
  /// **'Rate App'**
  String get rateApp;

  /// No description provided for @notificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Notifications Settings'**
  String get notificationSettings;

  /// No description provided for @languageSettings.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettings;

  /// No description provided for @enableNotificationsRequest.
  ///
  /// In en, this message translates to:
  /// **'Please enable notifications permission from app settings'**
  String get enableNotificationsRequest;

  /// No description provided for @copyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy link'**
  String get copyLink;

  /// No description provided for @gettingLocation.
  ///
  /// In en, this message translates to:
  /// **'Getting your location...'**
  String get gettingLocation;

  /// No description provided for @pleaseEnableLocation.
  ///
  /// In en, this message translates to:
  /// **'Please enable location permission'**
  String get pleaseEnableLocation;

  /// No description provided for @addressLocationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to get your address location'**
  String get addressLocationFailed;

  /// No description provided for @changePersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Change Personal Information'**
  String get changePersonalInfo;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @addComment.
  ///
  /// In en, this message translates to:
  /// **'Add Comment'**
  String get addComment;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @writeYourComment.
  ///
  /// In en, this message translates to:
  /// **'Write Your Comment'**
  String get writeYourComment;

  /// No description provided for @lowestRate.
  ///
  /// In en, this message translates to:
  /// **'Lowest rate'**
  String get lowestRate;

  /// No description provided for @branches.
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get branches;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @highestRate.
  ///
  /// In en, this message translates to:
  /// **'Highest rate'**
  String get highestRate;

  /// No description provided for @nearest.
  ///
  /// In en, this message translates to:
  /// **'Nearest to your location'**
  String get nearest;

  /// No description provided for @usernameChangedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your username has been successfully changed'**
  String get usernameChangedSuccessMessage;

  /// No description provided for @aboutApp2.
  ///
  /// In en, this message translates to:
  /// **' About App'**
  String get aboutApp2;

  /// No description provided for @noNotifiactionsYet.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotifiactionsYet;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @x.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get x;

  /// No description provided for @youtube.
  ///
  /// In en, this message translates to:
  /// **'YouTube'**
  String get youtube;

  /// No description provided for @youtubeMusic.
  ///
  /// In en, this message translates to:
  /// **'YouTube Music'**
  String get youtubeMusic;

  /// No description provided for @instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// No description provided for @tikTok.
  ///
  /// In en, this message translates to:
  /// **'TikTok'**
  String get tikTok;

  /// No description provided for @soundCloud.
  ///
  /// In en, this message translates to:
  /// **'SoundCloud'**
  String get soundCloud;

  /// No description provided for @amazonMusic.
  ///
  /// In en, this message translates to:
  /// **'Amazon Music'**
  String get amazonMusic;

  /// No description provided for @appleMusic.
  ///
  /// In en, this message translates to:
  /// **'Apple Music'**
  String get appleMusic;

  /// No description provided for @spotify.
  ///
  /// In en, this message translates to:
  /// **'Spotify'**
  String get spotify;

  /// No description provided for @pandora.
  ///
  /// In en, this message translates to:
  /// **'Pandora'**
  String get pandora;

  /// No description provided for @amazon.
  ///
  /// In en, this message translates to:
  /// **'Amazon'**
  String get amazon;

  /// No description provided for @clubhouse.
  ///
  /// In en, this message translates to:
  /// **'Clubhouse'**
  String get clubhouse;

  /// No description provided for @discord.
  ///
  /// In en, this message translates to:
  /// **'Discord'**
  String get discord;

  /// No description provided for @gitHub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get gitHub;

  /// No description provided for @gmail.
  ///
  /// In en, this message translates to:
  /// **'Gmail'**
  String get gmail;

  /// No description provided for @googleDrive.
  ///
  /// In en, this message translates to:
  /// **'Google Drive'**
  String get googleDrive;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @microsoft.
  ///
  /// In en, this message translates to:
  /// **'Microsoft'**
  String get microsoft;

  /// No description provided for @googleMeet.
  ///
  /// In en, this message translates to:
  /// **'Google Meet'**
  String get googleMeet;

  /// No description provided for @googlePlay.
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get googlePlay;

  /// No description provided for @microsoftTeams.
  ///
  /// In en, this message translates to:
  /// **'Microsoft Teams'**
  String get microsoftTeams;

  /// No description provided for @linkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedIn;

  /// No description provided for @oneDrive.
  ///
  /// In en, this message translates to:
  /// **'OneDrive'**
  String get oneDrive;

  /// No description provided for @pinterest.
  ///
  /// In en, this message translates to:
  /// **'Pinterest'**
  String get pinterest;

  /// No description provided for @reddit.
  ///
  /// In en, this message translates to:
  /// **'Reddit'**
  String get reddit;

  /// No description provided for @skype.
  ///
  /// In en, this message translates to:
  /// **'Skype'**
  String get skype;

  /// No description provided for @snapChat.
  ///
  /// In en, this message translates to:
  /// **'SnapChat'**
  String get snapChat;

  /// No description provided for @telegram.
  ///
  /// In en, this message translates to:
  /// **'Telegram'**
  String get telegram;

  /// No description provided for @threads.
  ///
  /// In en, this message translates to:
  /// **'Threads'**
  String get threads;

  /// No description provided for @uTorrent.
  ///
  /// In en, this message translates to:
  /// **'uTorrent'**
  String get uTorrent;

  /// No description provided for @whatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsApp;

  /// No description provided for @zoom.
  ///
  /// In en, this message translates to:
  /// **'Zoom'**
  String get zoom;

  /// No description provided for @outlook.
  ///
  /// In en, this message translates to:
  /// **'Outlook'**
  String get outlook;

  /// No description provided for @oneNote.
  ///
  /// In en, this message translates to:
  /// **'OneNote'**
  String get oneNote;

  /// No description provided for @excel.
  ///
  /// In en, this message translates to:
  /// **'Excel'**
  String get excel;

  /// No description provided for @word.
  ///
  /// In en, this message translates to:
  /// **'Word'**
  String get word;

  /// No description provided for @powerPoint.
  ///
  /// In en, this message translates to:
  /// **'PowerPoint'**
  String get powerPoint;

  /// No description provided for @messenger.
  ///
  /// In en, this message translates to:
  /// **'Messenger'**
  String get messenger;

  /// No description provided for @apple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get apple;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @shareAppHint.
  ///
  /// In en, this message translates to:
  /// **'You can share the app'**
  String get shareAppHint;

  /// No description provided for @via.
  ///
  /// In en, this message translates to:
  /// **'via'**
  String get via;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @becomeProvider.
  ///
  /// In en, this message translates to:
  /// **'Become a Contractor/Service Provider'**
  String get becomeProvider;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enterPhoneNumber;

  /// No description provided for @belongsToYou.
  ///
  /// In en, this message translates to:
  /// **'that belongs to you'**
  String get belongsToYou;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @nameUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Name updated successfully'**
  String get nameUpdatedSuccessfully;

  /// No description provided for @allMainCategories.
  ///
  /// In en, this message translates to:
  /// **'All Main Categories'**
  String get allMainCategories;

  /// No description provided for @subService.
  ///
  /// In en, this message translates to:
  /// **'Sub Service'**
  String get subService;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get choose;

  /// No description provided for @pleaseEnterData.
  ///
  /// In en, this message translates to:
  /// **'Please enter the following data:'**
  String get pleaseEnterData;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood (optional)'**
  String get district;

  /// No description provided for @choose_name.
  ///
  /// In en, this message translates to:
  /// **'Choose {name}'**
  String choose_name(Object name);

  /// No description provided for @selectFiles.
  ///
  /// In en, this message translates to:
  /// **'Attach photos or videos'**
  String get selectFiles;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @sendOrder.
  ///
  /// In en, this message translates to:
  /// **'Send Order'**
  String get sendOrder;

  /// No description provided for @confirmOrder.
  ///
  /// In en, this message translates to:
  /// **'Confirm Order'**
  String get confirmOrder;

  /// No description provided for @areYouSureYouWantToSendThisOrder.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to send this order?'**
  String get areYouSureYouWantToSendThisOrder;

  /// No description provided for @searchByServiceProvider.
  ///
  /// In en, this message translates to:
  /// **'Search by service provider name...'**
  String get searchByServiceProvider;

  /// No description provided for @onBoarding_title_1.
  ///
  /// In en, this message translates to:
  /// **'Activate your restaurant and start receiving orders today!'**
  String get onBoarding_title_1;

  /// No description provided for @onBoarding_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Make it easier for customers to reach you and boost your sales effortlessly with a smart dashboard and instant notifications for every incoming order.'**
  String get onBoarding_desc_1;

  /// No description provided for @onBoarding_title_2.
  ///
  /// In en, this message translates to:
  /// **'Register as a captain and start delivering and earning!'**
  String get onBoarding_title_2;

  /// No description provided for @onBoarding_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Receive delivery requests instantly and start increasing your income with ease.'**
  String get onBoarding_desc_2;

  /// No description provided for @onBoarding_title_3.
  ///
  /// In en, this message translates to:
  /// **'Order your favorite food in simple steps!'**
  String get onBoarding_title_3;

  /// No description provided for @onBoarding_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Discover hundreds of restaurants and enjoy fast delivery to your doorstep with great deals that suit your taste and budget.'**
  String get onBoarding_desc_3;

  /// No description provided for @client.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get client;

  /// No description provided for @provider.
  ///
  /// In en, this message translates to:
  /// **'Resturants or Supermarkets'**
  String get provider;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @sendOTP.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOTP;

  /// No description provided for @choose_start.
  ///
  /// In en, this message translates to:
  /// **'Choose what suits you to start the app'**
  String get choose_start;

  /// No description provided for @choose_start_description.
  ///
  /// In en, this message translates to:
  /// **'Choose what suits you to start our app and enjoy a personalized experience with services designed to meet your needs easily and flexibly.'**
  String get choose_start_description;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'We are very happy to see you again, and we hope your experience with us is always smooth and enjoyable.'**
  String get welcome_back;

  /// Message asking user to enter verification code with phone number
  ///
  /// In en, this message translates to:
  /// **'Please enter the verification code sent via SMS to the phone number {phone} to complete the verification process.'**
  String enter_verification_code(String phone);

  /// No description provided for @create_new_account.
  ///
  /// In en, this message translates to:
  /// **'Create a new account to benefit from all our services and app features designed to meet your needs and enhance your experience.'**
  String get create_new_account;

  /// No description provided for @whatsApp_number.
  ///
  /// In en, this message translates to:
  /// **'Whatsapp number'**
  String get whatsApp_number;

  /// No description provided for @enter_whatsapp_number.
  ///
  /// In en, this message translates to:
  /// **'Enter whatsapp number'**
  String get enter_whatsapp_number;

  /// No description provided for @initial_data.
  ///
  /// In en, this message translates to:
  /// **'Initial Data'**
  String get initial_data;

  /// No description provided for @bank_account_data.
  ///
  /// In en, this message translates to:
  /// **'Bank Account Information'**
  String get bank_account_data;

  /// No description provided for @vehicle_data.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Information'**
  String get vehicle_data;

  /// No description provided for @delete_image.
  ///
  /// In en, this message translates to:
  /// **'Delete Image'**
  String get delete_image;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get last_name;

  /// No description provided for @bank_account_number.
  ///
  /// In en, this message translates to:
  /// **'Bank Account Number'**
  String get bank_account_number;

  /// No description provided for @enter_bank_account_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Bank Account Number'**
  String get enter_bank_account_number;

  /// No description provided for @id_number.
  ///
  /// In en, this message translates to:
  /// **'ID Number'**
  String get id_number;

  /// No description provided for @enter_id_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Your ID Number'**
  String get enter_id_number;

  /// No description provided for @vehicle_type.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Type'**
  String get vehicle_type;

  /// No description provided for @choose_vehicle_type.
  ///
  /// In en, this message translates to:
  /// **'Choose Vehicle Type'**
  String get choose_vehicle_type;

  /// No description provided for @vehicle_plate_number.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Plate Number'**
  String get vehicle_plate_number;

  /// No description provided for @enter_vehicle_plate_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Vehicle Plate Number'**
  String get enter_vehicle_plate_number;

  /// No description provided for @vehicle_license.
  ///
  /// In en, this message translates to:
  /// **'Vehicle License'**
  String get vehicle_license;

  /// No description provided for @license_front.
  ///
  /// In en, this message translates to:
  /// **'License Front Side'**
  String get license_front;

  /// No description provided for @license_back.
  ///
  /// In en, this message translates to:
  /// **'License Back Side'**
  String get license_back;

  /// No description provided for @driving_license.
  ///
  /// In en, this message translates to:
  /// **'Driving License'**
  String get driving_license;

  /// No description provided for @bankAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Bank Account Number'**
  String get bankAccountNumber;

  /// No description provided for @enterBankAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter bank account number'**
  String get enterBankAccountNumber;

  /// No description provided for @invalidBankAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid bank account number.'**
  String get invalidBankAccountNumber;

  /// No description provided for @service_provider.
  ///
  /// In en, this message translates to:
  /// **'Service Provider'**
  String get service_provider;

  /// No description provided for @store_data.
  ///
  /// In en, this message translates to:
  /// **'Store Information'**
  String get store_data;

  /// No description provided for @store_address.
  ///
  /// In en, this message translates to:
  /// **'Store Address'**
  String get store_address;

  /// No description provided for @store_image.
  ///
  /// In en, this message translates to:
  /// **'Store Image'**
  String get store_image;

  /// No description provided for @store_name.
  ///
  /// In en, this message translates to:
  /// **'Store Name'**
  String get store_name;

  /// No description provided for @store_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Store Mobile Number'**
  String get store_mobile_number;

  /// No description provided for @store_description.
  ///
  /// In en, this message translates to:
  /// **'Store Description'**
  String get store_description;

  /// No description provided for @commercial_register.
  ///
  /// In en, this message translates to:
  /// **'Commercial Registration'**
  String get commercial_register;

  /// No description provided for @commercial_register_image.
  ///
  /// In en, this message translates to:
  /// **'Commercial Registration Image'**
  String get commercial_register_image;

  /// No description provided for @main_category.
  ///
  /// In en, this message translates to:
  /// **'Main Category'**
  String get main_category;

  /// No description provided for @choose_main_category.
  ///
  /// In en, this message translates to:
  /// **'Choose Main Category'**
  String get choose_main_category;

  /// No description provided for @sub_category.
  ///
  /// In en, this message translates to:
  /// **'Sub Category'**
  String get sub_category;

  /// No description provided for @choose_sub_category.
  ///
  /// In en, this message translates to:
  /// **'Choose Sub Category'**
  String get choose_sub_category;

  /// No description provided for @sub_categories.
  ///
  /// In en, this message translates to:
  /// **'Sub Categories'**
  String get sub_categories;

  /// No description provided for @address_details.
  ///
  /// In en, this message translates to:
  /// **'Address Details'**
  String get address_details;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @choose_region.
  ///
  /// In en, this message translates to:
  /// **'Choose Region'**
  String get choose_region;

  /// No description provided for @choose_city.
  ///
  /// In en, this message translates to:
  /// **'Choose City'**
  String get choose_city;

  /// No description provided for @your_location_on_map.
  ///
  /// In en, this message translates to:
  /// **'Your Location on the Map'**
  String get your_location_on_map;

  /// No description provided for @confirm_address.
  ///
  /// In en, this message translates to:
  /// **'Confirm Address'**
  String get confirm_address;

  /// No description provided for @search_street_or_area.
  ///
  /// In en, this message translates to:
  /// **'Search for a street name or area'**
  String get search_street_or_area;

  /// No description provided for @request_sent_to_admin.
  ///
  /// In en, this message translates to:
  /// **'Your request has been sent to the administration.'**
  String get request_sent_to_admin;

  /// No description provided for @activation_sms_notice.
  ///
  /// In en, this message translates to:
  /// **'You will receive an SMS soon confirming your account activation.'**
  String get activation_sms_notice;

  /// No description provided for @failedToGetLocationDetails.
  ///
  /// In en, this message translates to:
  /// **'Failed to get location details'**
  String get failedToGetLocationDetails;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @confirmAddress.
  ///
  /// In en, this message translates to:
  /// **'Confirm Address'**
  String get confirmAddress;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get selectLocation;

  /// No description provided for @featuredOffers.
  ///
  /// In en, this message translates to:
  /// **'Featured Offers'**
  String get featuredOffers;

  /// No description provided for @deliveryTo.
  ///
  /// In en, this message translates to:
  /// **'Delivery to'**
  String get deliveryTo;

  /// No description provided for @opened.
  ///
  /// In en, this message translates to:
  /// **'Opened'**
  String get opened;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @storeStatus.
  ///
  /// In en, this message translates to:
  /// **'Store status'**
  String get storeStatus;

  /// No description provided for @topRated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get topRated;

  /// No description provided for @closestMe.
  ///
  /// In en, this message translates to:
  /// **'Closest me'**
  String get closestMe;

  /// No description provided for @supermarketName.
  ///
  /// In en, this message translates to:
  /// **'Supermarket name'**
  String get supermarketName;

  /// No description provided for @sizes.
  ///
  /// In en, this message translates to:
  /// **'Sizes'**
  String get sizes;

  /// No description provided for @receive_orders.
  ///
  /// In en, this message translates to:
  /// **'Receive Orders'**
  String get receive_orders;

  /// No description provided for @new_orders.
  ///
  /// In en, this message translates to:
  /// **'New Orders'**
  String get new_orders;

  /// No description provided for @pickup_type.
  ///
  /// In en, this message translates to:
  /// **'Pickup Type'**
  String get pickup_type;

  /// No description provided for @customer_name.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customer_name;

  /// No description provided for @in_preparation.
  ///
  /// In en, this message translates to:
  /// **'In Preparation'**
  String get in_preparation;

  /// No description provided for @stop_receiving_today_question.
  ///
  /// In en, this message translates to:
  /// **'Stop receiving orders today?'**
  String get stop_receiving_today_question;

  /// No description provided for @stop_receiving_today_description.
  ///
  /// In en, this message translates to:
  /// **'Customers won\'t be able to send new orders today until you enable receiving again.'**
  String get stop_receiving_today_description;

  /// No description provided for @no_new_orders.
  ///
  /// In en, this message translates to:
  /// **'No new orders have been received yet!'**
  String get no_new_orders;

  /// No description provided for @orders_will_appear.
  ///
  /// In en, this message translates to:
  /// **'Your orders will appear here as soon as you receive a new one.'**
  String get orders_will_appear;

  /// No description provided for @no_subscription.
  ///
  /// In en, this message translates to:
  /// **'You have not subscribed to any plan yet!'**
  String get no_subscription;

  /// No description provided for @start_subscription_to_add_products.
  ///
  /// In en, this message translates to:
  /// **'Start by subscribing to one of the plans to add your first products.'**
  String get start_subscription_to_add_products;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// No description provided for @start_adding_products.
  ///
  /// In en, this message translates to:
  /// **'Start adding your first products and enjoy selling!'**
  String get start_adding_products;

  /// No description provided for @start_your_journey.
  ///
  /// In en, this message translates to:
  /// **'Begin your journey now and add your first products to display them to customers.'**
  String get start_your_journey;

  /// No description provided for @add_first_product.
  ///
  /// In en, this message translates to:
  /// **'Add Your First Product'**
  String get add_first_product;

  /// No description provided for @your_current_location.
  ///
  /// In en, this message translates to:
  /// **'Your Current Location'**
  String get your_current_location;

  /// No description provided for @cannot_detect_location.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t detect your current location!'**
  String get cannot_detect_location;

  /// No description provided for @enable_location_service.
  ///
  /// In en, this message translates to:
  /// **'Make sure location service is enabled for accurate detection.'**
  String get enable_location_service;

  /// No description provided for @client_name.
  ///
  /// In en, this message translates to:
  /// **'Client Name'**
  String get client_name;

  /// No description provided for @customerSupport.
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get customerSupport;

  /// No description provided for @generalStatistics.
  ///
  /// In en, this message translates to:
  /// **'General Statistics'**
  String get generalStatistics;

  /// No description provided for @previousOrders.
  ///
  /// In en, this message translates to:
  /// **'Previous Orders'**
  String get previousOrders;

  /// No description provided for @deliveryAddresses.
  ///
  /// In en, this message translates to:
  /// **'Delivery Addresses'**
  String get deliveryAddresses;

  /// No description provided for @selectDeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Select Delivery Address'**
  String get selectDeliveryAddress;

  /// No description provided for @service_provider_data.
  ///
  /// In en, this message translates to:
  /// **' Service Provider Information'**
  String get service_provider_data;

  /// No description provided for @store_general_settings.
  ///
  /// In en, this message translates to:
  /// **'Store General Settings'**
  String get store_general_settings;

  /// No description provided for @manage_store.
  ///
  /// In en, this message translates to:
  /// **'Manage Store'**
  String get manage_store;

  /// No description provided for @working_days.
  ///
  /// In en, this message translates to:
  /// **'Working Days'**
  String get working_days;

  /// No description provided for @financial_reports.
  ///
  /// In en, this message translates to:
  /// **'Financial Reports'**
  String get financial_reports;

  /// No description provided for @sizeManagement.
  ///
  /// In en, this message translates to:
  /// **'Size Management'**
  String get sizeManagement;

  /// No description provided for @sectionsManagement.
  ///
  /// In en, this message translates to:
  /// **'Sections Management'**
  String get sectionsManagement;

  /// No description provided for @productsManagement.
  ///
  /// In en, this message translates to:
  /// **'Products Management'**
  String get productsManagement;

  /// No description provided for @add_new_size.
  ///
  /// In en, this message translates to:
  /// **'Add New Size'**
  String get add_new_size;

  /// No description provided for @size_name.
  ///
  /// In en, this message translates to:
  /// **'Size Name'**
  String get size_name;

  /// No description provided for @select_size.
  ///
  /// In en, this message translates to:
  /// **'Select Size'**
  String get select_size;

  /// No description provided for @enter_size_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Size Name'**
  String get enter_size_name;

  /// No description provided for @section_name.
  ///
  /// In en, this message translates to:
  /// **'Section Name'**
  String get section_name;

  /// No description provided for @select_section.
  ///
  /// In en, this message translates to:
  /// **'Select Section'**
  String get select_section;

  /// No description provided for @add_new_section.
  ///
  /// In en, this message translates to:
  /// **'Add New Section'**
  String get add_new_section;

  /// No description provided for @section.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get section;

  /// No description provided for @enter_section_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Section Name'**
  String get enter_section_name;

  /// No description provided for @product_name.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get product_name;

  /// No description provided for @add_new_product.
  ///
  /// In en, this message translates to:
  /// **'Add New Product'**
  String get add_new_product;

  /// No description provided for @select_product.
  ///
  /// In en, this message translates to:
  /// **'Select Product'**
  String get select_product;

  /// No description provided for @enter_product_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Product Name'**
  String get enter_product_name;

  /// No description provided for @product_description.
  ///
  /// In en, this message translates to:
  /// **'Product Description'**
  String get product_description;

  /// No description provided for @product_price.
  ///
  /// In en, this message translates to:
  /// **'Product Price'**
  String get product_price;

  /// No description provided for @enter_product_price.
  ///
  /// In en, this message translates to:
  /// **'Enter Product Price'**
  String get enter_product_price;

  /// No description provided for @product_image.
  ///
  /// In en, this message translates to:
  /// **'Product Image'**
  String get product_image;

  /// No description provided for @additional_image.
  ///
  /// In en, this message translates to:
  /// **'Additional Image'**
  String get additional_image;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @select_day.
  ///
  /// In en, this message translates to:
  /// **'Select day'**
  String get select_day;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @add_another_day.
  ///
  /// In en, this message translates to:
  /// **'Add Another Day'**
  String get add_another_day;

  /// No description provided for @start_subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscript to a plan now'**
  String get start_subscription;

  /// No description provided for @start_subscription_description.
  ///
  /// In en, this message translates to:
  /// **'Start by subscribing to one of the plans to add your first products and enjoy selling!'**
  String get start_subscription_description;

  /// No description provided for @subscription_duration.
  ///
  /// In en, this message translates to:
  /// **'Subscription Duration'**
  String get subscription_duration;

  /// No description provided for @subscription_price.
  ///
  /// In en, this message translates to:
  /// **'Subscription Price'**
  String get subscription_price;

  /// No description provided for @subscription_start_date.
  ///
  /// In en, this message translates to:
  /// **'Subscription Start Date'**
  String get subscription_start_date;

  /// No description provided for @subscription_end_date.
  ///
  /// In en, this message translates to:
  /// **'Subscription End Date'**
  String get subscription_end_date;

  /// No description provided for @new_phone_number.
  ///
  /// In en, this message translates to:
  /// **'New Phone Number'**
  String get new_phone_number;

  /// No description provided for @general_store_settings.
  ///
  /// In en, this message translates to:
  /// **'General Store Settings'**
  String get general_store_settings;

  /// No description provided for @managementCommission.
  ///
  /// In en, this message translates to:
  /// **'Management commission'**
  String get managementCommission;

  /// No description provided for @packages.
  ///
  /// In en, this message translates to:
  /// **'Packages'**
  String get packages;

  /// No description provided for @packageDuration.
  ///
  /// In en, this message translates to:
  /// **'Package Duration'**
  String get packageDuration;

  /// No description provided for @subscribeNow.
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get subscribeNow;

  /// No description provided for @packageDetails.
  ///
  /// In en, this message translates to:
  /// **'Package Details'**
  String get packageDetails;

  /// No description provided for @renewSubscription.
  ///
  /// In en, this message translates to:
  /// **'Renew Subscription'**
  String get renewSubscription;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @packagePrice.
  ///
  /// In en, this message translates to:
  /// **'Package Price'**
  String get packagePrice;

  /// No description provided for @appCommission.
  ///
  /// In en, this message translates to:
  /// **'App Commission'**
  String get appCommission;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @payPackageData.
  ///
  /// In en, this message translates to:
  /// **'Pay Package Data'**
  String get payPackageData;

  /// No description provided for @searchForProduct.
  ///
  /// In en, this message translates to:
  /// **'Search for product'**
  String get searchForProduct;

  /// No description provided for @recentlySearched.
  ///
  /// In en, this message translates to:
  /// **'Recently Searched'**
  String get recentlySearched;

  /// No description provided for @mostSearched.
  ///
  /// In en, this message translates to:
  /// **'Most Searched'**
  String get mostSearched;

  /// No description provided for @showMoreRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Show more restaurants'**
  String get showMoreRestaurants;

  /// No description provided for @showMoreSupermarkets.
  ///
  /// In en, this message translates to:
  /// **'Show more supermarkets'**
  String get showMoreSupermarkets;

  /// No description provided for @restaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @supermarkets.
  ///
  /// In en, this message translates to:
  /// **'Supermarkets'**
  String get supermarkets;

  /// No description provided for @noVendorsInThisCategory.
  ///
  /// In en, this message translates to:
  /// **'There are no vendors in this category at the moment.'**
  String get noVendorsInThisCategory;

  /// No description provided for @noVendorsInThisCategoryWorkingOnMore.
  ///
  /// In en, this message translates to:
  /// **'There are no vendors in this category at the moment, but we\'re working on adding more soon.'**
  String get noVendorsInThisCategoryWorkingOnMore;

  /// No description provided for @loadErrorTryAgain.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading, please try again.'**
  String get loadErrorTryAgain;

  /// No description provided for @errorWorkingOnFix.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again. We\'re working on fixing the issue.'**
  String get errorWorkingOnFix;

  /// No description provided for @stayTunedOffersShort.
  ///
  /// In en, this message translates to:
  /// **'Stay tuned for our upcoming offers!'**
  String get stayTunedOffersShort;

  /// No description provided for @stayTunedOffersFollowUs.
  ///
  /// In en, this message translates to:
  /// **'Stay tuned for our upcoming offers! Follow us to stay updated so you don\'t miss what\'s new.'**
  String get stayTunedOffersFollowUs;

  /// No description provided for @noSearchResults.
  ///
  /// In en, this message translates to:
  /// **'No search results'**
  String get noSearchResults;

  /// No description provided for @noSearchResultsCheckSpelling.
  ///
  /// In en, this message translates to:
  /// **'No search results found, please check your spelling and try again.'**
  String get noSearchResultsCheckSpelling;

  /// No description provided for @yourWorkingHoursAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your working hours have been added successfully.'**
  String get yourWorkingHoursAddedSuccessfully;

  /// No description provided for @yourWorkingHoursUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your working hours have been updated successfully.'**
  String get yourWorkingHoursUpdatedSuccessfully;

  /// No description provided for @yourWorkingHoursDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your working hours have been deleted successfully.'**
  String get yourWorkingHoursDeletedSuccessfully;

  /// No description provided for @rest.
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get rest;

  /// No description provided for @dayToEndSubscription.
  ///
  /// In en, this message translates to:
  /// **'Day to end subscription'**
  String get dayToEndSubscription;

  /// No description provided for @wantToLogoutQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you want to log out?'**
  String get wantToLogoutQuestion;

  /// No description provided for @youCanAlwaysComeBackLoginLater.
  ///
  /// In en, this message translates to:
  /// **'You can always come back and sign in later.'**
  String get youCanAlwaysComeBackLoginLater;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @wantToDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete the account?'**
  String get wantToDeleteAccount;

  /// No description provided for @deleteAccountPermanentWarning.
  ///
  /// In en, this message translates to:
  /// **'All your data will be permanently deleted and cannot be recovered.'**
  String get deleteAccountPermanentWarning;

  /// No description provided for @invalidVehiclePlateNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicle plate number must be maximum 13 characters long.'**
  String get invalidVehiclePlateNumber;

  /// No description provided for @requestEdit.
  ///
  /// In en, this message translates to:
  /// **'Request Edit'**
  String get requestEdit;

  /// No description provided for @socialMedia.
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get socialMedia;

  /// No description provided for @technicalSupport.
  ///
  /// In en, this message translates to:
  /// **'Technical Support'**
  String get technicalSupport;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
