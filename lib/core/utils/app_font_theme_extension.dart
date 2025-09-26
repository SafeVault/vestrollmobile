import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// `ThemeExtension` for custom text styles.
///
/// This extension defines the typography styles used throughout the app.
class AppFontThemeExtension extends ThemeExtension<AppFontThemeExtension> {
  const AppFontThemeExtension({
    // Headings
    required this.heading1Bold,
    required this.heading1SemiBold,
    required this.heading1Medium,
    required this.heading1Regular,
    required this.heading2Bold,
    required this.heading2SemiBold,
    required this.heading2Medium,
    required this.heading2Regular,
    required this.heading3Bold,
    required this.heading3SemiBold,
    required this.heading3Medium,
    required this.heading3Regular,
    // Text styles
    required this.textLgBold,
    required this.textLgSemiBold,
    required this.textLgMedium,
    required this.textLgRegular,
    required this.textBaseBold,
    required this.textBaseSemiBold,
    required this.textBaseMedium,
    required this.textBaseRegular,
    required this.textMdBold,
    required this.textMdSemiBold,
    required this.textMdMedium,
    required this.textMdRegular,
    required this.textSmBold,
    required this.textSmSemiBold,
    required this.textSmMedium,
    required this.textSmRegular,
    required this.textXsBold,
    required this.textXsSemiBold,
    required this.textXsMedium,
    required this.textXsRegular,
    // Legacy styles
    required this.headerLarger,
    required this.headerSmall,
    required this.subHeader,
    required this.bodyMedium,
  });

  // Headings
  final TextStyle heading1Bold;
  final TextStyle heading1SemiBold;
  final TextStyle heading1Medium;
  final TextStyle heading1Regular;
  final TextStyle heading2Bold;
  final TextStyle heading2SemiBold;
  final TextStyle heading2Medium;
  final TextStyle heading2Regular;
  final TextStyle heading3Bold;
  final TextStyle heading3SemiBold;
  final TextStyle heading3Medium;
  final TextStyle heading3Regular;
  // Text styles
  final TextStyle textLgBold;
  final TextStyle textLgSemiBold;
  final TextStyle textLgMedium;
  final TextStyle textLgRegular;
  final TextStyle textBaseBold;
  final TextStyle textBaseSemiBold;
  final TextStyle textBaseMedium;
  final TextStyle textBaseRegular;
  final TextStyle textMdBold;
  final TextStyle textMdSemiBold;
  final TextStyle textMdMedium;
  final TextStyle textMdRegular;
  final TextStyle textSmBold;
  final TextStyle textSmSemiBold;
  final TextStyle textSmMedium;
  final TextStyle textSmRegular;
  final TextStyle textXsBold;
  final TextStyle textXsSemiBold;
  final TextStyle textXsMedium;
  final TextStyle textXsRegular;
  // Legacy styles
  final TextStyle headerLarger;
  final TextStyle headerSmall;
  final TextStyle subHeader;
  final TextStyle bodyMedium;

