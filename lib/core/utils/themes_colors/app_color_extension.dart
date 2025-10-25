import 'package:flutter/material.dart';

class ColorSystemExtension extends ThemeExtension<ColorSystemExtension> {
  const ColorSystemExtension({
    // Constant/Brand Colors
    required this.constantDefault,
    required this.constantContrast,

    // Brand Colors
    required this.brandDefault,
    required this.brandContrast,
    required this.brandHover,
    required this.brandActive,
    required this.brandStroke,
    required this.brandFill,

    // Text Colors
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textQuaternary,

    // Blue Colors
    required this.blue50,
    required this.blue100,
    required this.blue200,
    required this.blue300,
    required this.blue400,
    required this.blue500,
    required this.blue600,
    required this.blue700,
    required this.blue800,
    required this.blue900,
    required this.blue950,

    // Green Colors
    required this.green50,
    required this.green100,
    required this.green200,
    required this.green300,
    required this.green400,
    required this.green500,
    required this.green600,
    required this.green700,
    required this.green800,
    required this.green900,
    required this.green950,

    // Gray Colors
    required this.gray50,
    required this.gray100,
    required this.gray200,
    required this.gray300,
    required this.gray400,
    required this.gray500,
    required this.gray600,
    required this.gray700,
    required this.gray800,
    required this.gray900,
    required this.gray950,

    // Yellow Colors
    required this.yellow50,
    required this.yellow100,
    required this.yellow200,
    required this.yellow300,
    required this.yellow400,
    required this.yellow500,
    required this.yellow600,
    required this.yellow700,
    required this.yellow800,
    required this.yellow900,
    required this.yellow950,

    // Orange Colors
    required this.orange50,
    required this.orange100,
    required this.orange200,
    required this.orange300,
    required this.orange400,
    required this.orange500,
    required this.orange600,
    required this.orange700,
    required this.orange800,
    required this.orange900,
    required this.orange950,

    // Red Colors
    required this.red50,
    required this.red100,
    required this.red200,
    required this.red300,
    required this.red400,
    required this.red500,
    required this.red600,
    required this.red700,
    required this.red800,
    required this.red900,
    required this.red950,

    // Pink Colors
    required this.pink50,
    required this.pink100,
    required this.pink200,
    required this.pink300,
    required this.pink400,
    required this.pink500,
    required this.pink600,
    required this.pink700,
    required this.pink800,
    required this.pink900,
    required this.pink950,

    // Fill Colors
    required this.fillPrimary,
    required this.fillSecondary,
    required this.fillTertiary,
    required this.fillQuaternary,

    // Stroke Colors
    required this.strokePrimary,
    required this.strokeSecondary,

    // Background Colors
    required this.bgB0,
    required this.bgB1,
    required this.bgB2,
    required this.bgB3,

    // Surface colors
    required this.surface,
    required this.surfaceCard,

    // Button/Interactive colors
    required this.inactiveButton,
    required this.activeButton,
    required this.buttonTertiary,
    required this.buttonSecondary,

    // Icon colors
    required this.iconRed,
    required this.iconBlue,
    required this.textHighlightBlue,

    // Miscellaneous colors
    required this.contrastBlack,
    required this.contrastWhite,
  });

  // Constant/Brand Colors
  final Color constantDefault;
  final Color constantContrast;

  // Brand Colors
  final Color brandDefault;
  final Color brandContrast;
  final Color brandHover;
  final Color brandActive;
  final Color brandStroke;
  final Color brandFill;

  // Text Colors
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textQuaternary;

  // Blue Colors
  final Color blue50;
  final Color blue100;
  final Color blue200;
  final Color blue300;
  final Color blue400;
  final Color blue500;
  final Color blue600;
  final Color blue700;
  final Color blue800;
  final Color blue900;
  final Color blue950;

  // Green Colors
  final Color green50;
  final Color green100;
  final Color green200;
  final Color green300;
  final Color green400;
  final Color green500;
  final Color green600;
  final Color green700;
  final Color green800;
  final Color green900;
  final Color green950;

  // Gray Colors
  final Color gray50;
  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color gray400;
  final Color gray500;
  final Color gray600;
  final Color gray700;
  final Color gray800;
  final Color gray900;
  final Color gray950;

  // Yellow Colors
  final Color yellow50;
  final Color yellow100;
  final Color yellow200;
  final Color yellow300;
  final Color yellow400;
  final Color yellow500;
  final Color yellow600;
  final Color yellow700;
  final Color yellow800;
  final Color yellow900;
  final Color yellow950;

