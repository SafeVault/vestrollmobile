import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/upcoming_payment_model.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/account_setup_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/balance_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/contract_list_item.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/empty_state_section.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/home_transaction_item.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/quick_action_section.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/upcoming_payment_list_item.dart';
import 'package:vestrollmobile/shared/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Toggle this to see empty vs filled states
  bool _isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(colors, fonts),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TotalBalanceCard(
                  balance: 5050.00,
                  percentageChange: -0.0051,
                  amountChange: 0.99,
                  onTap: () {
                    setState(() {
                      _isEmpty = !_isEmpty;
                    });
                  },
                ),
              ),
              if (_isEmpty) ...[
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: AccountSetupCard(progress: 0.2, onTap: () {}),
                ),
              ],
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GestureDetector(
                  onTap:
                      () => context.pushNamed(RouteConstants.timelineShowcase),
                  child: Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      color: colors.brandDefault.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: colors.brandDefault.withOpacity(0.1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'View High-Fidelity Timelines (Beta)',
                          style: fonts.textSmMedium.copyWith(
                            color: colors.brandDefault,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: colors.brandDefault,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              const QuickActionsSection(),
              SizedBox(height: 24.h),
              _buildSection(
                title: 'Contracts',
                isEmpty: _isEmpty,
                onSeeAll: () {},
                emptyAsset: AppAssets.contractEmpty,
                content: _buildContractsList(colors, fonts),
              ),
              SizedBox(height: 24.h),
              _buildSection(
                title: 'Transactions',
                isEmpty: _isEmpty,
                onSeeAll: () {},
                emptyAsset: AppAssets.transactionEmpty,
                content: _buildTransactionsList(colors, fonts),
              ),
              SizedBox(height: 24.h),
              _buildSection(
                title: 'Upcoming payments',
                isEmpty: _isEmpty,
                onSeeAll: () {
                  context.pushNamed(RouteConstants.upcomingPayments);
                },
                emptyAsset: AppAssets.transactionEmpty,
                content: _buildUpcomingPaymentsList(colors, fonts),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }

  Widget _buildHeader(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: fonts.textSmRegular.copyWith(
                  fontSize: 14.sp,
                  color: colors.textSecondary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Adebisi Adeyemi',
                style: fonts.heading2Bold.copyWith(
                  fontSize: 20.sp,
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: colors.bgB0,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(AppAssets.notificationHome),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: colors.red500,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.bgB0, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required bool isEmpty,
    required VoidCallback onSeeAll,
    required String emptyAsset,
    required Widget content,
  }) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: fonts.heading3Bold.copyWith(
                  fontSize: 16.sp,
                  color: colors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: Row(
                  children: [
                    Text(
                      'See all',
                      style: fonts.textSmMedium.copyWith(
                        color: colors.brandContrast,
                        fontSize: 14.sp,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: colors.brandContrast,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child:
              isEmpty
                  ? EmptyStateSection(
                    assetImage: emptyAsset,
                    title: title,
                    onSeeAll: onSeeAll,
                  )
                  : content,
        ),
      ],
    );
  }

  Widget _buildContractsList(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      children: [
        ContractListItem(
          title: 'Weave Finance Mobile &...',
          subtitle: 'Pay As You Go Contract',
          amount: '50 EURt',
          status: 'Pending',
          statusColor: colors.orange500,
          initials: 'WF',
          avatarColor: colors.green500,
        ),
        ContractListItem(
          title: 'Quikdash Mobile & Web...',
          subtitle: 'Milestone Contract',
          amount: '581 STRK',
          status: 'Pending',
          statusColor: colors.orange500,
          initials: 'QM',
          avatarColor: colors.orange500,
        ),
        ContractListItem(
          title: 'VestRoll Mobile & Web...',
          subtitle: 'Fixed Rate Contract',
          amount: '581 USDT',
          status: 'Active',
          statusColor: colors.green500,
          initials: 'DM',
          avatarColor: colors.brandContrast,
        ),
      ],
    );
  }

  Widget _buildTransactionsList(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      children: [
        HomeTransactionListItem(
          title: 'Withdrawal',
          subtitle: '06:30 PM',
          amount: '- 581 USDT',
          status: 'Processing',
          statusColor: colors.orange500,
          icon: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                    size: 10.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        HomeTransactionListItem(
          title: 'MintForge Bug fixes a...',
          subtitle: '01:22 PM',
          amount: '+ 21 USDC',
          status: 'Successful',
          statusColor: colors.green500,
          icon: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.payment, color: Colors.white, size: 20.sp),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.green, size: 10.sp),
                ),
              ),
            ],
          ),
        ),
        HomeTransactionListItem(
          title: 'Neurolytix Initial cons...',
          subtitle: '09:05 AM',
          amount: '+ 581 USDT',
          status: 'Successful',
          statusColor: colors.green500,
          icon: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.receipt_long,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.green, size: 10.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingPaymentsList(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      children: [
        UpcomingPaymentListItem(
          title: 'Brightfolk Payment for c...',
          date: '20 April 2025',
          amount: '50 EURt',
          status: 'Overdue',
          statusColor: colors.orange500,
          icon: Icons.account_balance_wallet,
          iconBackgroundColor: colors.brandContrast,
          paymentType: PaymentType.contract,
        ),
        UpcomingPaymentListItem(
          title: 'Neurolytix Initial consul...',
          date: '20 April 2025',
          amount: '581 LUSD',
          status: 'In 7 days',
          statusColor: Colors.blue,
          icon: Icons.receipt_long,
          iconBackgroundColor: Colors.orange,
          paymentType: PaymentType.invoice,
        ),
        UpcomingPaymentListItem(
          title: 'MintForge Bug fixes an...',
          date: '20 April 2025',
          amount: '581 USDT',
          status: 'Overdue',
          statusColor: colors.orange500,
          icon: Icons.account_balance_wallet,
          iconBackgroundColor: colors.brandContrast,
          paymentType: PaymentType.contract,
        ),
      ],
    );
  }
}
