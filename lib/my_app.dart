import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wasli/src/shared/common/presentation/choose_role/choose_role_page.dart';
import 'package:wasli/src/shared/common/presentation/main_page/presentation/main_page.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/onboarding_page.dart';

import '../../core/base/localization/l10n/app_localizations.dart';
import '../../core/di/di.dart';
import 'core/config/router/app_routes_generator.dart';
import 'core/core.dart';
import 'src/shared/auth/presentation/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppLanguageCubit()..init()),
        BlocProvider(
            create: (context) =>
                AppAuthenticationBloc()..add(AppStartedEvent())),
      ],
      child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (FocusManager.instance.primaryFocus?.hasPrimaryFocus == true) {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              }
            },
            child: ResponsiveBreakpoints(
              breakpoints: const [
                Breakpoint(start: 0, end: 450, name: MOBILE),
                Breakpoint(start: 451, end: 800, name: TABLET),
                Breakpoint(start: 801, end: 1920, name: DESKTOP),
                Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
              child: MaterialApp(
                key: ValueKey(state.langCode.value),
                title: appLocalizer.appName,
                navigatorKey: appNavigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: state.langCode.local,
                // themeMode: ThemeMode.light,
                theme: AppColors.theme,
                // darkTheme: const DarkTheme().theme,
                builder: (context, child) {
                  injector<LocalizationContainer>().setLocalizer(context);
                  return Overlay(
                    initialEntries: [
                      OverlayEntry(
                          builder: (context) => AppScaledBox(
                                child: child ?? const SizedBox(),
                              ))
                    ],
                  );
                },
                home: const BuilderScreen(),
                onGenerateRoute: AppRoutesGenerator.generateRoute,
                onUnknownRoute: AppRoutesGenerator.errorRoute,
              ),
            ),
          );
        },
      ),
    );
  }
}

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAuthenticationBloc, AppAuthenticationState>(
      builder: (context, state) {
        final Widget root;
        if (state is AuthUnauthenticated) {
          root = const OnboardingPage();
        } else if (state is ChooseRolePageState) {
          root = const ChooseRolePage();
        } else if (state is AuthLogInPageState || state is AuthLogOutState) {
          root = const LoginPage();
        } else if (state is AuthAuthenticatedState || state is GuestState) {
          root = const MainPage();
        } else {
          root = const SizedBox.shrink();
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          key: ValueKey(state.hashCode),
          child: Container(
            color: Colors.white,
            key: ValueKey(state.hashCode),
            child: root,
            // child: const MainAuthPage(),
          ),
        );
      },
    );
  }
}