  // Orange Colors
  final Color orange50;
  final Color orange100;
  final Color orange200;
  final Color orange300;
  final Color orange400;
  final Color orange500;
  final Color orange600;
  final Color orange700;
  final Color orange800;
  final Color orange900;
  final Color orange950;

  // Red Colors
  final Color red50;
  final Color red100;
  final Color red200;
  final Color red300;
  final Color red400;
  final Color red500;
  final Color red600;
  final Color red700;
  final Color red800;
  final Color red900;
  final Color red950;

  // Pink Colors
  final Color pink50;
  final Color pink100;
  final Color pink200;
  final Color pink300;
  final Color pink400;
  final Color pink500;
  final Color pink600;
  final Color pink700;
  final Color pink800;
  final Color pink900;
  final Color pink950;

  // Fill Colors
  final Color fillPrimary;
  final Color fillSecondary;
  final Color fillTertiary;
  final Color fillQuaternary;

  // Stroke Colors
  final Color strokePrimary;
  final Color strokeSecondary;

  // Background Colors
  final Color bgB0;
  final Color bgB1;
  final Color bgB2;
  final Color bgB3;

  // Surface colors
  final Color surface;
  final Color surfaceCard;

  // Button/Interactive colors
  final Color inactiveButton;
  final Color activeButton;
  final Color buttonTertiary;
  final Color buttonSecondary;

  // Icon colors
  final Color iconRed;
  final Color iconBlue;
  final Color textHighlightBlue;

  // Miscellaneous colors
  final Color contrastBlack;
  final Color contrastWhite;

  /// Create light theme colors
  factory ColorSystemExtension.light() {
    return const ColorSystemExtension(
      // Constant/Brand Colors
      constantDefault: Color(0xFF000000),
      constantContrast: Color(0xFFFFFFFF),

      // Brand Colors (Purple/Violet based on your design)
      brandDefault: Color(0xFF5E2A8C),
      brandContrast: Color(0xFF7C3AED),
      brandHover: Color(0xFF7C3AED),
      brandActive: Color(0xFF6D28D9),
      brandStroke: Color(0xFFC4B5FD),
      brandFill: Color(0xFFF3F4F6),

      // Text Colors
      textPrimary: Color(0xFF111827),
      textSecondary: Color(0xFF71717A),
      textTertiary: Color(0xFF9CA3AF),
      textQuaternary: Color(0xFFD1D5DB),

      // Blue Colors
      blue50: Color(0xFFEFF6FF),
      blue100: Color(0xFFDBEAFE),
      blue200: Color(0xFFBFDBFE),
      blue300: Color(0xFF93C5FD),
      blue400: Color(0xFF60A5FA),
      blue500: Color(0xFF3B82F6),
      blue600: Color(0xFF2563EB),
      blue700: Color(0xFF1D4ED8),
      blue800: Color(0xFF1E40AF),
      blue900: Color(0xFF1E3A8A),
      blue950: Color(0xFF172554),

      // Green Colors
      green50: Color(0xFFF0FDF4),
      green100: Color(0xFFDCFCE7),
      green200: Color(0xFFBBF7D0),
      green300: Color(0xFF86EFAC),
      green400: Color(0xFF4ADE80),
      green500: Color(0xFF22C55E),
      green600: Color(0xFF16A34A),
      green700: Color(0xFF15803D),
      green800: Color(0xFF166534),
      green900: Color(0xFF14532D),
      green950: Color(0xFF052E16),

      // Gray Colors
      gray50: Color(0xFFF9FAFB),
      gray100: Color(0xFFF3F4F6),
      gray200: Color(0xFFE5E7EB),
      gray300: Color(0xFFD1D5DB),
      gray400: Color(0xFF9CA3AF),
      gray500: Color(0xFF6B7280),
      gray600: Color(0xFF4B5563),
      gray700: Color(0xFF374151),
      gray800: Color(0xFF1F2937),
      gray900: Color(0xFF111827),
      gray950: Color(0xFF18181B),

      // Yellow Colors
      yellow50: Color(0xFFFEFCE8),
      yellow100: Color(0xFFFEF3C7),
      yellow200: Color(0xFFFDE68A),
      yellow300: Color(0xFFFCD34D),
      yellow400: Color(0xFFFBBF24),
      yellow500: Color(0xFFF59E0B),
      yellow600: Color(0xFFD97706),
      yellow700: Color(0xFFB45309),
      yellow800: Color(0xFF92400E),
      yellow900: Color(0xFF78350F),
      yellow950: Color(0xFF451A03),

      // Orange Colors
      orange50: Color(0xFFFFF7ED),
      orange100: Color(0xFFFFEDD5),
      orange200: Color(0xFFFED7AA),
      orange300: Color(0xFFFDBB74),
      orange400: Color(0xFFFB923C),
      orange500: Color(0xFFF97316),
      orange600: Color(0xFFEA580C),
      orange700: Color(0xFFC2410C),
      orange800: Color(0xFF9A3412),
      orange900: Color(0xFF7C2D12),
      orange950: Color(0xFF431407),

      // Red Colors
      red50: Color(0xFFFEF2F2),
      red100: Color(0xFFFEE2E2),
      red200: Color(0xFFFECACA),
      red300: Color(0xFFFCA5A5),
      red400: Color(0xFFF87171),
      red500: Color(0xFFEF4444),
      red600: Color(0xFFDC2626),
      red700: Color(0xFFB91C1C),
      red800: Color(0xFF991B1B),
      red900: Color(0xFF7F1D1D),
      red950: Color(0xFF450A0A),

      // Pink Colors
      pink50: Color(0xFFFDF2F8),
      pink100: Color(0xFFFCE7F3),
      pink200: Color(0xFFFBCFE8),
      pink300: Color(0xFFF9A8D4),
      pink400: Color(0xFFF472B6),
      pink500: Color(0xFFEC4899),
      pink600: Color(0xFFDB2777),
      pink700: Color(0xFFBE185D),
      pink800: Color(0xFF9D174D),
      pink900: Color(0xFF831843),
      pink950: Color(0xFF500724),

      // Fill Colors
      fillPrimary: Color(0xFFF9FAFB),
      fillSecondary: Color(0xFFF3F4F6),
      fillTertiary: Color(0xFFE5E7EB),
      fillQuaternary: Color(0xFFD1D5DB),

      // Stroke Colors
      strokePrimary: Color(0xFFE5E7EB),
      strokeSecondary: Color(0xFFD1D5DB),

      // Background Colors
      bgB0: Color(0xFFFFFFFF),
      bgB1: Color(0xFFF9FAFB),
      bgB2: Color(0xFFF3F4F6),
      bgB3: Color(0xFFE5E7EB),

      // Surface colors
      surface: Color(0xFFFFFFFF),
      surfaceCard: Color(0xFFF9FAFB),

      // Button/Interactive colors
      inactiveButton: Color(0xFFE5E7EB),
      activeButton: Color(0xFF8B5CF6),
      buttonTertiary: Color(0xFFF3F4F6),
      buttonSecondary: Color(0xFFE5E7EB),

      // Icon colors
      iconRed: Color(0xFFEF4444),
      iconBlue: Color(0xFF3B82F6),
      textHighlightBlue: Color(0xFF60A5FA),

      // Miscellaneous colors
      contrastBlack: Color(0xFF000000),
      contrastWhite: Color(0xFFFFFFFF),
    );
  }

