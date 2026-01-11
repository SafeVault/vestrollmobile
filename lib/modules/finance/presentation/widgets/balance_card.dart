import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class BalanceCard extends StatelessWidget {
  final bool showBalance;
  final VoidCallback onToggleVisibility;

  const BalanceCard({
    required this.showBalance,
    required this.onToggleVisibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.strokeSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total balance',
                style: fonts.textSmRegular.copyWith(
                  fontSize: 12.sp,
                  color: colors.textSecondary,
                ),
              ),
              GestureDetector(
                onTap: onToggleVisibility,
                child: Icon(
                  Icons.expand_more,
                  color: colors.textPrimary,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            showBalance ? '\$0.00' : '••••••',
            style: fonts.heading2Bold.copyWith(
              fontSize: 32.sp,
              color: colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