  @override
  ThemeExtension<AppFontThemeExtension> copyWith({
    // Headings
    TextStyle? heading1Bold,
    TextStyle? heading1SemiBold,
    TextStyle? heading1Medium,
    TextStyle? heading1Regular,
    TextStyle? heading2Bold,
    TextStyle? heading2SemiBold,
    TextStyle? heading2Medium,
    TextStyle? heading2Regular,
    TextStyle? heading3Bold,
    TextStyle? heading3SemiBold,
    TextStyle? heading3Medium,
    TextStyle? heading3Regular,
    // Text styles
    TextStyle? textLgBold,
    TextStyle? textLgSemiBold,
    TextStyle? textLgMedium,
    TextStyle? textLgRegular,
    TextStyle? textBaseBold,
    TextStyle? textBaseSemiBold,
    TextStyle? textBaseMedium,
    TextStyle? textBaseRegular,
    TextStyle? textMdBold,
    TextStyle? textMdSemiBold,
    TextStyle? textMdMedium,
    TextStyle? textMdRegular,
    TextStyle? textSmBold,
    TextStyle? textSmSemiBold,
    TextStyle? textSmMedium,
    TextStyle? textSmRegular,
    TextStyle? textXsBold,
    TextStyle? textXsSemiBold,
    TextStyle? textXsMedium,
    TextStyle? textXsRegular,
    // Legacy styles
    TextStyle? headerLarger,
    TextStyle? headerSmall,
    TextStyle? subHeader,
    TextStyle? bodyMedium,
  }) {
    return AppFontThemeExtension(
      // Headings
      heading1Bold: heading1Bold ?? this.heading1Bold,
      heading1SemiBold: heading1SemiBold ?? this.heading1SemiBold,
      heading1Medium: heading1Medium ?? this.heading1Medium,
      heading1Regular: heading1Regular ?? this.heading1Regular,
      heading2Bold: heading2Bold ?? this.heading2Bold,
      heading2SemiBold: heading2SemiBold ?? this.heading2SemiBold,
      heading2Medium: heading2Medium ?? this.heading2Medium,
      heading2Regular: heading2Regular ?? this.heading2Regular,
      heading3Bold: heading3Bold ?? this.heading3Bold,
      heading3SemiBold: heading3SemiBold ?? this.heading3SemiBold,
      heading3Medium: heading3Medium ?? this.heading3Medium,
      heading3Regular: heading3Regular ?? this.heading3Regular,
      // Text styles
      textLgBold: textLgBold ?? this.textLgBold,
      textLgSemiBold: textLgSemiBold ?? this.textLgSemiBold,
      textLgMedium: textLgMedium ?? this.textLgMedium,
      textLgRegular: textLgRegular ?? this.textLgRegular,
      textBaseBold: textBaseBold ?? this.textBaseBold,
      textBaseSemiBold: textBaseSemiBold ?? this.textBaseSemiBold,
      textBaseMedium: textBaseMedium ?? this.textBaseMedium,
      textBaseRegular: textBaseRegular ?? this.textBaseRegular,
      textMdBold: textMdBold ?? this.textMdBold,
      textMdSemiBold: textMdSemiBold ?? this.textMdSemiBold,
      textMdMedium: textMdMedium ?? this.textMdMedium,
      textMdRegular: textMdRegular ?? this.textMdRegular,
      textSmBold: textSmBold ?? this.textSmBold,
      textSmSemiBold: textSmSemiBold ?? this.textSmSemiBold,
      textSmMedium: textSmMedium ?? this.textSmMedium,
      textSmRegular: textSmRegular ?? this.textSmRegular,
      textXsBold: textXsBold ?? this.textXsBold,
      textXsSemiBold: textXsSemiBold ?? this.textXsSemiBold,
      textXsMedium: textXsMedium ?? this.textXsMedium,
      textXsRegular: textXsRegular ?? this.textXsRegular,
      // Legacy styles
      headerLarger: headerLarger ?? this.headerLarger,
      headerSmall: headerSmall ?? this.headerSmall,
      subHeader: subHeader ?? this.subHeader,
      bodyMedium: bodyMedium ?? this.bodyMedium,
    );
  }