  /// Create dark theme colors
  factory ColorSystemExtension.dark() {
    return const ColorSystemExtension(
      // Constant/Brand Colors
      constantDefault: Color(0xFFFFFFFF),
      constantContrast: Color(0xFF000000),

      // Brand Colors (Purple/Violet adjusted for dark mode)
      brandDefault: Color(0xFF8B5CF6),
      brandContrast: Color(0xFFA78BFA),
      brandHover: Color(0xFFA78BFA),
      brandActive: Color(0xFFC4B5FD),
      brandStroke: Color(0xFF6D28D9),
      brandFill: Color(0xFF1F2937),

      // Text Colors
      textPrimary: Color(0xFFF9FAFB),
      textSecondary: Color(0xFF9CA3AF),
      textTertiary: Color(0xFF6B7280),
      textQuaternary: Color(0xFF4B5563),

      // Blue Colors (inverted for dark mode)
      blue50: Color(0xFF172554),
      blue100: Color(0xFF1E3A8A),
      blue200: Color(0xFF1E40AF),
      blue300: Color(0xFF1D4ED8),
      blue400: Color(0xFF2563EB),
      blue500: Color(0xFF3B82F6),
      blue600: Color(0xFF60A5FA),
      blue700: Color(0xFF93C5FD),
      blue800: Color(0xFFBFDBFE),
      blue900: Color(0xFFDBEAFE),
      blue950: Color(0xFFEFF6FF),

      // Green Colors (inverted for dark mode)
      green50: Color(0xFF052E16),
      green100: Color(0xFF14532D),
      green200: Color(0xFF166534),
      green300: Color(0xFF15803D),
      green400: Color(0xFF16A34A),
      green500: Color(0xFF22C55E),
      green600: Color(0xFF4ADE80),
      green700: Color(0xFF86EFAC),
      green800: Color(0xFFBBF7D0),
      green900: Color(0xFFDCFCE7),
      green950: Color(0xFFF0FDF4),

      // Gray Colors (inverted for dark mode)
      gray50: Color(0xFF030712),
      gray100: Color(0xFF111827),
      gray200: Color(0xFF1F2937),
      gray300: Color(0xFF374151),
      gray400: Color(0xFF4B5563),
      gray500: Color(0xFF6B7280),
      gray600: Color(0xFF9CA3AF),
      gray700: Color(0xFFD1D5DB),
      gray800: Color(0xFFE5E7EB),
      gray900: Color(0xFFF3F4F6),
      gray950: Color(0xFFF9FAFB),

      // Yellow Colors (inverted for dark mode)
      yellow50: Color(0xFF451A03),
      yellow100: Color(0xFF78350F),
      yellow200: Color(0xFF92400E),
      yellow300: Color(0xFFB45309),
      yellow400: Color(0xFFD97706),
      yellow500: Color(0xFFF59E0B),
      yellow600: Color(0xFFFBBF24),
      yellow700: Color(0xFFFCD34D),
      yellow800: Color(0xFFFDE68A),
      yellow900: Color(0xFFFEF3C7),
      yellow950: Color(0xFFFEFCE8),

      // Orange Colors (inverted for dark mode)
      orange50: Color(0xFF431407),
      orange100: Color(0xFF7C2D12),
      orange200: Color(0xFF9A3412),
      orange300: Color(0xFFC2410C),
      orange400: Color(0xFFEA580C),
      orange500: Color(0xFFF97316),
      orange600: Color(0xFFFB923C),
      orange700: Color(0xFFFDBB74),
      orange800: Color(0xFFFED7AA),
      orange900: Color(0xFFFFEDD5),
      orange950: Color(0xFFFFF7ED),

      // Red Colors (inverted for dark mode)
      red50: Color(0xFF450A0A),
      red100: Color(0xFF7F1D1D),
      red200: Color(0xFF991B1B),
      red300: Color(0xFFB91C1C),
      red400: Color(0xFFDC2626),
      red500: Color(0xFFEF4444),
      red600: Color(0xFFF87171),
      red700: Color(0xFFFCA5A5),
      red800: Color(0xFFFECACA),
      red900: Color(0xFFFEE2E2),
      red950: Color(0xFFFEF2F2),

      // Pink Colors (inverted for dark mode)
      pink50: Color(0xFF500724),
      pink100: Color(0xFF831843),
      pink200: Color(0xFF9D174D),
      pink300: Color(0xFFBE185D),
      pink400: Color(0xFFDB2777),
      pink500: Color(0xFFEC4899),
      pink600: Color(0xFFF472B6),
      pink700: Color(0xFFF9A8D4),
      pink800: Color(0xFFFBCFE8),
      pink900: Color(0xFFFCE7F3),
      pink950: Color(0xFFFDF2F8),

      // Fill Colors
      fillPrimary: Color(0xFF111827),
      fillSecondary: Color(0xFF1F2937),
      fillTertiary: Color(0xFF374151),
      fillQuaternary: Color(0xFF4B5563),

      // Stroke Colors
      strokePrimary: Color(0xFF374151),
      strokeSecondary: Color(0xFF4B5563),

      // Background Colors
      bgB0: Color(0xFF030712),
      bgB1: Color(0xFF111827),
      bgB2: Color(0xFF1F2937),
      bgB3: Color(0xFF374151),

      // Surface colors
      surface: Color(0xFF111827),
      surfaceCard: Color(0xFF1F2937),

      // Button/Interactive colors
      inactiveButton: Color(0xFF374151),
      activeButton: Color(0xFF8B5CF6),
      buttonTertiary: Color(0xFF1F2937),
      buttonSecondary: Color(0xFF374151),

      // Icon colors
      iconRed: Color(0xFFEF4444),
      iconBlue: Color(0xFF60A5FA),
      textHighlightBlue: Color(0xFF93C5FD),

      // Miscellaneous colors
      contrastBlack: Color(0xFF000000),
      contrastWhite: Color(0xFFFFFFFF),
    );
  }

