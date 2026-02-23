 // ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

enum EmptyStateType {
  contracts,
  transactions,
  payments,
}

class EmptyStateSection extends StatelessWidget {
  final EmptyStateType type;
  final VoidCallback onSeeAll;

  const EmptyStateSection({
    required this.type,
    required this.onSeeAll,
    super.key,
  });

  String _getAssetPath() {
    switch (type) {
      case EmptyStateType.contracts:
        return 'assets/illustrations/empty_contracts.svg';
      case EmptyStateType.transactions:
        return 'assets/illustrations/empty_transactions.svg';
      case EmptyStateType.payments:
        return 'assets/illustrations/empty_payments.svg';
    }
  }

  String _getTitle() {
    switch (type) {
      case EmptyStateType.contracts:
        return 'Contracts';
      case EmptyStateType.transactions:
        return 'Transactions';
      case EmptyStateType.payments:
        return 'Payments';
    }
  }

  String _getMessage() {
    switch (type) {
      case EmptyStateType.contracts:
        return 'No contracts yet. Create your first contract.';
      case EmptyStateType.transactions:
        return 'Transactions will appear here';
      case EmptyStateType.payments:
        return 'No payments yet';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getTitle(),
                style: fonts.heading3Bold.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              InkWell(
                onTap: onSeeAll,
                borderRadius: BorderRadius.circular(4.r),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See all',
                        style: fonts.textSmMedium.copyWith(
                          fontSize: 14.sp,
                          color: colors.brandDefault,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.chevron_right,
                        color: colors.brandDefault,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: colors.bgB0,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  _getAssetPath(),
                  width: 120.w,
                  height: 120.w,
                  placeholderBuilder: (context) => Container(
                    width: 120.w,
                    height: 120.w,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  _getMessage(),
                  style: fonts.textSmRegular.copyWith(
                    fontSize: 14.sp,
                    color: colors.textSecondary,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}