  @override
  ThemeExtension<AppFontThemeExtension> lerp(
    covariant ThemeExtension<AppFontThemeExtension>? other,
    double t,
  ) {
    if (other is! AppFontThemeExtension) {
      return this;
    }
    return AppFontThemeExtension(
      // Headings
      heading1Bold: TextStyle.lerp(heading1Bold, other.heading1Bold, t)!,
      heading1SemiBold:
          TextStyle.lerp(heading1SemiBold, other.heading1SemiBold, t)!,
      heading1Medium: TextStyle.lerp(heading1Medium, other.heading1Medium, t)!,
      heading1Regular:
          TextStyle.lerp(heading1Regular, other.heading1Regular, t)!,
      heading2Bold: TextStyle.lerp(heading2Bold, other.heading2Bold, t)!,
      heading2SemiBold:
          TextStyle.lerp(heading2SemiBold, other.heading2SemiBold, t)!,
      heading2Medium: TextStyle.lerp(heading2Medium, other.heading2Medium, t)!,
      heading2Regular:
          TextStyle.lerp(heading2Regular, other.heading2Regular, t)!,
      heading3Bold: TextStyle.lerp(heading3Bold, other.heading3Bold, t)!,
      heading3SemiBold:
          TextStyle.lerp(heading3SemiBold, other.heading3SemiBold, t)!,
      heading3Medium: TextStyle.lerp(heading3Medium, other.heading3Medium, t)!,
      heading3Regular:
          TextStyle.lerp(heading3Regular, other.heading3Regular, t)!,
      // Text styles
      textLgBold: TextStyle.lerp(textLgBold, other.textLgBold, t)!,
      textLgSemiBold: TextStyle.lerp(textLgSemiBold, other.textLgSemiBold, t)!,
      textLgMedium: TextStyle.lerp(textLgMedium, other.textLgMedium, t)!,
      textLgRegular: TextStyle.lerp(textLgRegular, other.textLgRegular, t)!,
      textBaseBold: TextStyle.lerp(textBaseBold, other.textBaseBold, t)!,
      textBaseSemiBold:
          TextStyle.lerp(textBaseSemiBold, other.textBaseSemiBold, t)!,
      textBaseMedium: TextStyle.lerp(textBaseMedium, other.textBaseMedium, t)!,
      textBaseRegular:
          TextStyle.lerp(textBaseRegular, other.textBaseRegular, t)!,
      textMdBold: TextStyle.lerp(textMdBold, other.textMdBold, t)!,
      textMdSemiBold: TextStyle.lerp(textMdSemiBold, other.textMdSemiBold, t)!,
      textMdMedium: TextStyle.lerp(textMdMedium, other.textMdMedium, t)!,
      textMdRegular: TextStyle.lerp(textMdRegular, other.textMdRegular, t)!,
      textSmBold: TextStyle.lerp(textSmBold, other.textSmBold, t)!,
      textSmSemiBold: TextStyle.lerp(textSmSemiBold, other.textSmSemiBold, t)!,
      textSmMedium: TextStyle.lerp(textSmMedium, other.textSmMedium, t)!,
      textSmRegular: TextStyle.lerp(textSmRegular, other.textSmRegular, t)!,
      textXsBold: TextStyle.lerp(textXsBold, other.textXsBold, t)!,
      textXsSemiBold: TextStyle.lerp(textXsSemiBold, other.textXsSemiBold, t)!,
      textXsMedium: TextStyle.lerp(textXsMedium, other.textXsMedium, t)!,
      textXsRegular: TextStyle.lerp(textXsRegular, other.textXsRegular, t)!,
      // Legacy styles
      headerLarger: TextStyle.lerp(headerLarger, other.headerLarger, t)!,
      headerSmall: TextStyle.lerp(headerSmall, other.headerSmall, t)!,
      subHeader: TextStyle.lerp(subHeader, other.subHeader, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
    );
  }

  /// Get a text style with a different color
  AppFontThemeExtension withColor(Color color) {
    return AppFontThemeExtension(
      // Headings
      heading1Bold: heading1Bold.copyWith(color: color),
      heading1SemiBold: heading1SemiBold.copyWith(color: color),
      heading1Medium: heading1Medium.copyWith(color: color),
      heading1Regular: heading1Regular.copyWith(color: color),
      heading2Bold: heading2Bold.copyWith(color: color),
      heading2SemiBold: heading2SemiBold.copyWith(color: color),
      heading2Medium: heading2Medium.copyWith(color: color),
      heading2Regular: heading2Regular.copyWith(color: color),
      heading3Bold: heading3Bold.copyWith(color: color),
      heading3SemiBold: heading3SemiBold.copyWith(color: color),
      heading3Medium: heading3Medium.copyWith(color: color),
      heading3Regular: heading3Regular.copyWith(color: color),
      // Text styles
      textLgBold: textLgBold.copyWith(color: color),
      textLgSemiBold: textLgSemiBold.copyWith(color: color),
      textLgMedium: textLgMedium.copyWith(color: color),
      textLgRegular: textLgRegular.copyWith(color: color),
      textBaseBold: textBaseBold.copyWith(color: color),
      textBaseSemiBold: textBaseSemiBold.copyWith(color: color),
      textBaseMedium: textBaseMedium.copyWith(color: color),
      textBaseRegular: textBaseRegular.copyWith(color: color),
      textMdBold: textMdBold.copyWith(color: color),
      textMdSemiBold: textMdSemiBold.copyWith(color: color),
      textMdMedium: textMdMedium.copyWith(color: color),
      textMdRegular: textMdRegular.copyWith(color: color),
      textSmBold: textSmBold.copyWith(color: color),
      textSmSemiBold: textSmSemiBold.copyWith(color: color),
      textSmMedium: textSmMedium.copyWith(color: color),
      textSmRegular: textSmRegular.copyWith(color: color),
      textXsBold: textXsBold.copyWith(color: color),
      textXsSemiBold: textXsSemiBold.copyWith(color: color),
      textXsMedium: textXsMedium.copyWith(color: color),
      textXsRegular: textXsRegular.copyWith(color: color),
      // Legacy styles
      headerLarger: headerLarger.copyWith(color: color),
      headerSmall: headerSmall.copyWith(color: color),
      subHeader: subHeader.copyWith(color: color),
      bodyMedium: bodyMedium.copyWith(color: color),
    );
  }

  /// Get a text style with a different font weight
  TextStyle applyWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Map a style to a Material 3 typography role
  static AppFontThemeExtension fromTextTheme(
    TextTheme textTheme,
    Color textColor,
  ) {
    return AppFontThemeExtension(
      // Headings (matching image sizes)
      heading1Bold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 45, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      heading1SemiBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 45, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      heading1Medium: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 45, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      heading1Regular: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 45, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      heading2Bold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 32, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      heading2SemiBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 32, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      heading2Medium: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 32, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      heading2Regular: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 32, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      heading3Bold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 28, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      heading3SemiBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 28, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      heading3Medium: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 28, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      heading3Regular: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 28, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      // Text styles (matching image sizes)
      textLgBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 24, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      textLgSemiBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 24, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      textLgMedium: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 24, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      textLgRegular: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 24, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      textBaseBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize:
            20, // Explicitly set font size to match "Subheadline" in image
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      textBaseSemiBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize:
            20, // Explicitly set font size to match "Subheadline" in image
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      textBaseMedium: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize:
            20, // Explicitly set font size to match "Subheadline" in image
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      textBaseRegular: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize:
            20, // Explicitly set font size to match "Subheadline" in image
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      textMdBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 16, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      textMdSemiBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 16, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      textMdMedium: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 16, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      textMdRegular: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 16, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      textSmBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 16, // Explicitly set font size to match "Link" in image
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      textSmSemiBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 16, // Explicitly set font size to match "Link" in image
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      textSmMedium: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 16, // Explicitly set font size to match "Link" in image
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      textSmRegular: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 16, // Explicitly set font size to match "Link" in image
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      textXsBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 12, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      textXsSemiBold: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 12, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      textXsMedium: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 12, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
      textXsRegular: GoogleFonts.hankenGrotesk(
        // Using Hanken Grotesk font
        fontSize: 12, // Explicitly set font size
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      // Legacy styles (adjusted to align with image and common usage)
      headerLarger: GoogleFonts.hankenGrotesk(
        // Aligns with "Display 1" (32px)
        fontSize: 32,
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      headerSmall: GoogleFonts.hankenGrotesk(
        // Aligns with "Subheadline" (20px)
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      subHeader: GoogleFonts.hankenGrotesk(
        // Aligns with "Subheadline" (20px)
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.hankenGrotesk(
        // Aligns with "Body" (16px)
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
