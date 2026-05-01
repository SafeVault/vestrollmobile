import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/workspace/presentation/screens/workspace_screen.dart';

class ContractCard extends StatelessWidget {
  final dynamic contract;
  final VoidCallback onTap;

  const ContractCard({super.key, required this.contract, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colors.bgB0,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.strokePrimary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildAvatar(colors, fonts),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contract.title,
                        style: fonts.textMdBold.copyWith(
                          color: colors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        contract.type,
                        style: fonts.textSmRegular.copyWith(
                          color: colors.textSecondary,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildStatusBadge(colors, fonts),
              ],
            ),
            SizedBox(height: 12.h),
            Divider(color: colors.strokePrimary, height: 1.h),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetail(
                  colors,
                  fonts,
                  label: 'Amount',
                  value: contract.amount,
                ),
                _buildDetail(
                  colors,
                  fonts,
                  label: 'Client',
                  value: contract.client,
                  align: TextAlign.center,
                ),
                _buildDetail(
                  colors,
                  fonts,
                  label: 'Due Date',
                  value: contract.date,
                  align: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(ColorSystemExtension colors, AppFontThemeExtension fonts) {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: contract.color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          contract.initials,
          style: fonts.textSmMedium.copyWith(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    Color bgColor;
    Color textColor;
    String label;

    switch (contract.status as ContractStatus) {
      case ContractStatus.active:
        bgColor = colors.green500.withOpacity(0.12);
        textColor = colors.green500;
        label = 'Active';
        break;
      case ContractStatus.pending:
        bgColor = colors.orange500.withOpacity(0.12);
        textColor = colors.orange500;
        label = 'Pending';
        break;
      case ContractStatus.completed:
        bgColor = colors.blue500.withOpacity(0.12);
        textColor = colors.blue500;
        label = 'Completed';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: fonts.textXsMedium.copyWith(
          color: textColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDetail(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts, {
    required String label,
    required String value,
    TextAlign align = TextAlign.left,
  }) {
    return Column(
      crossAxisAlignment: align == TextAlign.left
          ? CrossAxisAlignment.start
          : align == TextAlign.right
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: fonts.textXsMedium.copyWith(
            color: colors.textTertiary,
            fontSize: 11.sp,
          ),
          textAlign: align,
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: fonts.textSmMedium.copyWith(
            color: colors.textPrimary,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
          textAlign: align,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
