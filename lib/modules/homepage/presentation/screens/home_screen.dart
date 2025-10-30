import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;
  bool _showBalance = true;

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

              // Wallet Tab Bar
              WalletTabBar(
                selectedIndex: _selectedTabIndex,
                onTabChanged: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
              ),

              // Balance Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: BalanceCard(
                  showBalance: _showBalance,
                  onToggleVisibility: () {
                    setState(() {
                      _showBalance = !_showBalance;
                    });
                  },
                ),
              ),

              // Account Setup Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const AccountSetupCard(),
              ),

              SizedBox(height: 24.h),

              // Quick Actions Section
              const QuickActionsSection(),

              SizedBox(height: 24.h),

              // Contracts Section
              EmptyStateSection(
                title: 'Contracts',
                onSeeAll: () {
                  context.pushNamed(RouteConstants.contracts);
                },
              ),

              SizedBox(height: 24.h),

              // Transactions Section
              EmptyStateSection(
                title: 'Transactions',
                onSeeAll: () {
                  context.pushNamed(RouteConstants.transactions);
                },
              ),

              SizedBox(height: 24.h),

              // Upcoming Payments Section
              EmptyStateSection(
                title: 'Upcoming payments',
                onSeeAll: () {
                  context.pushNamed(RouteConstants.upcomingPayments);
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
