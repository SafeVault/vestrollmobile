import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/finance_bottom_sheet.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/balance_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/home_transaction_item.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/upcoming_payment_list_item.dart';
import 'package:vestrollmobile/shared/widgets/bottom_navigation_bar.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: VestrollAppBar(
        title: 'Finance',
        isBack: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded, color: colors.textPrimary),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const TotalBalanceCard(balance: 5050.00),
          ),
          SizedBox(height: 24.h),
          _buildTabs(colors, fonts),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTransactionsList(colors, fonts),
                _buildUpcomingPaymentsList(colors, fonts),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeTab: BottomNavTab.finance,
        onFinanceTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const FinanceBottomSheet(),
          );
        },
      ),
    );
  }

  Widget _buildTabs(ColorSystemExtension colors, AppFontThemeExtension fonts) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.strokePrimary)),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: colors.brandDefault,
        indicatorWeight: 3,
        labelColor: colors.textPrimary,
        unselectedLabelColor: colors.textTertiary,
        labelStyle: fonts.textSmBold,
        unselectedLabelStyle: fonts.textSmMedium,
        tabs: const [
          Tab(text: 'Transactions'),
          Tab(text: 'Upcoming Payments'),
        ],
      ),
    );
  }

  Widget _buildTransactionsList(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return ListView.separated(
      padding: EdgeInsets.all(20.w),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return HomeTransactionListItem(
          title: index % 2 == 0 ? 'Withdrawal' : 'Payment Received',
          subtitle: '06:30 PM',
          amount: index % 2 == 0 ? '- 581 USDT' : '+ 1,200 USDT',
          status: 'Successful',
          statusColor: colors.green500,
          onTap: () {},
          icon: Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: index % 2 == 0 ? colors.red500.withOpacity(0.1) : colors.green500.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              index % 2 == 0 ? Icons.arrow_outward_rounded : Icons.arrow_downward_rounded,
              color: index % 2 == 0 ? colors.red500 : colors.green500,
              size: 20.sp,
            ),
          ),
        );
      },
    );
  }

  Widget _buildUpcomingPaymentsList(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return ListView.separated(
      padding: EdgeInsets.all(20.w),
      itemCount: 3,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return UpcomingPaymentListItem(
          title: 'Contract Payment #$index',
          date: '20 April 2025',
          amount: '500 USDT',
          status: 'Due in 2 days',
          statusColor: colors.brandDefault,
          icon: Icons.receipt_long_rounded,
          iconBackgroundColor: colors.brandDefault.withOpacity(0.1),
          onTap: () {},
        );
      },
    );
  }
}
