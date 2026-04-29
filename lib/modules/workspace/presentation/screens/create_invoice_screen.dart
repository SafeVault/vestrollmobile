import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/app_textfiled.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({super.key});

  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  final TextEditingController clientController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: const VestrollAppBar(title: 'Create Invoice', isBack: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: clientController,
              label: 'Billed to',
              hintText: 'Select Client',
              readOnly: true,
              suffixIcon: const Icon(Icons.keyboard_arrow_down),
              onTap: () {
                _showAddClientBottomSheet(context, colors, fonts);
              },
            ),
            SizedBox(height: 20.h),
            AppTextField(
              controller: dateController,
              label: 'Date',
              hintText: 'Select date',
              readOnly: true,
              suffixIcon: const Icon(Icons.calendar_today_outlined),
              onTap: () {
                _showSelectDateBottomSheet(context, colors, fonts);
              },
            ),
            SizedBox(height: 32.h),
            Text(
              'Items',
              style: fonts.textLgBold.copyWith(color: colors.textPrimary),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                _showAddItemBottomSheet(context, colors, fonts);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: colors.brandDefault.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: colors.brandDefault.withOpacity(0.2),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: colors.brandDefault, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text(
                      'Add item',
                      style: fonts.textSmMedium.copyWith(
                        color: colors.brandDefault,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),
            PrimaryButton(
              onTap: () {
                context.pushNamed(
                  RouteConstants.invoiceDetails,
                ); // Going to preview or details for now
              },
              title: 'Continue',
              isActive: true,
              text: '',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _showAddClientBottomSheet(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.bgB0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 24.w,
              right: 24.w,
              top: 24.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Client',
                  style: fonts.heading3Bold.copyWith(color: colors.textPrimary),
                ),
                SizedBox(height: 24.h),
                AppTextField(
                  label: 'Client Name',
                  hintText: 'Enter client name',
                  controller: null,
                ),
                SizedBox(height: 16.h),
                AppTextField(
                  label: 'Email',
                  hintText: 'Enter email address',
                  controller: null,
                ),
                SizedBox(height: 32.h),
                PrimaryButton(
                  onTap: () {
                    clientController.text = 'Neurolytix Inc.';
                    Navigator.pop(context);
                  },
                  title: 'Add Client',
                  isActive: true,
                  text: '',
                  onPressed: () {},
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
    );
  }

  void _showSelectDateBottomSheet(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: colors.bgB0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Date',
                  style: fonts.heading3Bold.copyWith(color: colors.textPrimary),
                ),
                SizedBox(height: 24.h),
                // Minimal Calendar Placeholder for now
                SizedBox(
                  height: 200.h,
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (date) {
                      dateController.text =
                          "\${date.day} \${date.month} \${date.year}";
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
    );
  }

  void _showAddItemBottomSheet(
    BuildContext context,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.bgB0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 24.w,
              right: 24.w,
              top: 24.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Item',
                  style: fonts.heading3Bold.copyWith(color: colors.textPrimary),
                ),
                SizedBox(height: 24.h),
                AppTextField(
                  label: 'Item Name',
                  hintText: 'Enter item name',
                  controller: null,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        label: 'Rate',
                        hintText: '0.00',
                        controller: null,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: AppTextField(
                        label: 'Quantity',
                        hintText: '1',
                        controller: null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                PrimaryButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'Add Item',
                  isActive: true,
                  text: '',
                  onPressed: () {},
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
    );
  }
}
