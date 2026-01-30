import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/onboarding/domain/onboarding_model.dart';

class OnboardingStepItem extends StatelessWidget {
  final OnboardingStep step;
  final VoidCallback? onTap;

  const OnboardingStepItem({super.key, required this.step, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;
    final isCompleted = step.status == OnboardingStatus.completed;

    return GestureDetector(
      onTap: isCompleted ? null : onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: colors.gray100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              step.icon is IconData ? step.icon : Icons.help_outline,
              color: isCompleted ? colors.textTertiary : colors.textPrimary,
              size: 24.sp,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                step.title,
                style: fonts.textMdSemiBold.copyWith(
                  color: isCompleted ? colors.textTertiary : colors.textPrimary,
                  fontSize: 16.sp,
                ),
              ),
            ),
            if (isCompleted)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colors.green50, // Very light green
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(color: colors.green100),
                ),
                child: Text(
                  'Done',
                  style: fonts.textSmBold.copyWith(
                    color: colors.green500,
                    fontSize: 14.sp,
                  ),
                ),
              )
            else
              Icon(
                Icons.arrow_forward_ios,
                color: colors.textPrimary,
                size: 16.sp,
              ),
          ],
        ),
      ),
    );
  }
}
