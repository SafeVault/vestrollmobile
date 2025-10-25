import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/app_bar.dart';

class PinLoginHeader extends StatelessWidget {
  final String userName;

  const PinLoginHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBarHeaderWidget(),
        SizedBox(height: 32.h),
        Text(
          'Welcome Back, $userName',
          style: fonts.heading2Bold.copyWith(
            fontSize: 24.sp,
            color: colors.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Please enter your PIN to access your account.',
          style: fonts.textBaseMedium.copyWith(
            fontSize: 14.sp,
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
