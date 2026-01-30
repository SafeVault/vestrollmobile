import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class OnboardingProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0

  const OnboardingProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Row(
      children: [
        Text(
          '${(progress * 100).toInt()}%',
          style: fonts.textMdBold.copyWith(
            color: colors.textPrimary,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: colors.gray100,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.brandContrast,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
