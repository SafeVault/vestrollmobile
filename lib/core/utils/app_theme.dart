import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';

/// AppTheme - Main theme configuration for VelocityStaff payroll application
class AppTheme {
  // Light theme color configurations
  static final _lightAppColors = ColorSystemExtension.light();

  // Dark theme color configurations
  static final _darkAppColors = ColorSystemExtension.dark();

  // Font styles for light theme using Hanken Grotesk
  static final _lightFontTheme = AppFontThemeExtension(
    // Headings
    heading1Bold: GoogleFonts.hankenGrotesk(
      fontSize: 45,
      height: 1.25, // 40px line height
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    heading1SemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 45,
      height: 1.25, // 40px line height
      fontWeight: FontWeight.w600,
      color: _lightAppColors.textPrimary,
    ),
    heading1Medium: GoogleFonts.hankenGrotesk(
      fontSize: 45,
      height: 1.25, // 40px line height
      fontWeight: FontWeight.w500,
      color: _lightAppColors.textPrimary,
    ),
    heading1Regular: GoogleFonts.hankenGrotesk(
      fontSize: 45,
      height: 1.25, // 40px line height
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
    heading2Bold: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      height: 1.33, // 32px line height
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    heading2SemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      height: 1.33, // 32px line height
      fontWeight: FontWeight.w600,
      color: _lightAppColors.textPrimary,
    ),
    heading2Medium: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      height: 1.33, // 32px line height
      fontWeight: FontWeight.w500,
      color: _lightAppColors.textPrimary,
    ),
    heading2Regular: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      height: 1.33, // 32px line height
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
    heading3Bold: GoogleFonts.hankenGrotesk(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    heading3SemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.w600,
      color: _lightAppColors.textPrimary,
    ),
    heading3Medium: GoogleFonts.hankenGrotesk(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.w500,
      color: _lightAppColors.textPrimary,
    ),
    heading3Regular: GoogleFonts.hankenGrotesk(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
    // Text styles
    textLgBold: GoogleFonts.hankenGrotesk(
      fontSize: 24,
      height: 1.33, // 24px line height
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    textLgSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 24,
      height: 1.33, // 24px line height
      fontWeight: FontWeight.w600,
      color: _lightAppColors.textPrimary,
    ),
    textLgMedium: GoogleFonts.hankenGrotesk(
      fontSize: 24,
      height: 1.33, // 24px line height
      fontWeight: FontWeight.w500,
      color: _lightAppColors.textPrimary,
    ),
    textLgRegular: GoogleFonts.hankenGrotesk(
      fontSize: 24,
      height: 1.33, // 24px line height
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
    textBaseBold: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      height: 1.5, // 24px line height
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    textBaseSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      height: 1.5, // 24px line height
      fontWeight: FontWeight.w600,
      color: _lightAppColors.textPrimary,
    ),
    textBaseMedium: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      height: 1.5, // 24px line height
      fontWeight: FontWeight.w500,
      color: _lightAppColors.textPrimary,
    ),
    textBaseRegular: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      height: 1.5, // 24px line height
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
    textMdBold: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      height: 1.43, // 20px line height
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    textMdSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      height: 1.43, // 20px line height
      fontWeight: FontWeight.w600,
      color: _lightAppColors.textPrimary,
    ),
    textMdMedium: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      height: 1.43, // 20px line height
      fontWeight: FontWeight.w500,
      color: _lightAppColors.textPrimary,
    ),
    textMdRegular: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      height: 1.43, // 20px line height
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
    textSmBold: GoogleFonts.hankenGrotesk(
      fontSize: 16, // Adjusted to match "Link" in image
      height: 1.33, // 16px line height
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    textSmSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 16, // Adjusted to match "Link" in image
      height: 1.33, // 16px line height
      fontWeight: FontWeight.w600,
      color: _lightAppColors.textPrimary,
    ),
    textSmMedium: GoogleFonts.hankenGrotesk(
      fontSize: 16, // Adjusted to match "Link" in image
      height: 1.33, // 16px line height
      fontWeight: FontWeight.w500,
      color: _lightAppColors.textPrimary,
    ),
    textSmRegular: GoogleFonts.hankenGrotesk(
      fontSize: 16, // Adjusted to match "Link" in image
      height: 1.33, // 16px line height
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
    textXsBold: GoogleFonts.hankenGrotesk(
      fontSize: 12,
      height: 1.4, // 14px line height
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    textXsSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 12,
      height: 1.4, // 14px line height
      fontWeight: FontWeight.w600,
      color: _lightAppColors.textPrimary,
    ),
    textXsMedium: GoogleFonts.hankenGrotesk(
      fontSize: 12,
      height: 1.4, // 14px line height
      fontWeight: FontWeight.w500,
      color: _lightAppColors.textPrimary,
    ),
    textXsRegular: GoogleFonts.hankenGrotesk(
      fontSize: 12,
      height: 1.4, // 14px line height
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
    // Legacy styles
    headerLarger: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    headerSmall: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: _lightAppColors.textPrimary,
    ),
    subHeader: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textTertiary,
    ),
    bodyMedium: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: _lightAppColors.textPrimary,
    ),
  );

  // Font styles for dark theme using Hanken Grotesk
  static final _darkFontTheme = AppFontThemeExtension(
    // Headings
    heading1Bold: GoogleFonts.hankenGrotesk(
      fontSize: 45,
      height: 1.25, // 40px line height
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    heading1SemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 45,
      height: 1.25, // 40px line height
      fontWeight: FontWeight.w600,
      color: _darkAppColors.textPrimary,
    ),
    heading1Medium: GoogleFonts.hankenGrotesk(
      fontSize: 45,
      height: 1.25, // 40px line height
      fontWeight: FontWeight.w500,
      color: _darkAppColors.textPrimary,
    ),
    heading1Regular: GoogleFonts.hankenGrotesk(
      fontSize: 45,
      height: 1.25, // 40px line height
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
    heading2Bold: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      height: 1.33, // 32px line height
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    heading2SemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      height: 1.33, // 32px line height
      fontWeight: FontWeight.w600,
      color: _darkAppColors.textPrimary,
    ),
    heading2Medium: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      height: 1.33, // 32px line height
      fontWeight: FontWeight.w500,
      color: _darkAppColors.textPrimary,
    ),
    heading2Regular: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      height: 1.33, // 32px line height
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
    heading3Bold: GoogleFonts.hankenGrotesk(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    heading3SemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.w600,
      color: _darkAppColors.textPrimary,
    ),
    heading3Medium: GoogleFonts.hankenGrotesk(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.w500,
      color: _darkAppColors.textPrimary,
    ),
    heading3Regular: GoogleFonts.hankenGrotesk(
      fontSize: 28,
      height: 1.4,
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
    // Text styles
    textLgBold: GoogleFonts.hankenGrotesk(
      fontSize: 24,
      height: 1.33, // 24px line height
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    textLgSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 24,
      height: 1.33, // 24px line height
      fontWeight: FontWeight.w600,
      color: _darkAppColors.textPrimary,
    ),
    textLgMedium: GoogleFonts.hankenGrotesk(
      fontSize: 24,
      height: 1.33, // 24px line height
      fontWeight: FontWeight.w500,
      color: _darkAppColors.textPrimary,
    ),
    textLgRegular: GoogleFonts.hankenGrotesk(
      fontSize: 24,
      height: 1.33, // 24px line height
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
    textBaseBold: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      height: 1.5, // 24px line height
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    textBaseSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      height: 1.5, // 24px line height
      fontWeight: FontWeight.w600,
      color: _darkAppColors.textPrimary,
    ),
    textBaseMedium: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      height: 1.5, // 24px line height
      fontWeight: FontWeight.w500,
      color: _darkAppColors.textPrimary,
    ),
    textBaseRegular: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      height: 1.5, // 24px line height
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
    textMdBold: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      height: 1.43, // 20px line height
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    textMdSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      height: 1.43, // 20px line height
      fontWeight: FontWeight.w600,
      color: _darkAppColors.textPrimary,
    ),
    textMdMedium: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      height: 1.43, // 20px line height
      fontWeight: FontWeight.w500,
      color: _darkAppColors.textPrimary,
    ),
    textMdRegular: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      height: 1.43, // 20px line height
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
    textSmBold: GoogleFonts.hankenGrotesk(
      fontSize: 16, // Adjusted to match "Link" in image
      height: 1.33, // 16px line height
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    textSmSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 16, // Adjusted to match "Link" in image
      height: 1.33, // 16px line height
      fontWeight: FontWeight.w600,
      color: _darkAppColors.textPrimary,
    ),
    textSmMedium: GoogleFonts.hankenGrotesk(
      fontSize: 16, // Adjusted to match "Link" in image
      height: 1.33, // 16px line height
      fontWeight: FontWeight.w500,
      color: _darkAppColors.textPrimary,
    ),
    textSmRegular: GoogleFonts.hankenGrotesk(
      fontSize: 16, // Adjusted to match "Link" in image
      height: 1.33, // 16px line height
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
    textXsBold: GoogleFonts.hankenGrotesk(
      fontSize: 12,
      height: 1.4, // 14px line height
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    textXsSemiBold: GoogleFonts.hankenGrotesk(
      fontSize: 12,
      height: 1.4, // 14px line height
      fontWeight: FontWeight.w600,
      color: _darkAppColors.textPrimary,
    ),
    textXsMedium: GoogleFonts.hankenGrotesk(
      fontSize: 12,
      height: 1.4, // 14px line height
      fontWeight: FontWeight.w500,
      color: _darkAppColors.textPrimary,
    ),
    textXsRegular: GoogleFonts.hankenGrotesk(
      fontSize: 12,
      height: 1.4, // 14px line height
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
    // Legacy styles
    headerLarger: GoogleFonts.hankenGrotesk(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    headerSmall: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: _darkAppColors.textPrimary,
    ),
    subHeader: GoogleFonts.hankenGrotesk(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textTertiary,
    ),
    bodyMedium: GoogleFonts.hankenGrotesk(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: _darkAppColors.textPrimary,
    ),
  );

  // Define the static light theme configurations
  static final light = () {
    final defaultTheme = ThemeData.light();
    return defaultTheme.copyWith(
      colorScheme: _lightAppColors.toColorScheme(Brightness.light),
      scaffoldBackgroundColor: _lightAppColors.bgB1,
      appBarTheme: AppBarTheme(
        color: _lightAppColors.bgB0,
        titleTextStyle: _lightFontTheme.heading2Bold,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: _lightAppColors.bgB0,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textTheme: TextTheme(
        // Map Material's text theme to our custom styles
        displayLarge: _lightFontTheme.heading1Bold,
        displayMedium: _lightFontTheme.heading2Bold,
        displaySmall: _lightFontTheme.heading3Bold,
        headlineLarge: _lightFontTheme.heading1SemiBold,
        headlineMedium: _lightFontTheme.heading2SemiBold,
        headlineSmall: _lightFontTheme.heading3SemiBold,
        titleLarge: _lightFontTheme.textLgBold,
        titleMedium: _lightFontTheme.textBaseBold,
        titleSmall: _lightFontTheme.textMdBold,
        bodyLarge: _lightFontTheme.textLgRegular,
        bodyMedium: _lightFontTheme.textBaseRegular,
        bodySmall: _lightFontTheme.textMdRegular,
        labelLarge: _lightFontTheme.textSmBold,
        labelMedium: _lightFontTheme.textSmRegular,
        labelSmall: _lightFontTheme.textXsRegular,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightAppColors.blue600,
          foregroundColor: _lightAppColors.constantContrast,
          disabledBackgroundColor: _lightAppColors.gray300,
          disabledForegroundColor: _lightAppColors.textPrimary,
          textStyle: _lightFontTheme.textMdBold,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _lightAppColors.blue600,
          disabledForegroundColor: _lightAppColors.textTertiary,
          textStyle: _lightFontTheme.textMdBold,
          side: BorderSide(color: _lightAppColors.blue600),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _lightAppColors.blue600,
          disabledForegroundColor: _lightAppColors.textTertiary,
          textStyle: _lightFontTheme.textMdBold,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: _lightAppColors.bgB0,
        filled: true,
        labelStyle: _lightFontTheme.textMdRegular.copyWith(
          color: _lightAppColors.textTertiary,
        ),
        hintStyle: _lightFontTheme.textMdRegular.copyWith(
          color: _lightAppColors.textTertiary,
        ),
        errorStyle: _lightFontTheme.textSmRegular.copyWith(
          color: _lightAppColors.red500,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: _lightAppColors.gray300),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _lightAppColors.gray300),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _lightAppColors.blue600),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _lightAppColors.red500),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _lightAppColors.red500),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      extensions: [_lightAppColors, _lightFontTheme],
    );
  }();

  static final dark = () {
    final defaultTheme = ThemeData.dark();
    return defaultTheme.copyWith(
      colorScheme: _darkAppColors.toColorScheme(Brightness.dark),
      scaffoldBackgroundColor: _darkAppColors.bgB0,
      appBarTheme: AppBarTheme(
        color: _darkAppColors.bgB0,
        titleTextStyle: _darkFontTheme.heading2Bold,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: _darkAppColors.bgB1,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textTheme: TextTheme(
        // Map Material's text theme to our custom styles
        displayLarge: _darkFontTheme.heading1Bold,
        displayMedium: _darkFontTheme.heading2Bold,
        displaySmall: _darkFontTheme.heading3Bold,
        headlineLarge: _darkFontTheme.heading1SemiBold,
        headlineMedium: _darkFontTheme.heading2SemiBold,
        headlineSmall: _darkFontTheme.heading3SemiBold,
        titleLarge: _darkFontTheme.textLgBold,
        titleMedium: _darkFontTheme.textBaseBold,
        titleSmall: _darkFontTheme.textMdBold,
        bodyLarge: _darkFontTheme.textLgRegular,
        bodyMedium: _darkFontTheme.textBaseRegular,
        bodySmall: _darkFontTheme.textMdRegular,
        labelLarge: _darkFontTheme.textSmBold,
        labelMedium: _darkFontTheme.textSmRegular,
        labelSmall: _darkFontTheme.textXsRegular,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkAppColors.blue500,
          foregroundColor: _darkAppColors.constantContrast,
          disabledBackgroundColor: _darkAppColors.gray400,
          disabledForegroundColor: _darkAppColors.textPrimary,
          textStyle: _darkFontTheme.textMdBold,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _darkAppColors.blue500,
          disabledForegroundColor: _darkAppColors.textTertiary,
          textStyle: _darkFontTheme.textMdBold,
          side: BorderSide(color: _darkAppColors.blue500),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _darkAppColors.blue500,
          disabledForegroundColor: _darkAppColors.textTertiary,
          textStyle: _darkFontTheme.textMdBold,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: _darkAppColors.bgB1,
        filled: true,
        labelStyle: _darkFontTheme.textMdRegular.copyWith(
          color: _darkAppColors.textTertiary,
        ),
        hintStyle: _darkFontTheme.textMdRegular.copyWith(
          color: _darkAppColors.textTertiary,
        ),
        errorStyle: _darkFontTheme.textSmRegular.copyWith(
          color: _darkAppColors.red500,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: _darkAppColors.gray400),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkAppColors.gray400),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkAppColors.blue500),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkAppColors.red500),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkAppColors.red500),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      extensions: [_darkAppColors, _darkFontTheme],
    );
  }();
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}

extension AppThemeExtension on ThemeData {
  ColorSystemExtension get colors =>
      extension<ColorSystemExtension>() ??
      ColorSystemExtension.light(); // Fallback to light
  AppFontThemeExtension get fonts =>
      extension<AppFontThemeExtension>() ??
      AppFontThemeExtension.fromTextTheme(
        ThemeData.light().textTheme, // Provide a default TextTheme
        ColorSystemExtension.light().textPrimary, // Provide a default color
      );
}
