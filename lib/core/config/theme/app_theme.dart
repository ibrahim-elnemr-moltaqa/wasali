import 'package:flutter/material.dart';
import '../../blocs/theme_notifier/theme_notifier.dart';
import '../../core.dart';

Color getThemeColor({Color? lightColor, Color? darkColor}) {
  switch (ThemeNotifier.instance.themeMode) {
    case ThemeMode.system:
    case ThemeMode.light:
      return lightColor ?? Colors.transparent;
    case ThemeMode.dark:
      return darkColor ?? Colors.transparent;
  }
}

abstract class AppTheme {
  const AppTheme();
  abstract final String name;
  abstract final ThemeMode themeMode;
  abstract final ThemeData theme;

  /// Used Commonly for student
  abstract final Color backgroundColor;
  abstract final Color textInverted;

  /// Used Commonly for teacher
  abstract final Color backgroundColor2;
  abstract final Color canvasBackgroundColor;
  abstract final Color cardColor;
  abstract final Color card2Color;
  abstract final Color tileColor;

  abstract final Color text;
  abstract final Color text1;
  abstract final Color text2;
  abstract final Color text3;
  abstract final Color hintColor;
  abstract final Color tileColorTeacher;

  final Color greyColor = const Color(0xffA3A3A3);
  final Color grey2Color = const Color(0xff666666);
  final Color borderColor = const Color(0xffF0F0F0);
  final Color disableBorderColor = const Color(0xffF0F0F0);
  final Color disableindicatorColor = const Color(0xffF2F2F2);
  final Color textInputField = const Color(0xff999999);
  final Color lightTextInputField = const Color(0xffB3B3B3);
  final Color black = Colors.black;

  final BoxShadow boxShadow = const BoxShadow(
    color: Colors.black12,
    blurRadius: 12,
    offset: Offset(-2, 2),
  );

  final BoxShadow boxShadow2 = const BoxShadow(
    color: Colors.black12,
    blurRadius: 4,
    offset: Offset(0, 1),
  );

  final String fontFamily = AppFonts.almaraia;
  final Color dividerColor = const Color(0xffE6E6EA);
  final Color iconBg = const Color(0xffF6FFFF);

  /// App Const Colors
  ///
  Color get primary => primary500;
  final Color primary50 = const Color(0xffFFFAE5);
  final Color primary100 = const Color(0xffFFF5CC);
  final Color primary200 = const Color(0xffFFEB99);
  final Color primary300 = const Color(0xffFFE066);
  final Color primary400 = const Color(0xffFFD633);
  final Color primary500 = const Color(0xffFFD21F);
  final Color primary600 = const Color(0xffCCA300);
  final Color primary700 = const Color(0xff997A00);
  final Color primary800 = const Color(0xff665200);
  final Color primary900 = const Color(0xff332900);
  final Color primary950 = const Color(0xff1A1400);

  Color get secondary => secondary500;
  final Color secondary50 = const Color(0xffFFF5E5);
  final Color secondary100 = const Color(0xffFFEBCC);
  final Color secondary200 = const Color(0xffFFD699);
  final Color secondary300 = const Color(0xffFFC266);
  final Color secondary400 = const Color(0xffFFAD33);
  final Color secondary500 = const Color(0xff7A4900);
  final Color secondary600 = const Color(0xffCC7A00);
  final Color secondary700 = const Color(0xff995C00);
  final Color secondary800 = const Color(0xff663D00);
  final Color secondary900 = const Color(0xff331F00);
  final Color secondary950 = const Color(0xff1A0F00);

  Color get blue => blue600;
  final Color blue50 = const Color(0xffE6E6EA);
  final Color blue100 = const Color(0xffB1B1BF);
  final Color blue200 = const Color(0xff8C8BA0);
  final Color blue300 = const Color(0xff575575);
  final Color blue400 = const Color(0xff36355A);
  final Color blue500 = const Color(0xff040231);
  final Color blue600 = const Color(0xff04022D);
  final Color blue700 = const Color(0xff030123);
  final Color blue800 = const Color(0xff02011B);
  final Color blue900 = const Color(0xff020115);

  Color get error => red600;
  final Color red50 = const Color(0xFFFEE9E7);
  final Color red100 = const Color(0xFFFCD2CF);
  final Color red200 = const Color(0xFFFAA69E);
  final Color red300 = const Color(0xFFF7796E);
  final Color red400 = const Color(0xFFF54C3D);
  final Color red500 = const Color(0xFFF54E3F);
  final Color red600 = const Color(0xFFC2190A);
  final Color red700 = const Color(0xFF911308);
  final Color red800 = const Color(0xFF610D05);
  final Color red900 = const Color(0xFF300603);

  final Color warning50 = const Color(0xFFFFFDFA);
  final Color warning100 = const Color(0xFFFFF9EE);
  final Color warning200 = const Color(0xFFFFF7E1);
  final Color warning300 = const Color(0xFFFFEAB3);
  final Color warning400 = const Color(0xFFFFDD82);
  final Color warning500 = const Color(0xFFFFC62B);
  final Color warning600 = const Color(0xFFFFAD0D);
  final Color warning700 = const Color(0xFFFE9B0E);

  final Color success50 = const Color(0xFFFBFEFC);
  final Color success100 = const Color(0xFFF2FAF6);
  final Color success200 = const Color(0xFFE5F5EC);
  final Color success300 = const Color(0xFFC0E5D1);
  final Color success400 = const Color(0xFF97D4B4);
  final Color success500 = const Color(0xFF6BC497);
  final Color success600 = const Color(0xFF47B881);
  final Color success700 = const Color(0xFF0C9D61);
  final Color success800 = const Color(0xFF34C759);

  LinearGradient get primaryGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          secondary,
          primary,
        ],
      );

  /// Represnet grid4 in design
  LinearGradient get linearGradient1 => LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          primary500,
          primary500
          // Color.fromARGB(255, 79, 4, 208),
        ],
      );
  LinearGradient get grid1 => LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            primary500,
            primary500
          ],
          stops: [
            0.47,
            0.92,
          ]);

  /// Represnet grid3 in design
  LinearGradient get linearGradient2 => LinearGradient(
        begin: const Alignment(0.9968, -0.0793), // start from top-right-ish
        end: const Alignment(-0.9968, 0.0793), // end at bottom-left-ish
        colors: [primary500, primary500],
        stops: [0.0, 0.47, 0.92],
      );

  LinearGradient get linearGradient3 => LinearGradient(
        colors: [
          canvasBackgroundColor,
          canvasBackgroundColor,
        ],
      );
  LinearGradient get linearGradient4 => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [primary50, primary50],
      );

  LinearGradient get disableGradient => const LinearGradient(
        colors: [
          Color(0xFFDADADA),
          Color(0xFFDADADA),
        ],
      );
  LinearGradient get lightGradient => const LinearGradient(
        colors: [
          Color(0xFFEBFFFF),
          Color(0xFFFAFFFF),
        ],
      );
  LinearGradient get linearGradient => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primary500,
            primary900
          ],
          stops: [
            0.47,
            0.92,
          ]);
}
