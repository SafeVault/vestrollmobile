// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class TotalBalanceCard extends StatelessWidget {
  final double balance;
  final double percentageChange;
  final double amountChange;
  final VoidCallback? onTap;

  const TotalBalanceCard({
    super.key,
    this.balance = 0.00,
    this.percentageChange = 0.00,
    this.amountChange = 0.00,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: colors.bgB0,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total balance',
                    style: fonts.textSmRegular.copyWith(
                      fontSize: 14.sp,
                      color: colors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '\$${balance.toStringAsFixed(2)}',
                    style: fonts.textSmSemiBold.copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: colors.textPrimary,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${percentageChange >= 0 ? '' : '-'}${percentageChange.abs().toStringAsFixed(2)}% (\$${amountChange.toStringAsFixed(2)})',
                    style: fonts.textSmRegular.copyWith(
                      fontSize: 14.sp,
                      color: colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: colors.textSecondary, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
