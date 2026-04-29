import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/payment_details_widgets.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/secondary.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

enum InvoiceStatus { pending, paid, overdue }

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  // Toggle this to see different states
  final InvoiceStatus _currentStatus = InvoiceStatus.pending;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: VestrollAppBar(
        title: '#INV-607',
        isBack: true,
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 40.h),
        child: Column(
          children: [
            if (_currentStatus == InvoiceStatus.overdue) ...[
              _buildOverdueBanner(colors, fonts),
              SizedBox(height: 16.h),
            ],
            PaymentDetailsHeader(
              amount: '581',
              currency: 'USDT',
              approxValue: '\$476.19',
              assetPath: AppAssets.invoiceSvg,
              iconBackgroundColor: const Color(0xFFF97316),
            ),
            SizedBox(height: 16.h),
            _buildInvoiceInfoCard(colors, fonts),
            SizedBox(height: 16.h),
            _buildBilledToCard(colors, fonts),
            SizedBox(height: 16.h),
            _buildBilledFromCard(colors, fonts),
            SizedBox(height: 16.h),
            _buildInvoiceBreakdownCard(colors, fonts),
            SizedBox(height: 16.h),
            _buildPaymentTrackerCard(colors, fonts),
            SizedBox(height: 16.h),
            _buildPaymentMemoCard(colors, fonts),
            SizedBox(height: 32.h),
            _buildActionButtons(colors),
          ],
        ),
      ),
    );
  }

  Widget _buildOverdueBanner(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.red500.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoice Overdue',
            style: fonts.textMdBold.copyWith(
              color: colors.red500,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "Check with your client if they've initiated payment for your invoice.",
            style: fonts.textSmRegular.copyWith(
              color: colors.textSecondary,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceInfoCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    Color badgeColor;
    Color badgeTextColor;
    String badgeText;

    switch (_currentStatus) {
      case InvoiceStatus.pending:
        badgeColor = colors.orange500.withOpacity(0.1);
        badgeTextColor = colors.orange500;
        badgeText = 'Pending';
        break;
      case InvoiceStatus.paid:
        badgeColor = colors.green500.withOpacity(0.1);
        badgeTextColor = colors.green500;
        badgeText = 'Paid';
        break;
      case InvoiceStatus.overdue:
        badgeColor = colors.red500.withOpacity(0.1);
        badgeTextColor = colors.red500;
        badgeText = 'Overdue';
        break;
    }

    final items = [
      PaymentInfoItem(
        label: 'Status',
        value: '',
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: badgeColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            badgeText,
            style: fonts.textXsMedium.copyWith(
              color: badgeTextColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      PaymentInfoItem(label: 'Invoice no', value: '#INV-2025-001'),
      PaymentInfoItem(
        label: 'Title',
        value: 'Neurolytix Initial consultation...',
      ),
      PaymentInfoItem(
        label: 'Network',
        value: 'Ethereum',
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.ethereumIcon, width: 16.sp, height: 16.sp),
            SizedBox(width: 4.w),
            Text(
              'Ethereum',
              style: fonts.textMdBold.copyWith(
                color: colors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
      PaymentInfoItem(
        label: 'Asset',
        value: '',
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16.sp,
              height: 16.sp,
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'T',
                  style: fonts.textXsBold.copyWith(
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              'USDT',
              style: fonts.textMdBold.copyWith(
                color: colors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
      PaymentInfoItem(label: 'Issue date', value: '15 April 2025'),
      PaymentInfoItem(label: 'Due date', value: '29 April 2025'),
    ];

    if (_currentStatus == InvoiceStatus.paid) {
      items.addAll([
        PaymentInfoItem(
          label: 'Transaction ID',
          value: '0x684Aafe...60b3',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '0x684Aafe...60b3',
                style: fonts.textMdBold.copyWith(
                  color: colors.textPrimary,
                  fontSize: 14.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.copy_rounded, color: colors.textSecondary, size: 16.sp),
            ],
          ),
        ),
        PaymentInfoItem(label: 'Payment date', value: '29 April 2025'),
      ]);
    }

    return PaymentInfoSection(items: items);
  }

  Widget _buildBilledToCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return _buildContactCard(
      title: 'Billed To',
      name: 'Adegboyega Oluwagbemiro',
      email: 'adeshinaadegboyega@icloud.com',
      phone: '+234 (801) 234 5678',
      country: 'Nigeria',
      address: 'No 8 James Robertson Shittu/\nOgunlana Drive, Surulere | 142261',
      colors: colors,
      fonts: fonts,
    );
  }

  Widget _buildBilledFromCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return _buildContactCard(
      title: 'Billed From',
      name: 'Adegboyega Oluwagbemiro',
      email: 'adeshinaadegboyega@icloud.com',
      phone: '+234 (801) 234 5678',
      country: 'Nigeria',
      address: 'No 8 James Robertson Shittu/\nOgunlana Drive, Surulere | 142261',
      colors: colors,
      fonts: fonts,
    );
  }

  Widget _buildContactCard({
    required String title,
    required String name,
    required String email,
    required String phone,
    required String country,
    required String address,
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: fonts.textMdBold.copyWith(
              color: colors.textPrimary,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 16.h),
          PaymentInfoSection(
            items: [
              PaymentInfoItem(label: 'Name', value: name),
              PaymentInfoItem(label: 'Email', value: email),
              PaymentInfoItem(label: 'Phone no', value: phone),
              PaymentInfoItem(
                label: 'Country',
                value: '',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.w,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      country,
                      style: fonts.textMdBold.copyWith(
                        color: colors.textPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              PaymentInfoItem(
                label: 'Address',
                value: '',
                trailing: Expanded(
                  child: Text(
                    address,
                    style: fonts.textMdBold.copyWith(
                      color: colors.textPrimary,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceBreakdownCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoice Breakdown',
            style: fonts.textMdBold.copyWith(
              color: colors.textPrimary,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 16.h),
          _buildBreakdownItem(
            label: 'Item Name',
            amount: '500 USDT',
            subText: '100 unt/sz at 5 USDT',
            colors: colors,
            fonts: fonts,
          ),
          SizedBox(height: 16.h),
          _buildBreakdownItem(
            label: 'Item Name',
            amount: '80 USDT',
            subText: '10 unt/sz at 8 USDT',
            colors: colors,
            fonts: fonts,
          ),
          SizedBox(height: 16.h),
          Divider(color: colors.strokePrimary, height: 1.h),
          SizedBox(height: 16.h),
          _buildSimpleRow('Subtotal', '580 USDT', colors, fonts, isBold: true),
          SizedBox(height: 16.h),
          _buildSimpleRow('VAT (20%)', '1 USDT', colors, fonts),
          SizedBox(height: 16.h),
          Divider(color: colors.strokePrimary, height: 1.h),
          SizedBox(height: 16.h),
          _buildSimpleRow('Total Amount', '581 USDT', colors, fonts, isBold: true),
        ],
      ),
    );
  }

  Widget _buildBreakdownItem({
    required String label,
    required String amount,
    required String subText,
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: fonts.textMdRegular.copyWith(
            color: colors.textSecondary,
            fontSize: 14.sp,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: fonts.textMdBold.copyWith(
                color: colors.textPrimary,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subText,
              style: fonts.textXsRegular.copyWith(
                color: colors.textTertiary,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSimpleRow(
    String label,
    String value,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? fonts.textMdBold.copyWith(color: colors.textPrimary, fontSize: 14.sp)
              : fonts.textMdRegular.copyWith(color: colors.textSecondary, fontSize: 14.sp),
        ),
        Text(
          value,
          style: fonts.textMdBold.copyWith(
            color: colors.textPrimary,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentTrackerCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    List<TimelineStep> steps = [];

    if (_currentStatus == InvoiceStatus.pending) {
      steps = [
        TimelineStep(
          title: 'Invoice created and sent to client',
          subtitle: '20th April 2025, 04:40 PM',
          isCompleted: true,
        ),
        TimelineStep(
          title: 'Awaiting payment confirmation',
          description:
              'Your client will get invoice access before it is due on [31st May 2025].',
          isActive: true,
          activeIcon: Icons.access_time_rounded,
          activeIconColor: colors.orange500,
          isDashed: true,
        ),
        TimelineStep(title: 'Process your client payment', isDashed: true),
        TimelineStep(
          title:
              'According to your invoice, funds should be reflected in your balance on [31st May 2025].',
        ),
      ];
    } else if (_currentStatus == InvoiceStatus.paid) {
      steps = [
        TimelineStep(
          title: 'Invoice created and sent to client',
          subtitle: '20th April 2025, 04:40 PM',
          isCompleted: true,
        ),
        TimelineStep(
          title: 'Client payment confirmed',
          subtitle: '20th April 2025, 08:40 PM',
          isCompleted: true,
        ),
        TimelineStep(
          title: 'Client payment processed',
          subtitle: '20th April 2025, 08:45 PM',
          isCompleted: true,
        ),
        TimelineStep(
          title: 'Funds received in your account',
          subtitle: '20th April 2025, 08:46 PM',
          isCompleted: true,
        ),
      ];
    } else if (_currentStatus == InvoiceStatus.overdue) {
      steps = [
        TimelineStep(
          title: 'Invoice created and sent to client',
          subtitle: '20th April 2025, 04:40 PM',
          isCompleted: true,
        ),
        TimelineStep(
          title: 'Client payment overdue',
          description:
              'The payment was expected by [31st May 2025] but has not yet been received.',
          isActive: true,
          activeIcon: Icons.warning_amber_rounded,
          activeIconColor: colors.red500,
          isDashed: true,
        ),
        TimelineStep(title: 'Process your client payment', isDashed: true),
        TimelineStep(
          title:
              'According to your invoice, funds should be reflected in your balance on [31st May 2025].',
        ),
      ];
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
            child: Text(
              'Payment Tracker',
              style: fonts.textMdBold.copyWith(
                color: colors.textPrimary,
                fontSize: 15.sp,
              ),
            ),
          ),
          PaymentTimeline(steps: steps),
        ],
      ),
    );
  }

  Widget _buildPaymentMemoCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Memo',
            style: fonts.textMdBold.copyWith(
              color: colors.textPrimary,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Thank you for your business. Please remit payment according to the terms outlined in this invoice. If you have any questions regarding this invoice or the payment process, do not hesitate to contact us.',
            style: fonts.textSmRegular.copyWith(
              color: colors.textSecondary,
              fontSize: 13.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ColorSystemExtension colors) {
    return Row(
      children: [
        Expanded(
          child: SecondaryButton(
            text: 'Preview PDF',
            onPressed: () {},
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: PrimaryButton(
            text: 'Download PDF',
            isEnabled: true,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
