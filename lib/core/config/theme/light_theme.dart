import 'package:flutter/material.dart';
import 'app_theme.dart';
import '../../core.dart';

class LightTheme extends AppTheme {
  const LightTheme();

  @override
  String get name => "light";

  @override
  ThemeMode get themeMode => ThemeMode.light;

  @override
  // Color get backgroundColor => const Color.fromARGB(255, 255, 250, 250);
  Color get backgroundColor => const Color(0xFFFEFDFA);

  @override
  Color get backgroundColor2 => const Color.fromARGB(255, 249, 249, 249);

  @override
  Color get canvasBackgroundColor => Colors.white;

  @override
  Color get cardColor => Colors.white;

  @override
  Color get card2Color => const Color(0xffF5F5F5);

  @override
  Color get tileColor => const Color(0xffFAFAFA);

  @override
  Color get tileColorTeacher => Colors.white;

  @override
  Color get hintColor => const Color(0xffA5A5A5);

  @override
  Color get text => blue500;

  @override
  Color get text1 => const Color(0xff575575);

  @override
  Color get text2 => const Color(0xff666666);

  @override
  Color get textInverted => Colors.white;

  @override
  Color get text3 => const Color(0xff565656);

  @override
  ThemeData get theme => ThemeData(
        fontFamily: fontFamily,
        brightness: Brightness.light,
        scaffoldBackgroundColor: backgroundColor,
        disabledColor: primary50,
        unselectedWidgetColor: primary50,
        canvasColor: Colors.white,
        dividerColor: dividerColor,
        dividerTheme: DividerThemeData(
          color: dividerColor,
          thickness: .8,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primary,
          selectionColor: secondary100,
          selectionHandleColor: secondary100,
        ),
        textTheme: ThemeData.light().primaryTextTheme.apply(
              bodyColor: text,
              displayColor: text,
              fontFamily: fontFamily,
            ),
        cardTheme: CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
        ),
        tooltipTheme: TooltipThemeData(
          triggerMode: TooltipTriggerMode.tap,
          padding: const EdgeInsets.all(4),
          textStyle: TextStyles.regular10,
          textAlign: TextAlign.center,
          decoration: BoxDecoration(
            color: const Color(0xffE3F3E4),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        dialogTheme: DialogThemeData(
          insetPadding: const EdgeInsets.all(20),
          backgroundColor: canvasBackgroundColor,
          surfaceTintColor: canvasBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          surfaceTintColor: canvasBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          prefixIconColor: hintColor,
          suffixIconColor: hintColor,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 40, minHeight: 46),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 40, minHeight: 46),
          constraints: const BoxConstraints(minHeight: 44),
          hintStyle: TextStyles.regular12.copyWith(
            color: hintColor,
          ),
          labelStyle: TextStyles.regular14.copyWith(color: text),
          errorStyle: TextStyles.regular11.copyWith(color: error),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: disableBorderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: primary,
            ),
          ),
          fillColor: canvasBackgroundColor,
          filled: true,
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: error,
            ),
          ),
          // errorMaxLines: 1,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: TextStyles.regular14,
        ),
        checkboxTheme: CheckboxThemeData(
            visualDensity: VisualDensity.compact,
            checkColor: WidgetStateProperty.all(Colors.white),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(
              color: secondary600,
            )),
        colorScheme: ColorScheme(
          error: error,
          onError: error,
          primary: primary,
          brightness: Brightness.light,
          onPrimary: primary,
          secondary: primary,
          onSecondary: primary,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        cardColor: cardColor,
        appBarTheme: AppBarTheme(
          titleSpacing: 0,
          backgroundColor: canvasBackgroundColor,
          titleTextStyle: TextStyles.regular17.copyWith(color: text),
          elevation: .2,
          surfaceTintColor: canvasBackgroundColor,
        ),
        actionIconTheme: const ActionIconThemeData(
            // backButtonIconBuilder: (context) {
            //   return AppSvgIcon(
            //     path: 'assets/icons/arrow_right_ic.svg',
            //     isReversed: getLocaleTypeEnum == AppLanguageEnum.en,
            //   );
            // },
            ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            alignment: Alignment.center,
            minimumSize: WidgetStateProperty.all(const Size.fromHeight(50)),
            side: WidgetStateProperty.resolveWith<BorderSide>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide(color: disableBorderColor);
                }
                return BorderSide(color: primary600);
              },
            ),
            surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
            shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            foregroundColor: WidgetStateProperty.all(Colors.transparent),
            textStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return TextStyles.medium16
                      .copyWith(color: disableBorderColor);
                }
                return TextStyles.medium16.copyWith(color: primary600);
              },
            ),
            elevation: WidgetStateProperty.all(0),
            padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          ),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(primary),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: canvasBackgroundColor,
          surfaceTintColor: canvasBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 10,
        ),
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textColor: const Color(0xff202020),
          minTileHeight: 54,
          // selectedColor: const Color(0xff202020),
          titleTextStyle: TextStyles.medium14,
          subtitleTextStyle: TextStyles.regular14.copyWith(color: text1),
          // selectedTileColor: const Color(0xffFBF5FE),
          // tileColor: const Color(0xffF5F5F5),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        ),
        radioTheme: RadioThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return disableBorderColor;
              }
              return AppColors.primary;
            },
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: AppColors.primary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),

            foregroundColor: Colors.white,
            textStyle: TextStyles.medium16.copyWith(color: Colors.white),
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
            cancelButtonStyle: OutlinedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: TextStyles.medium14,
            ),
            confirmButtonStyle: FilledButton.styleFrom(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: TextStyles.semiBold14,
            ),
            backgroundColor: canvasBackgroundColor,
            surfaceTintColor: canvasBackgroundColor,
            dividerColor: dividerColor,
            shadowColor: Colors.transparent,
            yearStyle: TextStyles.bold15,
            dayStyle: TextStyles.medium14,
            elevation: .4,
            yearBackgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return primary50;
                }
                return null;
              },
            ),
            todayBackgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return primary50;
                }
                return null;
              },
            ),
            dayBackgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return primary50;
                }
                return null;
              },
            ),
            weekdayStyle: TextStyles.bold16,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primary,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(6),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            // backgroundColor: tileColor,
          ),
        ),
      );
}
