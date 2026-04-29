import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/app_textfiled.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Select category';

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: const VestrollAppBar(
        title: 'Add expense',
        isBack: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              label: 'Expense name',
              hintText: 'e.g. Macbook Pro',
              controller: _nameController,
            ),
            SizedBox(height: 20.h),
            _buildCategorySelector(colors, fonts),
            SizedBox(height: 20.h),
            AppTextField(
              label: 'Payment date',
              hintText: 'Select date',
              controller: _dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              suffixIcon: Icon(
                Icons.calendar_month_rounded,
                color: colors.textSecondary,
                size: 20.sp,
              ),
            ),
            SizedBox(height: 20.h),
            AppTextField(
              label: 'Amount',
              hintText: '0.00',
              controller: _amountController,
              keyboardType: TextInputType.number,
              suffixIcon: Padding(
                padding: EdgeInsets.all(12.w),
                child: Text(
                  'USDT',
                  style: fonts.textSmBold.copyWith(color: colors.textTertiary),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            AppTextField(
              label: 'Expense description',
              hintText: 'Enter expense description',
              controller: _descriptionController,
              maxLines: 4,
            ),
            SizedBox(height: 24.h),
            _buildAttachmentSection(colors, fonts),
            SizedBox(height: 40.h),
            PrimaryButton(
              text: 'Submit expense',
              onPressed: () => _submitExpense(context),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySelector(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: fonts.textSmMedium.copyWith(color: colors.textPrimary),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => _showCategoryPicker(context, colors, fonts),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: colors.bgB0,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: colors.strokePrimary),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedCategory,
                  style: fonts.textSmRegular.copyWith(
                    color:
                        _selectedCategory == 'Select category'
                            ? colors.textTertiary
                            : colors.textPrimary,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: colors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAttachmentSection(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachment (Optional)',
          style: fonts.textSmMedium.copyWith(color: colors.textPrimary),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 32.h),
          decoration: BoxDecoration(
            color: colors.bgB0,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: colors.brandDefault.withOpacity(0.2),
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 32.sp,
                color: colors.brandDefault,
              ),
              SizedBox(height: 8.h),
              Text(
                'Upload attachment',
                style: fonts.textSmBold.copyWith(color: colors.brandDefault),
              ),
              SizedBox(height: 4.h),
              Text(
                'Max size 5MB (PDF, JPG, PNG)',
                style: fonts.textXsRegular.copyWith(color: colors.textTertiary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showCategoryPicker(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final categories = [
      'Software / Tools',
      'Office Supplies',
      'Travel',
      'Communication',
      'Marketing',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: colors.bgB0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Category',
                style: fonts.textLgBold.copyWith(color: colors.textPrimary),
              ),
              SizedBox(height: 16.h),
              ...categories.map((cat) {
                return ListTile(
                  title: Text(
                    cat,
                    style: fonts.textMdMedium.copyWith(color: colors.textPrimary),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedCategory = cat;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day} ${_getMonth(picked.month)} ${picked.year}";
      });
    }
  }

  String _getMonth(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  void _submitExpense(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: colors.bgB0,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64.w,
                height: 64.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: const Color(0xFF8B5CF6),
                  size: 32.sp,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Expense submitted',
                style: fonts.textLgBold.copyWith(color: colors.textPrimary),
              ),
              SizedBox(height: 8.h),
              Text(
                'Your expense has been sent to [Client Name] for approval',
                textAlign: TextAlign.center,
                style: fonts.textSmRegular.copyWith(color: colors.textSecondary),
              ),
              SizedBox(height: 32.h),
              PrimaryButton(
                text: 'Done',
                onPressed: () {
                  Navigator.pop(context); // Pop bottom sheet
                  context.pop(); // Go back to list
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }
}
