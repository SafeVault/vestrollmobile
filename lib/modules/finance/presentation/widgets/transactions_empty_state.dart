import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class TransactionsEmptyState extends StatelessWidget {
  const TransactionsEmptyState({super.key});

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
            SizedBox(height: 24.h),
            Text(
              'No transactions yet',
              style: fonts.textLgSemiBold.copyWith(
                color: colors.textPrimary,
                fontSize: 17.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Transactions will appear here as you use the\nplatform.',
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
      width: 160.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: colors.gray100.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 80.sp, color: colors.gray300),
          Positioned(
            top: 30.h,
            right: 30.w,
            child: Icon(Icons.auto_awesome, size: 16.sp, color: colors.gray300),
          ),
          Positioned(
            bottom: 40.h,
            left: 35.w,
            child: Icon(Icons.auto_awesome, size: 12.sp, color: colors.gray300),
          ),
        ],
      ),
    );
  }
}
