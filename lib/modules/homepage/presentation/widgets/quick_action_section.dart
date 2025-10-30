// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class QuickActionsSection extends StatelessWidget {
  final VoidCallback? onContractTap;
  final VoidCallback? onInvoiceTap;
  final VoidCallback? onQuickpayTap;

  const QuickActionsSection({
    super.key,
    this.onContractTap,
    this.onInvoiceTap,
    this.onQuickpayTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Quick actions',
            style: fonts.heading3Bold.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: colors.textPrimary,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 88.h,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _QuickActionItem(
                  icon: Icons.description_outlined,
                  label: 'Contract',
                  iconColor: const Color(0xFF6B3FA0),
                  onTap: onContractTap,
                ),
                Container(
                  width: 1.w,
                  height: 48.h,
                  color: colors.strokeSecondary,
                ),
                _QuickActionItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Invoice',
                  iconColor: const Color(0xFFFF9500),
                  onTap: onInvoiceTap,
                ),
                Container(
                  width: 1.w,
                  height: 60.h,
                  color: colors.strokeSecondary,
                ),
                _QuickActionItem(
                  icon: Icons.payments_outlined,
                  label: 'Quickpay',
                  iconColor: const Color(0xFFE91E63),
                  onTap: onQuickpayTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback? onTap;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 32.sp),
          SizedBox(height: 8.h),
          Text(
            label,
            style: fonts.textSmRegular.copyWith(
              fontSize: 14.sp,
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
