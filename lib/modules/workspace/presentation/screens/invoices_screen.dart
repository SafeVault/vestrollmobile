import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  int selectedIndex = 0;
  final List<String> filters = ['All', 'Paid', 'Unpaid'];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: VestrollAppBar(
        title: 'Invoices',
        isBack: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: colors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: ChoiceChip(
                    label: Text(filters[index]),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    backgroundColor: colors.bgB1,
                    selectedColor: colors.brandDefault,
                    labelStyle: fonts.textSmMedium.copyWith(
                      color: isSelected ? Colors.white : colors.textSecondary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: BorderSide(
                        color: isSelected ? Colors.transparent : colors.strokeSecondary ?? Colors.grey.shade300,
                      ),
                    ),
                    showCheckmark: false,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: 4,
              itemBuilder: (context, index) {
                final isPaid = index % 2 == 0;
                return _buildInvoiceItem(
                  context,
                  colors: colors,
                  fonts: fonts,
                  clientName: 'To Neurolytix Inc.',
                  invoiceNumber: 'INV-2025-001',
                  date: '20 April',
                  amount: '\$476.19',
                  isPaid: isPaid,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteConstants.createInvoiceScreen);
        },
        backgroundColor: colors.brandDefault,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildInvoiceItem(
    BuildContext context, {
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
    required String clientName,
    required String invoiceNumber,
    required String date,
    required String amount,
    required bool isPaid,
  }) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteConstants.invoiceDetails);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colors.bgB0,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.strokeSecondary ?? Colors.grey.shade200),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF97316).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppAssets.invoiceSvg,
                width: 24.w,
                height: 24.w,
                colorFilter: const ColorFilter.mode(Color(0xFFF97316), BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clientName,
                    style: fonts.textMdBold.copyWith(color: colors.textPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    invoiceNumber,
                    style: fonts.textSmRegular.copyWith(color: colors.textSecondary),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        date,
                        style: fonts.textSmRegular.copyWith(color: colors.textSecondary),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: isPaid ? colors.green500?.withOpacity(0.1) : colors.orange500?.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          isPaid ? 'Paid' : 'Unpaid',
                          style: fonts.textxsMedium?.copyWith(
                            color: isPaid ? colors.green500 : colors.orange500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: fonts.textMdBold.copyWith(color: colors.textPrimary),
                ),
                SizedBox(height: 4.h),
                SvgPicture.asset(
                  AppAssets.usdtLogo,
                  width: 16.w,
                  height: 16.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
