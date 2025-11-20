import '../buttons/app_button.dart';
import '../overlay/show_dialog.dart';
import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../overlay/show_modal_bottom_sheet.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  final bool showConfirmationButton;
  const ChangeLanguageBottomSheet._({this.showConfirmationButton = false});

  @override
  State<ChangeLanguageBottomSheet> createState() =>
      _ChangeLanguageBottomSheetState();

  static void show(BuildContext context) async {
    return await showAppModalBottomSheet(
      child: const ChangeLanguageBottomSheet._(),
      context: context,
    );
  }

  static void showAsDialog(
      BuildContext context, bool showConfirmationButton) async {
    return await showAppDialog(
      context: context,
      child: ChangeLanguageBottomSheet._(
        showConfirmationButton: showConfirmationButton,
      ),
    );
  }
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  AppLanguageType currentLang = AppLanguageType.en;

  AppLanguageType get savedLanguage =>
      AppLanguageCubit.of(context).state.langCode;

  @override
  void initState() {
    currentLang = savedLanguage;
    super.initState();
  }

  void _onLanguageChange(AppLanguageType? selectedLang) {
    currentLang = (selectedLang ?? AppLanguageType.en);
    if (!widget.showConfirmationButton) {
      _onSaveLanguage();
    }
    setState(() {});
  }

  void _onSaveLanguage() async {
    if (savedLanguage != currentLang) {
      await AppLanguageCubit.of(context).changeLanguage(currentLang);
      if (mounted) {
        AppAuthenticationBloc.of(context).add(AuthRestartEvent());
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appLocalizer.changeLanguage,
          style: TextStyles.bold16,
        ),
        const SizedBox(height: 24),
        _Tile(
          isSeleted: currentLang == AppLanguageType.ar,
          onTap: () => _onLanguageChange(AppLanguageType.ar),
          title: "اللغة العربية",
        ),
        const SizedBox(height: Dimensions.p12),
        _Tile(
          isSeleted: currentLang == AppLanguageType.en,
          onTap: () => _onLanguageChange(AppLanguageType.en),
          title: "English",
        ),
        const SizedBox(height: 16),
        if (widget.showConfirmationButton)
          AppButton(text: appLocalizer.apply, onPressed: _onSaveLanguage),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.isSeleted,
    required this.onTap,
    required this.title,
  });
  final bool isSeleted;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      selected: isSeleted,
      title: Text(title),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: AppColors.borderColor, width: .8),
      ),
      trailing: isSeleted
          ? Radio(
              value: true,
              groupValue: true,
              onChanged: (value) {},
            )
          : null,
    );
  }
}
