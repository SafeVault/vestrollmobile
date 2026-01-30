// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
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
              fontSize: 16.sp,
              color: colors.textPrimary,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 96.h,
            decoration: BoxDecoration(
              color: colors.bgB0,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: colors.strokePrimary.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _QuickActionItem(
                    assetImage: AppAssets.contractHome,
                    label: 'Contract',
                    onTap: onContractTap,
                  ),
                ),
                Container(
                  width: 1.w,
                  height: 40.h,
                  color: colors.strokeSecondary.withOpacity(0.5),
                ),
                Expanded(
                  child: _QuickActionItem(
                    assetImage: AppAssets.invoiceHome,
                    label: 'Invoice',
                    onTap: onInvoiceTap,
                  ),
                ),
                Container(
                  width: 1.w,
                  height: 40.h,
                  color: colors.strokeSecondary.withOpacity(0.5),
                ),
                Expanded(
                  child: _QuickActionItem(
                    assetImage: AppAssets.quickpayHome,
                    label: 'Quickpay',
                    onTap: onQuickpayTap,
                  ),
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
  final String assetImage;
  final String label;
  final VoidCallback? onTap;

  const _QuickActionItem({
    required this.assetImage,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetImage, width: 32.sp, height: 32.sp),
          SizedBox(height: 8.h),
          Text(
            label,
            style: fonts.textSmMedium.copyWith(
              fontSize: 12.sp,
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
