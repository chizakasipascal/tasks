import 'package:flutter/material.dart';

class AppColors {
  /// usage:
  /// `AppColors.white`
  static const Color white = Color(0xffFFFFFF);

  /// usage:
  /// `AppColors.black`
  static const Color black = Color(0xff111111);

  /// usage:
  /// `AppColors.primary[50]`
  ///  `AppColors.primary.shade.50`

  static const Color primary = Color.fromRGBO(19, 151, 193, 1);
  static const blackTextColor = Color.fromRGBO(28, 39, 76, 1);
  static const inputBackgroundColor = Color.fromRGBO(234, 237, 237, 1);
  static const messageSentBackground = Color.fromRGBO(231, 245, 249, 1);
  static const successColor = Color.fromRGBO(35, 144, 59, 1);
  static const textErrorColor = Color.fromRGBO(255, 52, 42, 1);
  static const navibarBackground = Color.fromRGBO(249, 249, 249, 1);
  static const textnavBarColorNoSelected = Color.fromRGBO(73, 69, 79, 1);
  static const backgroundModaleSheetColors = Color.fromRGBO(249, 249, 249, 1);
  static const primaryIconColors = Color.fromRGBO(10, 76, 97, 1);
  static const textDisableColor = Color.fromRGBO(162, 162, 166, 1);

  /// usage:
  /// `AppColors.gray[50]`
  /// `AppColors.gray.50`
  static final MaterialColor gray =
      MaterialColor(const Color(0xFFD9D9D9).value, const <int, Color>{
    50: Color(0xFFF8FAFC),
    100: Color(0xFFF5F5F6),
    200: Color(0xFFE2E8F0),
    300: Color(0xFFCBD5E1),
    400: Color(0xFF9DA4AE),
    500: Color(0xFF64748B),
    600: Color(0xFF475569),
    700: Color(0xFF334155),
  });

  /// usage:
  /// `AppColors.success[50]`
  /// `AppColors.success.50`
  static final MaterialColor success =
      MaterialColor(const Color(0xFF07cf0f).value, const <int, Color>{
    50: Color(0xFFF0FDF4),
    100: Color(0xFFDCFCE7),
    200: Color(0xFFBBF7D0),
    300: Color(0xFF86EFAC),
    400: Color(0xFF4ADE80),
    500: Color(0xFF22C55E),
    600: Color(0xFF16A34A),
    700: Color(0xFF15803D),
  });

  /// usage:
  /// `AppColors.warning[50]`
  /// `AppColors.warning.50`
  static final MaterialColor warning =
      MaterialColor(const Color(0xFFDA9D00).value, const <int, Color>{
    50: Color(0xFFFFFBEB),
    100: Color(0xFFFEF3C7),
    200: Color(0xFFFDE68A),
    300: Color(0xFFFCD34D),
    400: Color(0xFFFBBF24),
    500: Color(0xFFF59E0B),
    600: Color(0xFFD97706),
    700: Color(0xFFB45309),
  });

  /// usage:
  /// `AppColors.error[50]`
  /// `AppColors.error.50`
  static final MaterialColor error =
      MaterialColor(const Color(0xFFd20404).value, const <int, Color>{
    50: Color(0xFFFEF2F2),
    100: Color(0xFFFEE2E2),
    200: Color(0xFFFECACA),
    300: Color(0xFFFCA5A5),
    400: Color(0xFFF87171),
    500: Color(0xFFEF4444),
    600: Color(0xFFDC2626),
    700: Color(0xFFB91C1C),
  });
}
