import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';
import 'package:vestrollmobile/shared/widgets/secondary.dart';

enum ExpenseStatus { awaitingApproval, approved, declined }

class ExpenseDetailsScreen extends StatefulWidget {
  const ExpenseDetailsScreen({super.key});

  @override
  State<ExpenseDetailsScreen> createState() => _ExpenseDetailsScreenState();
}

class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
  // Toggle this to see different states from the screenshot
  ExpenseStatus _status = ExpenseStatus.awaitingApproval;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: VestrollAppBar(
        title: 'Expense details',
        isBack: true,
        actions: [
          if (_status == ExpenseStatus.awaitingApproval)
            IconButton(
              onPressed: () => _showDeleteConfirmation(context, colors, fonts),
              icon: Icon(Icons.delete_outline_rounded, color: colors.red500),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildMainDetails(colors, fonts),
            SizedBox(height: 16.h),
            _buildAttachmentSection(colors, fonts),
            if (_status == ExpenseStatus.declined) ...[
              SizedBox(height: 16.h),
              _buildDeclinedNote(colors, fonts),
            ],
            SizedBox(height: 40.h),
            if (_status == ExpenseStatus.awaitingApproval)
              SecondaryButton(
                text: 'Delete expense',
                textColor: colors.red500,
                onPressed: () => _showDeleteConfirmation(context, colors, fonts),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainDetails(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          _buildInfoRow('Status', _buildStatusBadge(fonts), colors, fonts),
          SizedBox(height: 16.h),
          _buildInfoRow('Title', _buildTextValue('Macbook Pro & Web App Redesign'), colors, fonts),
          SizedBox(height: 16.h),
          _buildInfoRow('Category', _buildTextValue('Software / Tools'), colors, fonts),
          SizedBox(height: 16.h),
          _buildInfoRow('Payment date', _buildTextValue('15 May 2025'), colors, fonts),
          SizedBox(height: 16.h),
          _buildInfoRow('Submitted date', _buildTextValue('16 May 2025'), colors, fonts),
          SizedBox(height: 16.h),
          _buildInfoRow('Amount', _buildTextValue('10 USDT'), colors, fonts),
          SizedBox(height: 16.h),
          _buildInfoRow(
            'Description',
            _buildTextValue(
              'Macbook Pro performance tools and web app UI design license for 1 year subscription.',
            ),
            colors,
            fonts,
            isMultiline: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    Widget value,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts, {
    bool isMultiline = false,
  }) {
    return Row(
      crossAxisAlignment: isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            label,
            style: fonts.textSmRegular.copyWith(color: colors.textSecondary),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(child: Align(alignment: Alignment.centerRight, child: value)),
      ],
    );
  }

  Widget _buildTextValue(String text) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;
    return Text(
      text,
      style: fonts.textSmBold.copyWith(color: colors.textPrimary),
      textAlign: TextAlign.end,
    );
  }

  Widget _buildStatusBadge(AppFontThemeExtension fonts) {
    Color color;
    String label;
    switch (_status) {
      case ExpenseStatus.approved:
        color = const Color(0xFF22C55E);
        label = 'Approved';
        break;
      case ExpenseStatus.awaitingApproval:
        color = const Color(0xFFF97316);
        label = 'Awaiting Approval';
        break;
      case ExpenseStatus.declined:
        color = const Color(0xFFEF4444);
        label = 'Declined';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: fonts.textXsMedium.copyWith(color: color, fontSize: 11.sp),
      ),
    );
  }

  Widget _buildAttachmentSection(
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
            'Attachment',
            style: fonts.textSmRegular.copyWith(color: colors.textSecondary),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: colors.bgB1,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: colors.strokePrimary),
            ),
            child: Row(
              children: [
                Icon(Icons.picture_as_pdf_rounded, color: colors.red500, size: 24.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'receipt.pdf',
                    style: fonts.textSmMedium.copyWith(color: colors.textPrimary),
                  ),
                ),
                Icon(Icons.open_in_new_rounded, color: colors.textTertiary, size: 18.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeclinedNote(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.red500.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.red500.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline_rounded, color: colors.red500, size: 18.sp),
              SizedBox(width: 8.w),
              Text(
                'Decline Reason',
                style: fonts.textSmBold.copyWith(color: colors.red500),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'This expense was declined because the receipt provided is not clear and does not match the amount specified. Please re-submit with a clearer receipt.',
            style: fonts.textSmRegular.copyWith(color: colors.red500, height: 1.5),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: colors.bgB0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
          title: Text(
            'Delete expense?',
            style: fonts.textLgBold.copyWith(color: colors.textPrimary),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Are you sure you want to delete this expense permanently?',
            style: fonts.textSmRegular.copyWith(color: colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.bgB1,
                      foregroundColor: colors.textPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        side: Border.all(color: colors.strokePrimary),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text('Cancel', style: fonts.textSmBold),
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Pop dialog
                      Navigator.pop(context); // Go back to list
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.red500,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text('Delete expense', style: fonts.textSmBold),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
