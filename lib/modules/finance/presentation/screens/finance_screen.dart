import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/transaction_model.dart';
import 'package:vestrollmobile/modules/finance/domain/upcoming_payment_model.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/transaction_list_item.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/upcoming_payment_card.dart';
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

  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'Withdrawal',
      time: '06:30 PM',
      amount: '- 581 USDT',
      status: TransactionStatus.processing,
      iconBackgroundColor: Color(0xFF3B82F6),
      icon: Icons.account_balance_wallet,
      date: DateTime(2025, 4, 21),
      type: TransactionType.withdrawal,
    ),
    Transaction(
      id: '2',
      title: 'ShopLink Pro UX Audit',
      time: '01:22 PM',
      amount: '+ 581 USDT',
      status: TransactionStatus.successful,
      iconBackgroundColor: Color(0xFFEC4899),
      icon: Icons.shopping_bag,
      date: DateTime(2025, 4, 21),
      type: TransactionType.contractPayment,
    ),
    Transaction(
      id: '3',
      title: 'Neurolytix Initial consultation',
      time: '09:05 AM',
      amount: '+ 581 USDT',
      status: TransactionStatus.successful,
      iconBackgroundColor: Color(0xFFF97316),
      icon: Icons.receipt,
      date: DateTime(2025, 4, 21),
      type: TransactionType.invoice,
    ),
    Transaction(
      id: '4',
      title: 'MintForge Bug fixes and updates',
      time: '05:55 PM',
      amount: '+ 581 USDT',
      status: TransactionStatus.successful,
      iconBackgroundColor: Color(0xFF8B5CF6),
      icon: Icons.bug_report,
      date: DateTime(2025, 4, 21),
      type: TransactionType.quickpay,
    ),
    Transaction(
      id: '5',
      title: 'Brightfolk Payment for project',
      time: '12:10 PM',
      amount: '+ 581 USDT',
      status: TransactionStatus.failed,
      iconBackgroundColor: Color(0xFFEC4899),
      icon: Icons.payment,
      date: DateTime(2025, 4, 19),
      type: TransactionType.contractPayment,
    ),
  ];

  final List<UpcomingPayment> _upcomingPayments = [
    UpcomingPayment(
      id: '1',
      title: 'Brightfolk Payment for contract',
      amount: '50',
      currency: 'EURt',
      estimatedDate: DateTime(2025, 4, 20),
      status: UpcomingPaymentStatus.overdue,
      iconBackgroundColor: Color(0xFF8B5CF6),
      icon: Icons.account_balance_wallet,
      type: PaymentType.contract,
      contractType: ContractType.payg,
    ),
    UpcomingPayment(
      id: '2',
      title: 'Neurolytix Initial consultation',
      amount: '581',
      currency: 'LUSD',
      estimatedDate: DateTime(2025, 4, 27),
      status: UpcomingPaymentStatus.inDays,
      daysRemaining: 7,
      iconBackgroundColor: Color(0xFFF97316),
      icon: Icons.receipt_long,
      type: PaymentType.invoice,
    ),
    UpcomingPayment(
      id: '3',
      title: 'MintForge Bug fixes and updates',
      amount: '581',
      currency: 'USDT',
      estimatedDate: DateTime(2025, 4, 20),
      status: UpcomingPaymentStatus.overdue,
      iconBackgroundColor: Color(0xFF8B5CF6),
      icon: Icons.account_balance_wallet,
      type: PaymentType.contract,
      contractType: ContractType.milestone,
    ),
  ];

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
      appBar: VestrollAppBar(title: 'Finance', isBack: false),
      body: Column(
        children: [
          _buildWalletCard(colors, fonts),
          SizedBox(height: 12.h),
          _buildQuickActions(colors, fonts),
          SizedBox(height: 12.h),
          _buildTabBar(colors, fonts),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTransactionsTab(colors, fonts),
                _buildUpcomingPaymentsTab(colors, fonts),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeTab: BottomNavTab.finance,
      ),
    );
  }

  Widget _buildWalletCard(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.brandDefault, colors.brandActive],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Balance',
                style: fonts.textSmRegular.copyWith(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 13.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'USDT',
                  style: fonts.textXsMedium.copyWith(
                    color: Colors.white,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            '\$5,050.00',
            style: fonts.heading2Bold.copyWith(
              color: Colors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.arrow_upward, color: Colors.greenAccent, size: 14.sp),
              SizedBox(width: 4.w),
              Text(
                '+2.4% this month',
                style: fonts.textXsMedium.copyWith(
                  color: Colors.greenAccent,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final actions = [
      (Icons.add_circle_outline_rounded, 'Add Money', null),
      (Icons.send_rounded, 'Transfer', null),
      (Icons.account_balance_wallet_outlined, 'Withdraw', null),
      (Icons.history_rounded, 'Transactions', RouteConstants.transactionsScreen),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.strokePrimary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: actions.map((action) {
          return GestureDetector(
            onTap: () {
              if (action.$3 != null) {
                context.pushNamed(action.$3!);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: colors.brandDefault.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    action.$1,
                    color: colors.brandDefault,
                    size: 22.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  action.$2,
                  style: fonts.textXsMedium.copyWith(
                    color: colors.textSecondary,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTabBar(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.strokePrimary),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: colors.constantContrast,
        unselectedLabelColor: colors.textSecondary,
        labelStyle: fonts.textSmMedium.copyWith(fontSize: 13.sp),
        unselectedLabelStyle: fonts.textSmMedium.copyWith(fontSize: 13.sp),
        indicator: BoxDecoration(
          color: colors.brandDefault,
          borderRadius: BorderRadius.circular(10.r),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        padding: EdgeInsets.all(4.w),
        tabs: const [
          Tab(text: 'Transactions'),
          Tab(text: 'Upcoming'),
        ],
      ),
    );
  }

  Widget _buildTransactionsTab(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      itemCount: _transactions.length,
      separatorBuilder: (_, __) => SizedBox(height: 2.h),
      itemBuilder: (context, index) {
        final transaction = _transactions[index];
        return Container(
          decoration: BoxDecoration(
            color: colors.bgB0,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: colors.strokePrimary),
          ),
          child: TransactionListItem(
            transaction: transaction,
            onTap: () => context.pushNamed(
              RouteConstants.transactionDetails,
              extra: transaction,
            ),
          ),
        );
      },
    );
  }

  Widget _buildUpcomingPaymentsTab(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      itemCount: _upcomingPayments.length,
      separatorBuilder: (_, __) => SizedBox(height: 4.h),
      itemBuilder: (context, index) {
        return UpcomingPaymentCard(payment: _upcomingPayments[index]);
      },
    );
  }
}
