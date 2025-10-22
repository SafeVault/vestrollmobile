import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/app_font_theme_extension.dart';

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
            style: fonts.textBaseMedium.copyWith(
              color: colors.brandDefault,
              fontSize: 14.sp,
            ),
          ),
        ),
        TextButton(
          onPressed: onForgotPin,
          child: Text(
            'Forgot your PIN?',
            style: fonts.textBaseMedium.copyWith(
              color: colors.brandDefault,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
