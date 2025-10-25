import 'package:flutter/material.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class BottomActions extends StatelessWidget {
  final VoidCallback onLogout;
  final VoidCallback onForgotPin;

  const BottomActions({
    super.key,
    required this.onLogout,
    required this.onForgotPin,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onLogout,
          child: Text(
            'Log out',
            style: fonts.textMdMedium.copyWith(color: colors.brandDefault),
          ),
        ),
        TextButton(
          onPressed: onForgotPin,
          child: Text(
            'Forgot your PIN?',
            style: fonts.textMdMedium.copyWith(color: colors.brandDefault),
          ),
        ),
      ],
    );
  }
}