  @override
  ThemeExtension<ColorSystemExtension> copyWith({
    // Constant/Brand Colors
    Color? constantDefault,
    Color? constantContrast,

    // Brand Colors
    Color? brandDefault,
    Color? brandContrast,
    Color? brandHover,
    Color? brandActive,
    Color? brandStroke,
    Color? brandFill,

    // Text Colors
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textQuaternary,

    // Blue Colors
    Color? blue50,
    Color? blue100,
    Color? blue200,
    Color? blue300,
    Color? blue400,
    Color? blue500,
    Color? blue600,
    Color? blue700,
    Color? blue800,
    Color? blue900,
    Color? blue950,

    // Green Colors
    Color? green50,
    Color? green100,
    Color? green200,
    Color? green300,
    Color? green400,
    Color? green500,
    Color? green600,
    Color? green700,
    Color? green800,
    Color? green900,
    Color? green950,

    // Gray Colors
    Color? gray50,
    Color? gray100,
    Color? gray200,
    Color? gray300,
    Color? gray400,
    Color? gray500,
    Color? gray600,
    Color? gray700,
    Color? gray800,
    Color? gray900,
    Color? gray950,

    // Yellow Colors
    Color? yellow50,
    Color? yellow100,
    Color? yellow200,
    Color? yellow300,
    Color? yellow400,
    Color? yellow500,
    Color? yellow600,
    Color? yellow700,
    Color? yellow800,
    Color? yellow900,
    Color? yellow950,

    // Orange Colors
    Color? orange50,
    Color? orange100,
    Color? orange200,
    Color? orange300,
    Color? orange400,
    Color? orange500,
    Color? orange600,
    Color? orange700,
    Color? orange800,
    Color? orange900,
    Color? orange950,

    // Red Colors
    Color? red50,
    Color? red100,
    Color? red200,
    Color? red300,
    Color? red400,
    Color? red500,
    Color? red600,
    Color? red700,
    Color? red800,
    Color? red900,
    Color? red950,

    // Pink Colors
    Color? pink50,
    Color? pink100,
    Color? pink200,
    Color? pink300,
    Color? pink400,
    Color? pink500,
    Color? pink600,
    Color? pink700,
    Color? pink800,
    Color? pink900,
    Color? pink950,

    // Fill Colors
    Color? fillPrimary,
    Color? fillSecondary,
    Color? fillTertiary,
    Color? fillQuaternary,

    // Stroke Colors
    Color? strokePrimary,
    Color? strokeSecondary,

    // Background Colors
    Color? bgB0,
    Color? bgB1,
    Color? bgB2,
    Color? bgB3,

    // Surface colors
    Color? surface,
    Color? surfaceCard,

    // Button/Interactive colors
    Color? inactiveButton,
    Color? activeButton,
    Color? buttonTertiary,
    Color? buttonSecondary,

    // Icon colors
    Color? iconRed,
    Color? iconBlue,
    Color? textHighlightBlue,

    // Miscellaneous colors
    Color? contrastBlack,
    Color? contrastWhite,
  }) {
    return ColorSystemExtension(
      // Constant/Brand Colors
      constantDefault: constantDefault ?? this.constantDefault,
      constantContrast: constantContrast ?? this.constantContrast,

      // Brand Colors
      brandDefault: brandDefault ?? this.brandDefault,
      brandContrast: brandContrast ?? this.brandContrast,
      brandHover: brandHover ?? this.brandHover,
      brandActive: brandActive ?? this.brandActive,
      brandStroke: brandStroke ?? this.brandStroke,
      brandFill: brandFill ?? this.brandFill,

      // Text Colors
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textQuaternary: textQuaternary ?? this.textQuaternary,

      // Blue Colors
      blue50: blue50 ?? this.blue50,
      blue100: blue100 ?? this.blue100,
      blue200: blue200 ?? this.blue200,
      blue300: blue300 ?? this.blue300,
      blue400: blue400 ?? this.blue400,
      blue500: blue500 ?? this.blue500,
      blue600: blue600 ?? this.blue600,
      blue700: blue700 ?? this.blue700,
      blue800: blue800 ?? this.blue800,
      blue900: blue900 ?? this.blue900,
      blue950: blue950 ?? this.blue950,

      // Green Colors
      green50: green50 ?? this.green50,
      green100: green100 ?? this.green100,
      green200: green200 ?? this.green200,
      green300: green300 ?? this.green300,
      green400: green400 ?? this.green400,
      green500: green500 ?? this.green500,
      green600: green600 ?? this.green600,
      green700: green700 ?? this.green700,
      green800: green800 ?? this.green800,
      green900: green900 ?? this.green900,
      green950: green950 ?? this.green950,

      // Gray Colors
      gray50: gray50 ?? this.gray50,
      gray100: gray100 ?? this.gray100,
      gray200: gray200 ?? this.gray200,
      gray300: gray300 ?? this.gray300,
      gray400: gray400 ?? this.gray400,
      gray500: gray500 ?? this.gray500,
      gray600: gray600 ?? this.gray600,
      gray700: gray700 ?? this.gray700,
      gray800: gray800 ?? this.gray800,
      gray900: gray900 ?? this.gray900,
      gray950: gray950 ?? this.gray950,

      // Yellow Colors
      yellow50: yellow50 ?? this.yellow50,
      yellow100: yellow100 ?? this.yellow100,
      yellow200: yellow200 ?? this.yellow200,
      yellow300: yellow300 ?? this.yellow300,
      yellow400: yellow400 ?? this.yellow400,
      yellow500: yellow500 ?? this.yellow500,
      yellow600: yellow600 ?? this.yellow600,
      yellow700: yellow700 ?? this.yellow700,
      yellow800: yellow800 ?? this.yellow800,
      yellow900: yellow900 ?? this.yellow900,
      yellow950: yellow950 ?? this.yellow950,

      // Orange Colors
      orange50: orange50 ?? this.orange50,
      orange100: orange100 ?? this.orange100,
      orange200: orange200 ?? this.orange200,
      orange300: orange300 ?? this.orange300,
      orange400: orange400 ?? this.orange400,
      orange500: orange500 ?? this.orange500,
      orange600: orange600 ?? this.orange600,
      orange700: orange700 ?? this.orange700,
      orange800: orange800 ?? this.orange800,
      orange900: orange900 ?? this.orange900,
      orange950: orange950 ?? this.orange950,

      // Red Colors
      red50: red50 ?? this.red50,
      red100: red100 ?? this.red100,
      red200: red200 ?? this.red200,
      red300: red300 ?? this.red300,
      red400: red400 ?? this.red400,
      red500: red500 ?? this.red500,
      red600: red600 ?? this.red600,
      red700: red700 ?? this.red700,
      red800: red800 ?? this.red800,
      red900: red900 ?? this.red900,
      red950: red950 ?? this.red950,

      // Pink Colors
      pink50: pink50 ?? this.pink50,
      pink100: pink100 ?? this.pink100,
      pink200: pink200 ?? this.pink200,
      pink300: pink300 ?? this.pink300,
      pink400: pink400 ?? this.pink400,
      pink500: pink500 ?? this.pink500,
      pink600: pink600 ?? this.pink600,
      pink700: pink700 ?? this.pink700,
      pink800: pink800 ?? this.pink800,
      pink900: pink900 ?? this.pink900,
      pink950: pink950 ?? this.pink950,

      // Fill Colors
      fillPrimary: fillPrimary ?? this.fillPrimary,
      fillSecondary: fillSecondary ?? this.fillSecondary,
      fillTertiary: fillTertiary ?? this.fillTertiary,
      fillQuaternary: fillQuaternary ?? this.fillQuaternary,

      // Stroke Colors
      strokePrimary: strokePrimary ?? this.strokePrimary,
      strokeSecondary: strokeSecondary ?? this.strokeSecondary,

      // Background Colors
      bgB0: bgB0 ?? this.bgB0,
      bgB1: bgB1 ?? this.bgB1,
      bgB2: bgB2 ?? this.bgB2,
      bgB3: bgB3 ?? this.bgB3,

      // Surface colors
      surface: surface ?? this.surface,
      surfaceCard: surfaceCard ?? this.surfaceCard,

      // Button/Interactive colors
      inactiveButton: inactiveButton ?? this.inactiveButton,
      activeButton: activeButton ?? this.activeButton,
      buttonTertiary: buttonTertiary ?? this.buttonTertiary,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,

      // Icon colors
      iconRed: iconRed ?? this.iconRed,
      iconBlue: iconBlue ?? this.iconBlue,
      textHighlightBlue: textHighlightBlue ?? this.textHighlightBlue,

      // Miscellaneous colors
      contrastBlack: contrastBlack ?? this.contrastBlack,
      contrastWhite: contrastWhite ?? this.contrastWhite,
    );
  }

