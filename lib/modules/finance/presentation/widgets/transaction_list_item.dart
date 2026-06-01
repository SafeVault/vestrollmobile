import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/transaction_model.dart';

IconData _mapIcon(String name) {
  switch (name) {
    case 'accountBalanceWallet': return Icons.account_balance_wallet;
    case 'shoppingBag': return Icons.shopping_bag;
    case 'receipt': return Icons.receipt;
    case 'bugReport': return Icons.bug_report;
    case 'payment': return Icons.payment;
    case 'swapHoriz': return Icons.swap_horiz;
    case 'accountBalance': return Icons.account_balance;
    case 'creditCard': return Icons.credit_card;
    case 'designServices': return Icons.design_services;
    case 'arrowUp': return Icons.arrow_upward;
    case 'arrowDown': return Icons.arrow_downward;
    case 'receiptLong': return Icons.receipt_long;
    case 'wallet': return Icons.wallet;
    default: return Icons.help_outline;
  }
}

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
                color: Color(int.parse(transaction.iconBackgroundColor.replaceFirst('#', '0xFF'))),
                shape: BoxShape.circle,
              ),
              child: Icon(_mapIcon(transaction.icon), color: Colors.white, size: 20.sp),
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
  ) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: Color(int.parse(transaction.getStatusColor().replaceFirst('#', '0xFF'))),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          transaction.getStatusText(),
          style: fonts.textXsRegular.copyWith(
            color: Color(int.parse(transaction.getStatusColor().replaceFirst('#', '0xFF'))),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
}
