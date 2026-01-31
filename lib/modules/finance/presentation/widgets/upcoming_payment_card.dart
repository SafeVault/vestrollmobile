import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/upcoming_payment_model.dart';

class UpcomingPaymentCard extends StatelessWidget {
  final UpcomingPayment payment;
  final VoidCallback? onTap;

  const UpcomingPaymentCard({super.key, required this.payment, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return InkWell(
      onTap:
          onTap ??
          () {
            if (payment.type == PaymentType.contract) {
              context.pushNamed(RouteConstants.contractPaymentDetails);
            } else {
              context.pushNamed(RouteConstants.invoiceDetails);
            }
          },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colors.bgB0,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: colors.gray100.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildIcon(colors),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    payment.title,
                    style: fonts.textMdBold.copyWith(
                      color: colors.textPrimary,
                      fontSize: 15.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Est. date: ${_formatDate(payment.estimatedDate)}',
                    style: fonts.textSmRegular.copyWith(
                      color: colors.textSecondary,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  payment.amountWithCurrency,
                  style: fonts.textMdBold.copyWith(
                    color: colors.textPrimary,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                _buildStatus(colors, fonts),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(ColorSystemExtension colors) {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: payment.iconBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(payment.icon, color: colors.constantContrast, size: 20.sp),
    );
  }

  Widget _buildStatus(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final bool isOverdue = payment.status == UpcomingPaymentStatus.overdue;
    final Color statusColor = isOverdue ? colors.orange600 : colors.blue600;
    final String statusText =
        isOverdue ? 'Overdue' : 'In ${payment.daysRemaining ?? 0} days';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6.w,
          height: 6.h,
          decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
        ),
        SizedBox(width: 6.w),
        Text(
          statusText,
          style: fonts.textSmBold.copyWith(color: statusColor, fontSize: 13.sp),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