  @override
  ThemeExtension<ColorSystemExtension> lerp(
    covariant ThemeExtension<ColorSystemExtension>? other,
    double t,
  ) {
    if (other is! ColorSystemExtension) {
      return this;
    }

    return ColorSystemExtension(
      // Constant/Brand Colors
      constantDefault: Color.lerp(constantDefault, other.constantDefault, t)!,
      constantContrast:
          Color.lerp(constantContrast, other.constantContrast, t)!,

      // Brand Colors
      brandDefault: Color.lerp(brandDefault, other.brandDefault, t)!,
      brandContrast: Color.lerp(brandContrast, other.brandContrast, t)!,
      brandHover: Color.lerp(brandHover, other.brandHover, t)!,
      brandActive: Color.lerp(brandActive, other.brandActive, t)!,
      brandStroke: Color.lerp(brandStroke, other.brandStroke, t)!,
      brandFill: Color.lerp(brandFill, other.brandFill, t)!,

      // Text Colors
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textQuaternary: Color.lerp(textQuaternary, other.textQuaternary, t)!,

      // Blue Colors
      blue50: Color.lerp(blue50, other.blue50, t)!,
      blue100: Color.lerp(blue100, other.blue100, t)!,
      blue200: Color.lerp(blue200, other.blue200, t)!,
      blue300: Color.lerp(blue300, other.blue300, t)!,
      blue400: Color.lerp(blue400, other.blue400, t)!,
      blue500: Color.lerp(blue500, other.blue500, t)!,
      blue600: Color.lerp(blue600, other.blue600, t)!,
      blue700: Color.lerp(blue700, other.blue700, t)!,
      blue800: Color.lerp(blue800, other.blue800, t)!,
      blue900: Color.lerp(blue900, other.blue900, t)!,
      blue950: Color.lerp(blue950, other.blue950, t)!,

      // Green Colors
      green50: Color.lerp(green50, other.green50, t)!,
      green100: Color.lerp(green100, other.green100, t)!,
      green200: Color.lerp(green200, other.green200, t)!,
      green300: Color.lerp(green300, other.green300, t)!,
      green400: Color.lerp(green400, other.green400, t)!,
      green500: Color.lerp(green500, other.green500, t)!,
      green600: Color.lerp(green600, other.green600, t)!,
      green700: Color.lerp(green700, other.green700, t)!,
      green800: Color.lerp(green800, other.green800, t)!,
      green900: Color.lerp(green900, other.green900, t)!,
      green950: Color.lerp(green950, other.green950, t)!,

      // Gray Colors
      gray50: Color.lerp(gray50, other.gray50, t)!,
      gray100: Color.lerp(gray100, other.gray100, t)!,
      gray200: Color.lerp(gray200, other.gray200, t)!,
      gray300: Color.lerp(gray300, other.gray300, t)!,
      gray400: Color.lerp(gray400, other.gray400, t)!,
      gray500: Color.lerp(gray500, other.gray500, t)!,
      gray600: Color.lerp(gray600, other.gray600, t)!,
      gray700: Color.lerp(gray700, other.gray700, t)!,
      gray800: Color.lerp(gray800, other.gray800, t)!,
      gray900: Color.lerp(gray900, other.gray900, t)!,
      gray950: Color.lerp(gray950, other.gray950, t)!,

      // Yellow Colors
      yellow50: Color.lerp(yellow50, other.yellow50, t)!,
      yellow100: Color.lerp(yellow100, other.yellow100, t)!,
      yellow200: Color.lerp(yellow200, other.yellow200, t)!,
      yellow300: Color.lerp(yellow300, other.yellow300, t)!,
      yellow400: Color.lerp(yellow400, other.yellow400, t)!,
      yellow500: Color.lerp(yellow500, other.yellow500, t)!,
      yellow600: Color.lerp(yellow600, other.yellow600, t)!,
      yellow700: Color.lerp(yellow700, other.yellow700, t)!,
      yellow800: Color.lerp(yellow800, other.yellow800, t)!,
      yellow900: Color.lerp(yellow900, other.yellow900, t)!,
      yellow950: Color.lerp(yellow950, other.yellow950, t)!,

      // Orange Colors
      orange50: Color.lerp(orange50, other.orange50, t)!,
      orange100: Color.lerp(orange100, other.orange100, t)!,
      orange200: Color.lerp(orange200, other.orange200, t)!,
      orange300: Color.lerp(orange300, other.orange300, t)!,
      orange400: Color.lerp(orange400, other.orange400, t)!,
      orange500: Color.lerp(orange500, other.orange500, t)!,
      orange600: Color.lerp(orange600, other.orange600, t)!,
      orange700: Color.lerp(orange700, other.orange700, t)!,
      orange800: Color.lerp(orange800, other.orange800, t)!,
      orange900: Color.lerp(orange900, other.orange900, t)!,
      orange950: Color.lerp(orange950, other.orange950, t)!,

      // Red Colors
      red50: Color.lerp(red50, other.red50, t)!,
      red100: Color.lerp(red100, other.red100, t)!,
      red200: Color.lerp(red200, other.red200, t)!,
      red300: Color.lerp(red300, other.red300, t)!,
      red400: Color.lerp(red400, other.red400, t)!,
      red500: Color.lerp(red500, other.red500, t)!,
      red600: Color.lerp(red600, other.red600, t)!,
      red700: Color.lerp(red700, other.red700, t)!,
      red800: Color.lerp(red800, other.red800, t)!,
      red900: Color.lerp(red900, other.red900, t)!,
      red950: Color.lerp(red950, other.red950, t)!,

      // Pink Colors
      pink50: Color.lerp(pink50, other.pink50, t)!,
      pink100: Color.lerp(pink100, other.pink100, t)!,
      pink200: Color.lerp(pink200, other.pink200, t)!,
      pink300: Color.lerp(pink300, other.pink300, t)!,
      pink400: Color.lerp(pink400, other.pink400, t)!,
      pink500: Color.lerp(pink500, other.pink500, t)!,
      pink600: Color.lerp(pink600, other.pink600, t)!,
      pink700: Color.lerp(pink700, other.pink700, t)!,
      pink800: Color.lerp(pink800, other.pink800, t)!,
      pink900: Color.lerp(pink900, other.pink900, t)!,
      pink950: Color.lerp(pink950, other.pink950, t)!,

      // Fill Colors
      fillPrimary: Color.lerp(fillPrimary, other.fillPrimary, t)!,
      fillSecondary: Color.lerp(fillSecondary, other.fillSecondary, t)!,
      fillTertiary: Color.lerp(fillTertiary, other.fillTertiary, t)!,
      fillQuaternary: Color.lerp(fillQuaternary, other.fillQuaternary, t)!,

      // Stroke Colors
      strokePrimary: Color.lerp(strokePrimary, other.strokePrimary, t)!,
      strokeSecondary: Color.lerp(strokeSecondary, other.strokeSecondary, t)!,

      // Background Colors
      bgB0: Color.lerp(bgB0, other.bgB0, t)!,
      bgB1: Color.lerp(bgB1, other.bgB1, t)!,
      bgB2: Color.lerp(bgB2, other.bgB2, t)!,
      bgB3: Color.lerp(bgB3, other.bgB3, t)!,

      // Surface colors
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceCard: Color.lerp(surfaceCard, other.surfaceCard, t)!,

      // Button/Interactive colors
      inactiveButton: Color.lerp(inactiveButton, other.inactiveButton, t)!,
      activeButton: Color.lerp(activeButton, other.activeButton, t)!,
      buttonTertiary: Color.lerp(buttonTertiary, other.buttonTertiary, t)!,
      buttonSecondary: Color.lerp(buttonSecondary, other.buttonSecondary, t)!,

      // Icon colors
      iconRed: Color.lerp(iconRed, other.iconRed, t)!,
      iconBlue: Color.lerp(iconBlue, other.iconBlue, t)!,
      textHighlightBlue:
          Color.lerp(textHighlightBlue, other.textHighlightBlue, t)!,

      // Miscellaneous colors
      contrastBlack: Color.lerp(contrastBlack, other.contrastBlack, t)!,
      contrastWhite: Color.lerp(contrastWhite, other.contrastWhite, t)!,
    );
  }
}

/// Extension to create a ColorScheme from ColorSystemExtension.
extension ColorSchemeBuilder on ColorSystemExtension {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: blue500,
      onPrimary: constantContrast,
      secondary: green500,
      onSecondary: constantContrast,
      tertiary: orange500,
      onTertiary: textPrimary,
      error: red500,
      onError: constantContrast,
      surface: bgB0,
      onSurface: textPrimary,
      surfaceTint: blue500.withValues(alpha: 0.05),
    );
  }
}

/// Helper extension for semantic color usage
extension ColorSystemSemantics on ColorSystemExtension {
  // Semantic color getters for common use cases
  Color get success => green500;
  Color get warning => yellow500;
  Color get danger => red500;
  Color get info => blue500;

  // Interactive states
  Color get hover => brandHover;
  Color get active => brandActive;
  Color get focus => blue600;
  Color get disabled => gray400;

  // Status colors
  Color get successBackground => green50;
  Color get warningBackground => yellow50;
  Color get dangerBackground => red50;
  Color get infoBackground => blue50;

  Color get successBorder => green200;
  Color get warningBorder => yellow200;
  Color get dangerBorder => red200;
  Color get infoBorder => blue200;
}
