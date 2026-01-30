import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/transaction_model.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback? onTap;

  const TransactionListItem({super.key, required this.transaction, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: transaction.iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(transaction.icon, color: Colors.white, size: 20.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: fonts.textMdSemiBold.copyWith(
                      color: colors.textPrimary,
                      fontSize: 15.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    transaction.time,
                    style: fonts.textSmRegular.copyWith(
                      color: colors.textSecondary,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  transaction.amount,
                  style: fonts.textMdSemiBold.copyWith(
                    color: colors.textPrimary,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                _buildStatusBadge(transaction, colors, fonts),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(
    Transaction transaction,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: transaction.getStatusColor(),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          transaction.getStatusText(),
          style: fonts.textXsRegular.copyWith(
            color: transaction.getStatusColor(),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
