import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/transaction_model.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/invoice_breakdown_bottom_sheet.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/payment_details_widgets.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/transaction_action_buttons.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailsScreen({super.key, required this.transaction});

  // ── Helpers ──────────────────────────────────────────────────────────────

  String get _screenTitle {
    switch (transaction.type) {
      case TransactionType.withdrawal:
        return 'Withdrawal';
      case TransactionType.invoice:
        return 'Invoice';
      case TransactionType.contractPayment:
        return 'Contract payment';
      case TransactionType.quickpay:
        return 'Quickpay';
      case TransactionType.all:
        return 'Transaction';
    }
  }

  bool get _isDebit => transaction.type == TransactionType.withdrawal;

  String get _amountPrefix => _isDebit ? '-' : '+';

  String get _rawAmount {
    // Strip leading +/- and spaces from amount string, e.g. "- 581 USDT" → "581"
    return transaction.amount
        .replaceAll(RegExp(r'^[+\-]\s*'), '')
        .split(' ')
        .first
        .trim();
  }

  String get _currency {
    final parts = transaction.amount.replaceAll(RegExp(r'^[+\-]\s*'), '').trim().split(' ');
    return parts.length > 1 ? parts.last : 'USDT';
  }

  /// Build the "Successful" / "Processing" / "Failed" status badge
  Widget _buildStatusBadge(ColorSystemExtension colors, AppFontThemeExtension fonts) {
    final color = transaction.getStatusColor();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        transaction.getStatusText(),
        style: fonts.textSmMedium.copyWith(color: color, fontSize: 13.sp),
      ),
    );
  }

  /// Generic key-value row used inside the transaction info card
  Widget _buildInfoRow(
    String label,
    Widget valueWidget,
    AppFontThemeExtension fonts,
    ColorSystemExtension colors,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110.w,
          child: Text(
            label,
            style: fonts.textMdRegular.copyWith(
              color: colors.textSecondary,
              fontSize: 14.sp,
            ),
          ),
        ),
        Expanded(child: Align(alignment: Alignment.centerRight, child: valueWidget)),
      ],
    );
  }

  /// Builds just a text value widget
  Widget _textValue(String text, AppFontThemeExtension fonts, ColorSystemExtension colors) {
    return Text(
      text,
      style: fonts.textMdBold.copyWith(color: colors.textPrimary, fontSize: 14.sp),
      textAlign: TextAlign.end,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Network row with Ethereum icon
  Widget _buildNetworkRow(
    AppFontThemeExtension fonts,
    ColorSystemExtension colors,
    Widget networkIcon,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        networkIcon,
        SizedBox(width: 8.w),
        Text(
          'Ethereum',
          style: fonts.textMdBold.copyWith(color: colors.textPrimary, fontSize: 14.sp),
        ),
      ],
    );
  }

  /// Clickable Transaction ID row with copy icon
  Widget _buildTxIdRow(
    String txId,
    AppFontThemeExtension fonts,
    ColorSystemExtension colors,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: txId));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaction ID copied'), duration: Duration(seconds: 1)),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            txId,
            style: fonts.textMdBold.copyWith(
              color: colors.textPrimary,
              fontSize: 14.sp,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(width: 6.w),
          Icon(Icons.copy_rounded, size: 14.sp, color: colors.textSecondary),
        ],
      ),
    );
  }

  // ── Timeline ──────────────────────────────────────────────────────────────

  List<TimelineStep> _buildTimeline() {
    switch (transaction.type) {
      case TransactionType.invoice:
        return [
          TimelineStep(
            title: 'Invoice created and sent to client',
            subtitle: '20 April 2025, 04:40 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Client payment confirmed',
            subtitle: '20 April 2025, 08:40 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Client payment processed',
            subtitle: '20 April 2025, 08:45 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Funds received in your account',
            subtitle: '20 April 2025, 08:45 PM',
            isCompleted: true,
          ),
        ];
      case TransactionType.contractPayment:
        return [
          TimelineStep(
            title: 'Contract cycle completed',
            subtitle: '20 April 2025, 04:40 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Client approved contract cycle',
            subtitle: '20 April 2025, 04:40 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Invoice created for this cycle',
            subtitle: '20 April 2025, 04:40 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Client payment confirmed',
            subtitle: '20 April 2025, 08:40 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Client payment processed',
            subtitle: '20 April 2025, 08:45 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Funds received in your account',
            subtitle: '20 April 2025, 08:45 PM',
            isCompleted: true,
          ),
        ];
      case TransactionType.quickpay:
        return [
          TimelineStep(
            title: 'Quickpay request sent',
            subtitle: '20 April 2025, 04:40 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Client payment confirmed',
            subtitle: '20 April 2025, 08:40 PM',
            isCompleted: true,
          ),
          TimelineStep(
            title: 'Funds received in your account',
            subtitle: '20 April 2025, 08:45 PM',
            isCompleted: true,
          ),
        ];
      case TransactionType.withdrawal:
      case TransactionType.all:
        return []; // No timeline for withdrawals
    }
  }

  // ── Info card ─────────────────────────────────────────────────────────────

  Widget _buildInfoCard(BuildContext context, ColorSystemExtension colors, AppFontThemeExtension fonts) {
    final networkIcon = SvgPicture.asset(AppAssets.ethereumIcon, width: 20.sp, height: 20.sp);
    const txId = '0x6885afa...63b3';
    final date = '20 April 2025, 04:40 PM';

    List<Widget> rows = [];

    void addRow(String label, Widget value) {
      if (rows.isNotEmpty) rows.add(SizedBox(height: 16.h));
      rows.add(_buildInfoRow(label, value, fonts, colors));
    }

    // Status row
    addRow('Status', _buildStatusBadge(colors, fonts));

    // Type-specific fields
    switch (transaction.type) {
      case TransactionType.withdrawal:
        addRow('Network', _buildNetworkRow(fonts, colors, networkIcon));
        addRow('To', _textValue('0×6885afa...6f23b3', fonts, colors));
        addRow('Fee', _textValue('0.0010 ETH (≈ \$0.501)', fonts, colors));
        addRow('Transaction ID', _buildTxIdRow(txId, fonts, colors, context));
        addRow('Date', _textValue(date, fonts, colors));
        break;
      case TransactionType.invoice:
        addRow('Invoice', Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('#INV-2025-001',
                style: fonts.textMdBold.copyWith(color: colors.textPrimary, fontSize: 14.sp)),
            SizedBox(width: 6.w),
            Icon(Icons.open_in_new_rounded, size: 14.sp, color: colors.textSecondary),
          ],
        ));
        addRow('Title', _textValue(transaction.title, fonts, colors));
        addRow('Billed to', _textValue('Ore Hassan', fonts, colors));
        addRow('Total amount', _buildTotalAmountRow(context, colors, fonts));
        addRow('Network', _buildNetworkRow(fonts, colors, networkIcon));
        addRow('From', _textValue('0x6885afa...6f23b3', fonts, colors));
        addRow('Transaction ID', _buildTxIdRow(txId, fonts, colors, context));
        addRow('Date', _textValue(date, fonts, colors));
        break;
      case TransactionType.contractPayment:
        addRow('Network', _buildNetworkRow(fonts, colors, networkIcon));
        addRow('From', _textValue('0x6885afa...6f23b3', fonts, colors));
        addRow('Transaction ID', _buildTxIdRow(txId, fonts, colors, context));
        addRow('Date', _textValue(date, fonts, colors));
        break;
      case TransactionType.quickpay:
        addRow('Network', _buildNetworkRow(fonts, colors, networkIcon));
        addRow('From', _textValue('0x6885afa...6f23b3', fonts, colors));
        addRow('Transaction ID', _buildTxIdRow(txId, fonts, colors, context));
        addRow('Date', _textValue(date, fonts, colors));
        break;
      case TransactionType.all:
        break;
    }

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rows,
      ),
    );
  }

  /// "Total amount" row with dropdown chevron that opens the breakdown sheet
  Widget _buildTotalAmountRow(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return GestureDetector(
      onTap: () => _showInvoiceBreakdown(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$_rawAmount $_currency',
            style: fonts.textMdBold.copyWith(color: colors.textPrimary, fontSize: 14.sp),
          ),
          SizedBox(width: 6.w),
          Icon(Icons.keyboard_arrow_down_rounded, size: 18.sp, color: colors.textSecondary),
        ],
      ),
    );
  }

  void _showInvoiceBreakdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => InvoiceBreakdownBottomSheet(
        totalAmount: '$_rawAmount $_currency',
        rate: '$_rawAmount $_currency',
        vat: '0 $_currency',
        vatPercentage: '0%',
      ),
    );
  }

  /// Contract-specific second info card (Contract name, type, Invoice, Client)
  Widget _buildContractCard(BuildContext context, ColorSystemExtension colors, AppFontThemeExtension fonts) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            'Contract',
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    'MintForge Bug fixes and...',
                    style: fonts.textMdBold.copyWith(color: colors.textPrimary, fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 6.w),
                Icon(Icons.open_in_new_rounded, size: 14.sp, color: colors.textSecondary),
              ],
            ),
            fonts,
            colors,
          ),
          SizedBox(height: 16.h),
          _buildInfoRow('Contract type', _textValue('Fixed Rate', fonts, colors), fonts, colors),
          SizedBox(height: 16.h),
          _buildInfoRow(
            'Invoice',
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('#INV-2025-001',
                    style: fonts.textMdBold.copyWith(color: colors.textPrimary, fontSize: 14.sp)),
                SizedBox(width: 6.w),
                Icon(Icons.open_in_new_rounded, size: 14.sp, color: colors.textSecondary),
              ],
            ),
            fonts,
            colors,
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
              'Client', _textValue('Adegboyega Oluwagbemiro', fonts, colors), fonts, colors),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final amountColor = _isDebit ? const Color(0xFFEF4444) : const Color(0xFF22C55E);
    final timeline = _buildTimeline();
    final hasTimeline = timeline.isNotEmpty;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: VestrollAppBar(title: _screenTitle, isBack: true, actions: const []),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  // ── Header card ──────────────────────────────────────────
                  PaymentDetailsHeader(
                    amount: _rawAmount,
                    currency: _currency,
                    approxValue: '\$476.19',
                    icon: transaction.icon,
                    iconBackgroundColor: transaction.iconBackgroundColor,
                    amountColor: amountColor,
                    amountPrefix: _amountPrefix,
                  ),
                  SizedBox(height: 16.h),

                  // ── Status + network info card ────────────────────────────
                  _buildInfoCard(context, colors, Theme.of(context).extension<AppFontThemeExtension>()!),
                  SizedBox(height: 16.h),

                  // ── Contract details card (contract payments only) ─────────
                  if (transaction.type == TransactionType.contractPayment) ...[
                    _buildContractCard(context, colors, Theme.of(context).extension<AppFontThemeExtension>()!),
                    SizedBox(height: 16.h),
                  ],

                  // ── Timeline ─────────────────────────────────────────────
                  if (hasTimeline) ...[
                    PaymentTimeline(steps: timeline),
                    SizedBox(height: 32.h),
                  ],
                ],
              ),
            ),
          ),

          // ── Sticky bottom action buttons ─────────────────────────────────
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w,
                MediaQuery.of(context).padding.bottom + 12.h),
            decoration: BoxDecoration(
              color: colors.bgB1,
              border: Border(top: BorderSide(color: colors.gray200, width: 1)),
            ),
            child: const TransactionActionButtons(),
          ),
        ],
      ),
    );
  }
}
