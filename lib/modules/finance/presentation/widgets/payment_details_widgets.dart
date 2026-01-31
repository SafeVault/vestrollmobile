import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class PaymentDetailsHeader extends StatelessWidget {
  final String amount;
  final String currency;
  final String approxValue;
  final String? assetPath;
  final IconData? icon;
  final Color iconBackgroundColor;

  const PaymentDetailsHeader({
    super.key,
    required this.amount,
    required this.currency,
    required this.approxValue,
    this.assetPath,
    this.icon,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child:
                assetPath != null
                    ? Center(
                      child: SvgPicture.asset(
                        assetPath!,
                        width: 28.sp,
                        height: 28.sp,
                        colorFilter: ColorFilter.mode(
                          colors.constantContrast,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                    : Icon(icon, color: colors.constantContrast, size: 28.sp),
          ),
          SizedBox(height: 16.h),
          Text(
            '$amount $currency',
            style: fonts.heading1Bold.copyWith(
              color: colors.textPrimary,
              fontSize: 32.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '≈ $approxValue',
            style: fonts.textMdRegular.copyWith(
              color: colors.textTertiary,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentStatusCard extends StatelessWidget {
  final String status;
  final String estArrivalDate;
  final String network;
  final Widget? networkIcon;
  final bool isOverdue;

  const PaymentStatusCard({
    super.key,
    required this.status,
    required this.estArrivalDate,
    required this.network,
    this.networkIcon,
    this.isOverdue = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          _buildRow('Status', _buildStatusBadge(colors, fonts), fonts, colors),
          SizedBox(height: 16.h),
          _buildRow(
            'Est. arrival date',
            Text(
              estArrivalDate,
              style: fonts.textMdBold.copyWith(
                color: colors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
            fonts,
            colors,
          ),
          SizedBox(height: 16.h),
          _buildRow(
            'Network',
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (networkIcon != null) ...[
                  networkIcon!,
                  SizedBox(width: 8.w),
                ],
                Text(
                  network,
                  style: fonts.textMdBold.copyWith(
                    color: colors.textPrimary,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            fonts,
            colors,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    Widget value,
    AppFontThemeExtension fonts,
    ColorSystemExtension colors,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: fonts.textMdRegular.copyWith(
            color: colors.textSecondary,
            fontSize: 14.sp,
          ),
        ),
        value,
      ],
    );
  }

  Widget _buildStatusBadge(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final Color bgColor = isOverdue ? colors.orange50 : colors.blue50;
    final Color textColor = isOverdue ? colors.orange600 : colors.blue600;
    final Color borderColor = isOverdue ? colors.orange100 : colors.blue100;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        status,
        style: fonts.textXsBold.copyWith(color: textColor, fontSize: 11.sp),
      ),
    );
  }
}

class PaymentInfoSection extends StatelessWidget {
  final List<PaymentInfoItem> items;

  const PaymentInfoSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children:
            items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  _buildInfoRow(item, colors, fonts),
                  if (index < items.length - 1) SizedBox(height: 20.h),
                ],
              );
            }).toList(),
      ),
    );
  }

  Widget _buildInfoRow(
    PaymentInfoItem item,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            item.label,
            style: fonts.textMdRegular.copyWith(
              color: colors.textSecondary,
              fontSize: 14.sp,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  item.value,
                  style: fonts.textMdBold.copyWith(
                    color: colors.textPrimary,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (item.showOpenIcon) ...[
                SizedBox(width: 8.w),
                Icon(
                  Icons.open_in_new_rounded,
                  size: 16.sp,
                  color: colors.textSecondary,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class PaymentInfoItem {
  final String label;
  final String value;
  final bool showOpenIcon;

  PaymentInfoItem({
    required this.label,
    required this.value,
    this.showOpenIcon = false,
  });
}

class PaymentTimeline extends StatelessWidget {
  final List<TimelineStep> steps;

  const PaymentTimeline({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children:
            steps.asMap().entries.map((entry) {
              final index = entry.key;
              final step = entry.value;
              return _buildStep(step, index == steps.length - 1, colors, fonts);
            }).toList(),
      ),
    );
  }

  Widget _buildStep(
    TimelineStep step,
    bool isLast,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIndicator(step, isLast, colors),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: fonts.textMdBold.copyWith(
                    color:
                        step.isCompleted || step.isActive
                            ? colors.textPrimary
                            : colors.textTertiary,
                    fontSize: 14.sp,
                  ),
                ),
                if (step.subtitle != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    step.subtitle!,
                    style: fonts.textSmRegular.copyWith(
                      color: colors.textSecondary,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
                if (step.description != null) ...[
                  SizedBox(height: 8.h),
                  _buildDescription(step.description!, colors, fonts),
                ],
                if (!isLast) SizedBox(height: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(
    TimelineStep step,
    bool isLast,
    ColorSystemExtension colors,
  ) {
    return Column(
      children: [
        if (step.isCompleted)
          Icon(Icons.check_circle, color: colors.green500, size: 20.sp)
        else if (step.isActive)
          Icon(
            step.activeIcon ?? Icons.warning_amber_rounded,
            color: step.activeIconColor ?? colors.orange500,
            size: 20.sp,
          )
        else
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colors.gray200, width: 2),
            ),
          ),
        if (!isLast)
          Expanded(
            child: VerticalDivider(
              color: step.isCompleted ? colors.green500 : colors.gray200,
              thickness: 2,
              width: 20.w,
            ),
          ),
      ],
    );
  }

  Widget _buildDescription(
    String description,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    // This handles the bold text in descriptions like "31 May 2025"
    // Simplified for now, but can be improved with RichText
    return Text(
      description,
      style: fonts.textSmRegular.copyWith(
        color: colors.textSecondary,
        fontSize: 13.sp,
      ),
    );
  }
}

class TimelineStep {
  final String title;
  final String? subtitle;
  final String? description;
  final bool isCompleted;
  final bool isActive;
  final IconData? activeIcon;
  final Color? activeIconColor;

  TimelineStep({
    required this.title,
    this.subtitle,
    this.description,
    this.isCompleted = false,
    this.isActive = false,
    this.activeIcon,
    this.activeIconColor,
  });
}
