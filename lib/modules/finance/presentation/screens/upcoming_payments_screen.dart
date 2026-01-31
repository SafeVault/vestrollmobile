import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/upcoming_payment_model.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/upcoming_payment_card.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/upcoming_payment_filter_bottom_sheet.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/upcoming_payments_empty_state.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class UpcomingPaymentsScreen extends StatefulWidget {
  const UpcomingPaymentsScreen({super.key});

  @override
  State<UpcomingPaymentsScreen> createState() => _UpcomingPaymentsScreenState();
}

class _UpcomingPaymentsScreenState extends State<UpcomingPaymentsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<UpcomingPayment> _allPayments = [
    UpcomingPayment(
      id: '1',
      title: 'Neurolytix Initial consultation',
      amount: '581',
      currency: 'LUSD',
      estimatedDate: DateTime(2025, 4, 20),
      status: UpcomingPaymentStatus.inDays,
      daysRemaining: 7,
      iconBackgroundColor: const Color(0xFFF97316),
      icon: Icons.receipt_long,
      type: PaymentType.invoice,
    ),
    UpcomingPayment(
      id: '2',
      title: 'MintForge Bug fixes and updates',
      amount: '581',
      currency: 'USDT',
      estimatedDate: DateTime(2025, 4, 20),
      status: UpcomingPaymentStatus.inDays,
      daysRemaining: 7,
      iconBackgroundColor: const Color(0xFF8B5CF6),
      icon: Icons.receipt_long,
      type: PaymentType.contract,
    ),
    UpcomingPayment(
      id: '3',
      title: 'ShopLink Pro UX Audit for project',
      amount: '581',
      currency: 'USDT',
      estimatedDate: DateTime(2025, 4, 20),
      status: UpcomingPaymentStatus.overdue,
      iconBackgroundColor: const Color(0xFFF97316),
      icon: Icons.receipt_long,
      type: PaymentType.invoice,
    ),
    UpcomingPayment(
      id: '4',
      title: 'Brightfolk Payment for concept',
      amount: '50',
      currency: 'EURt',
      estimatedDate: DateTime(2025, 4, 20),
      status: UpcomingPaymentStatus.overdue,
      iconBackgroundColor: const Color(0xFF8B5CF6),
      icon: Icons.receipt_long,
      type: PaymentType.contract,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => UpcomingPaymentFilterBottomSheet(
            onClear: () {
              Navigator.pop(context);
            },
            onShowResults: () {
              Navigator.pop(context);
            },
          ),
    );
  }

  List<UpcomingPayment> get _filteredPayments {
    if (_searchQuery.isEmpty) return _allPayments;
    return _allPayments
        .where((p) => p.title.toLowerCase().contains(_searchQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: const VestrollAppBar(
        title: 'Upcoming payments',
        isBack: true,
        actions: [],
      ),
      body: Column(
        children: [
          _buildSearchBar(colors, fonts),
          Expanded(
            child:
                _filteredPayments.isEmpty
                    ? const UpcomingPaymentsEmptyState()
                    : _buildPaymentsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: colors.bgB0,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: colors.gray200),
              ),
              child: TextField(
                controller: _searchController,
                style: fonts.textMdRegular.copyWith(
                  color: colors.textPrimary,
                  fontSize: 15.sp,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: fonts.textMdRegular.copyWith(
                    color: colors.textTertiary,
                    fontSize: 15.sp,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: colors.textTertiary,
                    size: 20.sp,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: _showFilterBottomSheet,
            child: Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: colors.bgB0,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: colors.gray200),
              ),
              child: Icon(Icons.tune, color: colors.textPrimary, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentsList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: _filteredPayments.length,
      itemBuilder: (context, index) {
        return UpcomingPaymentCard(payment: _filteredPayments[index]);
      },
    );
  }
}
