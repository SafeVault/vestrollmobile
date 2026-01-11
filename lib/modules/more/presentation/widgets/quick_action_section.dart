// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick actions',
            style: fonts.heading3Bold.copyWith(
              fontSize: 16.sp,
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: colors.bgB0,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: colors.strokeSecondary),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _QuickActionItem(
                  icon: Icons.description_outlined,
                  label: 'Contract',
                  iconColor: colors.brandDefault,
                ),
                _QuickActionItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Invoice',
                  iconColor: const Color(0xFFFF9500),
                ),
                _QuickActionItem(
                  icon: Icons.payment_outlined,
                  label: 'Quickpay',
                  iconColor: const Color(0xFFE91E63),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return Column(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, color: iconColor, size: 24.sp),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: fonts.textSmRegular.copyWith(
            fontSize: 12.sp,
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
