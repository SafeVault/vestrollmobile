import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/account_setup_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/balance_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/empty_state_section.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/quick_action_section.dart';
import 'package:vestrollmobile/shared/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              // Header Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome! 👋',
                          style: fonts.bodyMedium.copyWith(
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
                    // Notification Bell
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: colors.bgB0,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.notifications_outlined,
                          color: colors.textPrimary,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Balance Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: TotalBalanceCard(
                  balance: 0.00,
                  percentageChange: -0.00,
                  amountChange: 0.00,
                  onTap: () {
                    // Navigate to balance details
                  },
                ),
              ),

              // Account Setup Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AccountSetupCard(
                  progress: 0.2, // 20%
                  onTap: () {
                    // Navigate to account setup
                  },
                ),
              ),

              SizedBox(height: 24.h),

              // Quick Actions Section
              const QuickActionsSection(),

              SizedBox(height: 24.h),

              // Contracts Section
              EmptyStateSection(
                title: 'Contracts',
                onSeeAll: () {
                  // context.pushNamed(RouteConstants.contracts);
                },
              ),

              SizedBox(height: 24.h),

              // Transactions Section
              EmptyStateSection(
                title: 'Transactions',
                onSeeAll: () {
                  // context.pushNamed(RouteConstants.transactions);
                },
              ),

              SizedBox(height: 24.h),

              // Upcoming Payments Section
              EmptyStateSection(
                title: 'Upcoming payments',
                onSeeAll: () {
                  // context.pushNamed(RouteConstants.upcomingPayments);
                },
              ),

              SizedBox(height: 100.h), // Space for bottom nav
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
