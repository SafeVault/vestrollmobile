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
          color:
              colors
                  .bgB0, // Figma shows it as slightly off-white or white with a light border
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.strokePrimary.withOpacity(0.5)),
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
                    '\$${balance.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                    style: fonts.heading1Bold.copyWith(
                      fontSize: 32.sp,
                      color: colors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '${percentageChange < 0 ? '-' : '+'}${percentageChange.abs().toStringAsFixed(4)}% (\$${amountChange.toStringAsFixed(2)})',
                    style: fonts.textSmMedium.copyWith(
                      fontSize: 14.sp,
                      color:
                          percentageChange < 0
                              ? colors.red500
                              : colors.green500,
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
