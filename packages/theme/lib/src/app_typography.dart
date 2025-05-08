import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

// https://stackoverflow.com/a/63068152/644571
double _heightCalc(int pxHeight, int fontSize) => pxHeight / fontSize;

class AppTypography {
  /// bold  TextStyle styles
  TextStyle get extraLarge => GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: AppColors.black,
        height: _heightCalc(48, 34),
      );

  TextStyle get largeTitle => GoogleFonts.inter(
        fontWeight: FontWeight.w900,
        fontSize: 27,
        height: _heightCalc(36, 27),
      );
  TextStyle get appbarTitle => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontSize: 20,
      );

  TextStyle get appbarSecondTitle => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: AppColors.textErrorColor,
        fontSize: 20,
      );

  TextStyle get sectionTitle => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: _heightCalc(23, 16),
      );

  TextStyle get header => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        height: _heightCalc(20, 15),
      );

  TextStyle get body => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.black,
        height: _heightCalc(20, 15),
      );

  TextStyle get subheader => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: _heightCalc(16, 12),
      );

  TextStyle get button => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.successColor,
        height: _heightCalc(20, 15),
      );

  TextStyle get caption => GoogleFonts.inter(
        fontSize: 14,
        height: _heightCalc(17, 14),
      );

  TextStyle get subHeadingBold => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: _heightCalc(18, 12),
        letterSpacing: 0.06,
      );

  TextStyle get smallBold => GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 11,
        height: _heightCalc(13, 11),
      );
}
