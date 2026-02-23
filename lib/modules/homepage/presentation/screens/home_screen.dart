 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/upcoming_payment_model.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/finance_bottom_sheet.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/account_setup_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/balance_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/contract_list_item.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/empty_state_section.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/home_transaction_item.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/quick_action_section.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/upcoming_payment_list_item.dart';
import 'package:vestrollmobile/shared/widgets/bottom_navigation_bar.dart';

// Add this enum if not already defined elsewhere
enum EmptyStateType {
  contracts,
  transactions,
  payments,
}

// Add this enum for contract status
enum ContractStatus {
  active,
  pending,
  expired,
}

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
              // Updated Header - removed notification icon (now in balance card)
              _buildHeader(colors, fonts),
              SizedBox(height: 16.h),
              
              // Updated Balance Card with notification icon
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TotalBalanceCard(
                  balance: 5050.00,
                  onNotificationTap: () {
                    // Handle notification tap
                    print('Notification tapped');
                  },
                ),
              ),
              
              // Account Setup Card (shows when _isEmpty is true)
              if (_isEmpty) ...[
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: AccountSetupCard(progress: 0.2, onTap: () {}),
                ),
              ],
              
              SizedBox(height: 16.h),
              
              // Timeline Beta Banner
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GestureDetector(
                  onTap: () => context.pushNamed(RouteConstants.timelineShowcase),
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
              
              // Quick Actions Section
              const QuickActionsSection(),
              
              SizedBox(height: 24.h),
              
              // Contracts Section with Empty State
              _buildSection(
                title: 'Contracts',
                isEmpty: _isEmpty,
                onSeeAll: () {},
                type: EmptyStateType.contracts,
                content: _buildContractsList(colors, fonts),
              ),
              
              SizedBox(height: 24.h),
              
              // Transactions Section with Empty State
              _buildSection(
                title: 'Transactions',
                isEmpty: _isEmpty,
                onSeeAll: () {},
                type: EmptyStateType.transactions,
                content: _buildTransactionsList(colors, fonts),
              ),
              
              SizedBox(height: 24.h),
              
              // Upcoming Payments Section
              _buildSection(
                title: 'Upcoming payments',
                isEmpty: _isEmpty,
                onSeeAll: () {
                  context.pushNamed(RouteConstants.upcomingPayments);
                },
                type: EmptyStateType.payments,
                content: _buildUpcomingPaymentsList(colors, fonts),
              ),
              
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
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

  // Updated Header - removed notification icon
  Widget _buildHeader(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
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
    );
  }

  // Updated Section Builder with EmptyStateType
  Widget _buildSection({
    required String title,
    required bool isEmpty,
    required VoidCallback onSeeAll,
    required EmptyStateType type,
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
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              InkWell(
                onTap: onSeeAll,
                borderRadius: BorderRadius.circular(4.r),
                splashColor: colors.brandDefault.withOpacity(0.1),
                highlightColor: colors.brandDefault.withOpacity(0.05),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See all',
                        style: fonts.textSmMedium.copyWith(
                          fontSize: 14.sp,
                          color: colors.brandDefault,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.chevron_right,
                        color: colors.brandDefault,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: isEmpty
              ? EmptyStateSection(
                  type: type,
                  onSeeAll: onSeeAll,
                )
              : content,
        ),
      ],
    );
  }

  // Updated Contracts List with ContractStatus enum
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
          status: ContractStatus.pending,
          initials: 'WF',
          avatarColor: colors.green500,
          onTap: () {},
        ),
        ContractListItem(
          title: 'Quikdash Mobile & Web...',
          subtitle: 'Milestone Contract',
          amount: '581 STRK',
          status: ContractStatus.pending,
          initials: 'QM',
          avatarColor: colors.orange500,
          onTap: () {},
        ),
        ContractListItem(
          title: 'VestRoll Mobile & Web...',
          subtitle: 'Fixed Rate Contract',
          amount: '581 USDT',
          status: ContractStatus.active,
          initials: 'DM',
          avatarColor: colors.brandContrast ?? Colors.purple,
          onTap: () {},
        ),
      ],
    );
  }

  // Updated Transactions List - keeping the stacked icons (they're already good)
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
          onTap: () {},
          icon: Stack(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF3B82F6), // Blue
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
                  width: 18.w,
                  height: 18.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_upward,
                      color: Color(0xFFEF4444), // Red
                      size: 12.sp,
                    ),
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
          onTap: () {},
          icon: Stack(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981), // Green
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
                  width: 18.w,
                  height: 18.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check, color: Color(0xFF10B981), size: 12.sp),
                  ),
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
          onTap: () {},
          icon: Stack(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFF59E0B), // Orange
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
                  width: 18.w,
                  height: 18.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.check, color: Color(0xFF10B981), size: 12.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Upcoming Payments List (unchanged)
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
          iconBackgroundColor: colors.brandContrast ?? Colors.purple,
          paymentType: PaymentType.contract,
          onTap: () {},
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
          onTap: () {},
        ),
        UpcomingPaymentListItem(
          title: 'MintForge Bug fixes an...',
          date: '20 April 2025',
          amount: '581 USDT',
          status: 'Overdue',
          statusColor: colors.orange500,
          icon: Icons.account_balance_wallet,
          iconBackgroundColor: colors.brandContrast ?? Colors.purple,
          paymentType: PaymentType.contract,
          onTap: () {},
        ),
      ],
    );
  }
}