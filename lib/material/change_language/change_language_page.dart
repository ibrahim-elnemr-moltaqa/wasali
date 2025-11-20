import 'package:flutter/material.dart';
import '../../core/config/theme/app_theme.dart';
import '../../core/core.dart';
import '../app_radio_tile.dart';
import '../auth_states/logged_user_checker_widget.dart';
import '../buttons/app_button.dart';
import '../media/app_image.dart';
import '../media/svg_icon.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  AppLanguageType currentLang = AppLanguageType.en;

  AppLanguageType get savedLanguage =>
      AppLanguageCubit.of(context).state.langCode;

  @override
  void initState() {
    currentLang = savedLanguage;
    super.initState();
  }

  void _onLanguageChange(AppLanguageType? selectedLang) {
    setState(() {
      currentLang = (selectedLang ?? AppLanguageType.en);
    });
  }

  void _onSaveLanguage() async {
    if (savedLanguage != currentLang) {
      await AppLanguageCubit.of(context).changeLanguage(currentLang);
      if (mounted) {
        final bool isGuestState =
            AppAuthenticationBloc.of(context).state is GuestState;
        if (isGuestState) {
          AppAuthenticationBloc.of(context).add(GuestEvent());
        } else {
          AppAuthenticationBloc.of(context).add(AuthRestartEvent());
        }
      }
    }
    if (mounted) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoggedUserCheckerWidget(
      loggedBuilder: (user) => Scaffold(
              appBar: AppBar(
                title: Text(appLocalizer.changeLanguage),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      spacing: 4,
                      children: [
                        AppSvgIcon(path: AppIcons.languageIc),
                        Expanded(
                          child: Text(
                            appLocalizer.currentLanguage,
                            style: TextStyles.regular14
                                .copyWith(color: AppColors.text),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    _Tile(
                      isSeleted: currentLang == AppLanguageType.ar,
                      icon: AppImages.saudiFlag,
                      onTap: () => _onLanguageChange(AppLanguageType.ar),
                      title: "اللغة العربية",
                    ),
                    const SizedBox(height: Dimensions.p12),
                    _Tile(
                      isSeleted: currentLang == AppLanguageType.en,
                      icon: AppImages.americaFlag,
                      onTap: () => _onLanguageChange(AppLanguageType.en),
                      title: "English",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .4),
                    AppButton(
                        text: appLocalizer.save, onPressed: _onSaveLanguage),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            )
         
         
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.isSeleted,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final bool isSeleted;
  final VoidCallback onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSeleted
              ? getThemeColor(
                  darkColor: AppColors.primary.withAlpha(65),
                  lightColor: AppColors.primary50,
                )
              : AppColors.canvasBackgroundColor,
          border: isSeleted
              ? Border.all(color: AppColors.borderColor, width: 0.8)
              : Border.all(color: AppColors.greyColor, width: 0.8),
        ),
        child: Row(
          spacing: 4,
          children: [
            AppImage(
              path: icon,
            ),
            Expanded(
                child: Text(
              title,
              style: TextStyles.regular16.copyWith(
                  color: isSeleted ? AppColors.primary : AppColors.text),
            )),
            AppRadioWidget(isSelected: isSeleted),
          ],
        ),
      ),
    );
  }
}
