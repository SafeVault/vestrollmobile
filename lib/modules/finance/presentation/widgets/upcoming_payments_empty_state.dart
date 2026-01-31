import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class UpcomingPaymentsEmptyState extends StatelessWidget {
  const UpcomingPaymentsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEmptyStateIllustration(colors),
            SizedBox(height: 16.h),
            Text(
              'No upcoming transactions yet',
              style: fonts.textLgBold.copyWith(
                color: colors.textPrimary,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            Text(
              'Once payments are scheduled, you’ll see them\nhere.',
              style: fonts.textMdRegular.copyWith(
                color: colors.textSecondary,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyStateIllustration(ColorSystemExtension colors) {
    return Container(
      width: 180.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: colors.gray50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Simplified Receipt/Register illustration using icons since SVG is not confirmed
          Icon(
            Icons.receipt_long_rounded,
            size: 80.sp,
            color: colors.gray300.withOpacity(0.5),
          ),
          Positioned(
            top: 30.h,
            right: 40.w,
            child: Icon(
              Icons.auto_awesome,
              size: 20.sp,
              color: colors.gray300.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 45.w,
            child: Icon(
              Icons.auto_awesome,
              size: 14.sp,
              color: colors.gray300.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
