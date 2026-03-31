import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class InvoiceBreakdownBottomSheet extends StatelessWidget {
  final String totalAmount;
  final String rate;
  final String vat;
  final String vatPercentage;

  const InvoiceBreakdownBottomSheet({
    super.key,
    required this.totalAmount,
    required this.rate,
    required this.vat,
    required this.vatPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 8.h,
        bottom: MediaQuery.of(context).padding.bottom + 24.h,
      ),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: colors.gray200,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Invoice Breakdown',
            style: fonts.heading3Bold.copyWith(
              color: colors.textPrimary,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 32.h),
          _buildRow('Total amount', totalAmount, true, colors, fonts),
          SizedBox(height: 16.h),
          Divider(color: colors.gray200),
          SizedBox(height: 16.h),
          _buildRow('Rate', rate, false, colors, fonts),
          SizedBox(height: 16.h),
          _buildRow('VAT ($vatPercentage)', vat, false, colors, fonts),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value,
    bool isBold,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: (isBold ? fonts.textMdBold : fonts.textMdRegular).copyWith(
            color: isBold ? colors.textPrimary : colors.textSecondary,
            fontSize: 15.sp,
          ),
        ),
        Text(
          value,
          style: (isBold ? fonts.textLgBold : fonts.textMdBold).copyWith(
            color: colors.textPrimary,
            fontSize: isBold ? 18.sp : 15.sp,
          ),
        ),
      ],
    );
  }
}
